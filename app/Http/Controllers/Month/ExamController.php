<?php

namespace App\Http\Controllers\Month;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Teacher;
use Illuminate\Http\Request;
use App\Models\{Question_Exam_Student,ExamStudent, User};
use App\Traits\CheckRequest;
use Carbon\Carbon;

class ExamController extends Controller
{
    use CheckRequest;

    public function exams($teacher_id,$id){
        // check if auth id and month id identical
        // if not return user to dashboard
        $value=DB::table('month_student')->where("user_id","=",Auth::user()->id)->where("month_id","=",$id)->count();

        if($value > 0){
            $month=DB::table("months")->where("id","=",$id)->first();

            // extract year and month
            $month_date=explode("-",$month->month_date);

            // year and month
            $year=$month_date[0];
            $month_num=$month_date[1];

            // exams
            $exams=DB::select('SELECT exams.*,subjects.title as subject_name FROM exams inner join subjects on subjects.id=exams.subject_id
            WHERE year(date_exam) = ? AND month(date_exam) = ? AND exams.school_grade_id = ? AND exams.teacher_id=?;',
            [$year,$month_num,Auth::user()->school_grade_id,$teacher_id]);

            // return $teacher
            $teacher=Teacher::where("id","=",$teacher_id)->first();

            // array of data (exams , month , teacher_id , month_id)
            $data["exams"]=$exams;
            $data["month"]=$month;
            $data["teacher_id"]=$teacher_id;
            $data["month_id"]=$id;

            return view("student.exam.index",compact("data","teacher"));
        }else{
            return redirect()->route("student_dashboard");
        }
    }

    public function show_exam(Request $request,$teacher_id,$month_id,$id){
        /**
         * check if request get from link
         * take params $request , route which default git from it and take params
         * then redirect route if not get from this request and params for not
        */
        try{
            $response=$this->check_request($request,"month_page",
            ["teacher_id"=>$teacher_id,"id"=>$month_id],"student_teacher",["id"=>$teacher_id]);

            // check if it not correct request redirect him
            if ($response) {
                return $response;
            }

            // check if auth id and month id identical
            // if not return user to dashboard
            $value=DB::table('month_student')->where("user_id","=",Auth::user()->id)->where("month_id","=",$month_id)->count();

            if($value > 0){
                $month=DB::table("months")->where("id","=",$month_id)->first();

                if(!$month){
                    return redirect()->back()->with('error',' عفوا لا يوجد هذا الشهر'.$id);
                }

                // extract year and month
                $month_date=explode("-",$month->month_date);

                // year and month
                $year=$month_date[0];
                $month_num=$month_date[1];

                // return $teacher
                $teacher=Teacher::where("id","=",$teacher_id)->first();

                $questions=DB::table("question_exams")->join("questions","questions.id","=","question_exams.question_id")
                ->join("exams","exams.id","=","question_exams.exam_id")
                ->select("questions.name","questions.id","questions.chooses","questions.answer","questions.degree","exams.teacher_id as teacher_id")
                ->where("question_exams.exam_id","=",$id)->get();

                $exam=DB::table("exams")->where("id","=",$id)->first();

                // if student start exam before we use variable timer to start exam from it
                $exam_timer=DB::table("exam_timer")->where("exam_id","=",$id)->where("user_id","=",Auth::user()->id)->first();

                // array of data (exams , month , teacher_id , month_id)
                $data["count"]=count($questions);
                $data["questions"]=$questions;
                $data["month"]=$month;
                $data["teacher_id"]=$teacher_id;
                $data["month_id"]=$month_id;
                $data["exam_id"]=$id;
                $data["exam"]=$exam;
                $data["exam_timer"]=$exam_timer == null ? $exam->duration*60:$exam_timer->timer;

                // auth student start exam
                $user =User::find(Auth::user()->id);
                $user->status_exam=1;
                $user->save();

                return view("student.exam.show",compact("data","teacher"));
            }else{
                return redirect()->route("student_dashboard");
            }
        }catch(\Throwable $th){
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function send_exam(Request $request){
        try {
            // extract all request which pattern question
            foreach($request->all() as $key => $value){
                if(str_contains($key, 'answer')){
                    $questionId = substr($key, strlen('question_answer_'));

                    $question=$this->count_question($request->exam_id,$questionId);

                    if($question == 0){
                        //store question and answer in Question_Exam_Student
                        $question_exam_student=new Question_Exam_Student();
                        $question_exam_student->exam_id=$request->exam_id;
                        $question_exam_student->user_id=Auth::user()->id;
                        $question_exam_student->student_answer=$value;
                        $question_exam_student->question_id =$questionId;
                        $question_exam_student->teacher_id=$request->teacher_id;
                        $question_exam_student->school_grade_id=Auth::user()->school_grade_id;
                        $question_exam_student->save();
                    }else{
                        $question_exam_student=Question_Exam_Student::find($question);
                        $question_exam_student->exam_id=$request->exam_id;
                        $question_exam_student->user_id=Auth::user()->id;
                        $question_exam_student->student_answer=$value;
                        $question_exam_student->question_id =$questionId;
                        $question_exam_student->teacher_id=$request->teacher_id;
                        $question_exam_student->school_grade_id=Auth::user()->school_grade_id;
                        $question_exam_student->save();
                    }
                }
            }

            // collect degree
            $exam_student=DB::table("question_exam_students")->join("questions","questions.id","=","question_exam_students.question_id")
            ->select("questions.answer","question_exam_students.student_answer","questions.degree")
            ->where("question_exam_students.exam_id","=",$request->exam_id)
            ->where("question_exam_students.user_id","=",Auth::user()->id)->get();

            // return response($exam_student);
            $degree=0;
            foreach ($exam_student as $value) {
                if($value->answer==$value->student_answer){
                    $degree+=$value->degree;
                }
            }

            // store or update degre of exam
            $student_degree=DB::table('exam_student')->where("user_id","=",Auth::user()->id)
            ->where("exam_id","=",$request->exam_id)->first();

            if($student_degree == null){
                $exam=new ExamStudent();
                $exam->user_id=Auth::user()->id;
                $exam->exam_id=$request->exam_id;
                $exam->status=0;
                $exam->degree=$degree;
                $exam->total=count($exam_student);
                $exam->save();
            }

            $user =User::find(Auth::user()->id);
            $user->status_exam=0;
            $user->save();

            return redirect()->route("exam_result")->with([
                "status" => true,
                "congrats" => "تم اجراء الامتحان بنجاح",
                "degree" => $degree,
                "total" => count($exam_student),
                "percent" => round(($degree/count($exam_student))*100,2),
                "teacher_id"=>$request->teacher_id
            ]);
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function result(){
        return view("student.exam.result");
    }

    public function results(Request $request,$teacher_id,$month_id,$id){
        $response=$this->check_request($request,"month_page",
        ["teacher_id"=>$teacher_id,"id"=>$month_id],"student_teacher",["id"=>$teacher_id]);

        // check if it not correct request redirect him
        if ($response) {
            return $response;
        }

        try {
            $questions=DB::table('question_exam_students')
            ->join('questions','questions.id',"=","question_exam_students.question_id")
            ->join("users","users.id","=","question_exam_students.user_id")
            ->select('questions.id','question_exam_students.student_answer',"questions.degree",
            'question_exam_students.exam_id', 'questions.name','questions.answer','questions.chooses','users.id as user_id')
            ->where("users.id","=",Auth::user()->id)->where('question_exam_students.exam_id',"=",$id)->get();

            $exam=DB::table("exams")->where("id","=",$id)->first();

            if(!$exam){
                return redirect()->back()->with('error',' عفوا لا يوجد هذا الامتحان'.$id);
            }

            if(!$questions){
                return redirect()->back()->with('error',' عفوا ربما لم تم  تمتحن هذا الامتحان من قبل'.$id);
            }

            // return $teacher
            $teacher=Teacher::where("id","=",$teacher_id)->first();

            // array of data (exams , month , teacher_id , month_id)
            $data["count"]=count($questions);
            $data["questions"]=$questions;
            $data["teacher_id"]=$teacher_id;
            $data["month_id"]=$month_id;
            $data["exam"]=DB::table("exams")->where("id","=",$id)->first();

            return view("student.exam.questions",compact("data","teacher"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function count_question($exam_id,$question_id){
        $question=Question_Exam_Student::where("exam_id","=",$exam_id)->where("question_id","=",$question_id)
        ->where("user_id","=",Auth::user()->id)->first();

        if($question == null){
            return 0;
        }else{
            return $question->id;
        }
    }
}
