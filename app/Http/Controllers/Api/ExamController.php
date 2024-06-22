<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Support\Facades\Auth;

use App\Models\{Exam, ExamStudent,Question_Exam_Student};
use Illuminate\Support\Facades\Validator;

class ExamController extends Controller
{
    use ResponseRequest;

    public function index(){
        $user = Auth::guard("api")->user();

        // Extract months and school grade ID from the user
        $months = $user->months;
        $schoolGradeId = $user->school_grade_id;

        $exams=DB::table('exams')
        ->leftJoin("exam_student",function ($join) use ($user) {
            $join->on("exams.id","=","exam_student.exam_id")
            ->where("exam_student.user_id","=",$user->id);
        })
        ->select("exams.id","title","description","code","duration","start_time",
        "end_time","date_exam",'exam_student.degree','exam_student.total')
        ->where(function ($query) use ($months) {
            foreach ($months as $month) {
                $year = date('Y', strtotime($month->month_date));
                $month = date('m', strtotime($month->month_date));
                $query->orWhere(function ($query) use ($year, $month) {
                    $query->whereYear('date_exam', '=', $year)
                          ->whereMonth('date_exam', '=', $month);
                });
            }
        })
        ->where("school_grade_id","=",$schoolGradeId)->orderByDesc("id")->get();

        return $this->make_response($exams,200);
    }

    public function show($id){
        $userId = Auth::guard('api')->id();
        $student_degree=DB::table('exam_student')->where("user_id","=",$userId)->where("exam_id","=",$id)->first();

        if ($student_degree) {
            $questions = $this->getExamQuestionsWithStudentAnswers($id, $userId);
        } else {
            $questions = $this->getExamQuestionsWithoutStudentAnswers($id);
        }

        $data["exam_id"]=$id;
        $data["degree"]=$student_degree?$student_degree->degree:NULL;
        $data["total"]=$student_degree?$student_degree->total:NULL;
        $data["count"]=count($questions);
        $data["questions"]=$questions;

        return response()->json(
            [
                "success" => true,
                "is_examed" => $student_degree ? true:false,
                "status" => 200,
                "data" => $data
            ],200
        );
    }

    public function send_exam(Request $request){
        // validation exam id , question array
        $validator = Validator::make($request->all(), [
            'exam_id' => 'required|integer|exists:exams,id',
            'questions' => 'required|array',
            'questions.*.id' => 'required|integer|exists:questions,id',
            'questions.*.answer' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $userId = Auth::guard('api')->id();
        $examId = $request->exam_id;
        $schoolGradeId = Auth::guard('api')->user()->school_grade_id;

        try {
            DB::beginTransaction();

            foreach ($request->questions as $question) {
                //store question and answer in Question_Exam_Student
                Question_Exam_Student::updateOrCreate([
                    "exam_id" => $examId,
                    "user_id" => $userId,
                    "question_id" => $question["id"],
                ],[
                    "exam_id" => $examId,
                    "user_id" => $userId,
                    "student_answer" => $question["answer"],
                    "question_id" => $question["id"],
                    "school_grade_id" =>$schoolGradeId
                ]);

            }

            // collect degree
            $exam_student=DB::table("question_exam_students")->join("questions","questions.id","=","question_exam_students.question_id")
            ->select("questions.answer","questions.degree","question_exam_students.student_answer")
            ->where("question_exam_students.exam_id","=",$examId)
            ->where("question_exam_students.user_id","=",$userId)->get();

            $degree=0;
            $total=Exam::find($examId)->questions->sum("degree");

            foreach ($exam_student as $value) {
                if($value->answer==$value->student_answer){
                    $degree+=$value->degree;
                }
            }


            // store or update degre of exam
            $student_degree=DB::table('exam_student')->where("user_id","=",$userId)
            ->where("exam_id","=",$examId)->first();

            if($student_degree == null){
                $exam=new ExamStudent();
                $exam->user_id=$userId;
                $exam->exam_id=$examId;
                $exam->status=0;
                $exam->degree=$degree;
                $exam->total=$total;
                $exam->save();
            }

            DB::commit();

            $data["status"]=true;
            $data["congrats"]="تم اجراء الامتحان بنجاح";
            $data["degree"]=$degree;
            $data["total"]=$total;
            $data["percent"]=round(($degree/$total)*100,2);

            return $this->make_response($data,200);
        } catch (\Throwable $th) {
            DB::rollBack();

            return response()->json([
                "error" => "error happend,please send to adminstrator",
                "status" => 500,
                "success" => false
            ],500);
        }
    }

    private function question_exists($exam_id,$question_id){
        $question=Question_Exam_Student::where("exam_id","=",$exam_id)->where("question_id","=",$question_id)
        ->where("user_id","=",Auth::guard('api')->user()->id)->first();

        if($question == null){
            return 0;
        }else{
            return $question->id;
        }
    }

    public function show_exam_results($id){
        $userId=Auth::guard("api")->id();

        $questions=$this->getExamQuestionsWithStudentAnswers($id,$userId);

        return $this->make_response($questions,200);
    }

    private function getExamQuestionsWithStudentAnswers($examId, $userId)
    {
        $questions = DB::table('questions')
            ->leftJoin('question_exams', 'question_exams.question_id', '=', 'questions.id')
            ->leftJoin('question_exam_students', function($join) use ($userId) {
                $join->on('question_exam_students.question_id', '=', 'questions.id')
                    ->where('question_exam_students.user_id', '=', $userId);
            })
            ->select('questions.id', 'question_exam_students.student_answer',
                'question_exam_students.exam_id', 'questions.name', 'questions.img', 'questions.answer', 'questions.chooses')
            ->where('question_exams.exam_id', $examId)
            ->groupBy("questions.id")
            ->get();

        return $questions->map(function ($question) {
            return [
                'question_id' => $question->id,
                'question_title' => $question->name ?? null,
                'question_image' => $question->img ?? null,
                'question_answers' => json_decode($question->chooses, true),
                'student_answer' => $question->student_answer ?? null,
                'correct_answer' => $question->answer
            ];
        });
    }

    private function getExamQuestionsWithoutStudentAnswers($examId)
    {
        $questions = DB::table('question_exams')
            ->join('questions', 'questions.id', '=', 'question_exams.question_id')
            ->join('exams', 'exams.id', '=', 'question_exams.exam_id')
            ->select('questions.name', 'questions.img', 'questions.id', 'questions.chooses', 'questions.answer')
            ->where('question_exams.exam_id', $examId)
            ->get();

        return $questions->map(function ($question) {
            return [
                'question_id' => $question->id,
                'question_title' => $question->name ?? null,
                'question_image' => $question->img ?? null,
                'question_answers' => json_decode($question->chooses, true),
            ];
        });
    }
}
