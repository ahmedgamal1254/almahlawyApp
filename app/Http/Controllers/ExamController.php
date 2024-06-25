<?php

namespace App\Http\Controllers;

use App\Models\Exam;
use App\Http\Requests\StoreExamRequest;
use App\Http\Requests\UpdateExamRequest;
use App\Jobs\NotificationExamJob;
use App\Models\Question;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\MakeDate;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use PDF;

class ExamController extends Controller
{
    use MakeDate;

    public function index()
    {
        try {
            $exams=Exam::with("stage")->withCount("questions")
            ->orderByDesc("created_at")
            ->paginate(10);

            return view("Teacher.exams.index",compact('exams'));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"حدث خطا ما");
        }
    }

    public function create()
    {
       try {
        $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
        $units=DB::table("units")->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

        return view("Teacher.exams.add",compact("school_grades","units"));
       } catch (\Throwable $th) {
        return redirect()->back()->with('error',"عفوا حدث خطأ ما");
       }
    }

    public function store(StoreExamRequest $request)
    {
        try {
            $data='';
            foreach ($request->units as $unit) {
                $data.=$unit["name"];
                $data.=',';
            }

            DB::beginTransaction();

            $exam=new Exam();
            $exam->code=rand(1000000,999999999);
            $exam->title=$request->title;
            $exam->description=$request->description;
            $exam->duration=$request->duration;
            $exam->date_exam=$this->make_date($request->date_exam);
            $exam->start_time=$request->time_start;
            $exam->end_time=$request->time_end;
            $exam->school_grade_id=$request->school_grade_id;
            $exam->subject_id=Auth::guard('teacher')->user()->subject_id;
            $exam->units_id=substr($data,0,strlen($data)-1);
            $exam->teacher_id=Auth::guard('teacher')->user()->id;
            $exam->save();

            $questions = [];

            foreach ($request->units as $unit) {
                $unitQuestions = Question::whereHas('unit', function ($query) use ($unit) {
                    $query->where('id', $unit["name"]);
                })->inRandomOrder()->take($unit["number"])->pluck('id')->toArray();

                $questions = array_merge($questions, $unitQuestions);
            }

            $exam->questions()->attach($questions);

            $users=User::where("school_grade_id","=",$request->school_grade_id)->get();
            NotificationExamJob::dispatch($users,$exam);

            DB::commit();

            return redirect()->route("exams")->with('message','تم اضافة الامتحان بنجاح');
        } catch (\Throwable $th) {
            DB::rollBack();

            echo $th->getMessage();
            // return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {

        try {
            $exam=DB::table('exams')
            ->join('school_grades', 'exams.school_grade_id', '=', 'school_grades.id')
            ->join('subjects', 'exams.subject_id', '=', 'subjects.id')
            ->select('exams.*', 'subjects.title as subject_name', 'school_grades.name as school_grade')
            ->where('exams.id','=',$id)
            ->first();

            if (!$exam) {
                // If the exam is not found, return back with a message
                return back()->with('error', 'هذا الامتحان غير موجود' . $id);
            }

            $questions=DB::table('question_exams')
            ->join('exams', 'question_exams.exam_id', '=', 'exams.id')
            ->join('questions', 'question_exams.question_id', '=', 'questions.id')
            ->select('questions.*','exams.id','exams.code')
            ->where('exams.id','=',$id)
            ->paginate(15);

            return view("Teacher.exams.show",compact("exam","questions"));
        } catch (\Exception $e) {
            // Handle other exceptions
            $message = $e->getMessage();
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }

    }

    public function edit($id)
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $exam=Exam::findOrFail($id);

            if (!$exam) {
                // If the exam is not found, return back with a message
                return back()->with('error', 'هذا الامتحان غير موجود' . $id);
            }

            return view("Teacher.exams.edit",compact("school_grades","exam"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function update(UpdateExamRequest $request, Exam $exam)
    {
        try {
            $exam=Exam::find($request->id);
            $exam->title=$request->title;
            $exam->description=$request->description;
            $exam->duration=$request->duration;
            $exam->date_exam=$this->make_date($request->date_exam);
            $exam->start_time=$request->start_time;
            $exam->end_time=$request->end_time;
            $exam->subject_id=Auth::guard('teacher')->user()->subject_id;
            $exam->teacher_id=Auth::guard('teacher')->user()->id;
            $exam->save();

            return redirect()->route("exams")->with('message','تم الحفظ بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function destroy($id)
    {
        try {
            $exam = Exam::findOrFail($id);
            $exam->delete();

            return redirect()->route("exams")->with('message','تم الحذف بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function printExam($id)
    {
        try {
            $exam = Exam::with(['questions'  => function($query) {
                $query->inRandomOrder();
            },"stage"])->findOrFail($id);

            $alphabet=["a","b","c","d","e","f"];

            $pdf = PDF::loadView('Teacher.exams.print', ['exam' => $exam,"chars"=>$alphabet]);

            return $pdf->stream('document.pdf');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function students($id){
        try{
            $students=DB::table('users')
            ->join('exam_student', 'exam_student.user_id', '=', 'users.id')
            ->join('exams', 'exam_student.exam_id', '=', 'exams.id')
            ->leftJoin('question_exam_students', function ($join) use($id){
                $join->on('question_exam_students.user_id', '=', 'users.id')
                ->where("question_exam_students.exam_id",$id);
            })
            ->select(
                'users.id',
                "exams.id as exam_id",
                "users.name",
                "exam_student.created_at",
                "degree",
                "total",
                DB::raw('COUNT(DISTINCT question_exam_students.question_id) as question_exam_students_count')
            )
            ->where("exams.id",$id)
            ->groupBy('users.id', 'exam_student.created_at', 'degree', 'total', 'exams.id')
            ->paginate(20);

            return view("Teacher.exams.students",compact("students"));
        }catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
