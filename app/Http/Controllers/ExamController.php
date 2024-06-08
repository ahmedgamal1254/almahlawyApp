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
            $exams=DB::table('exams')
            ->join('school_grades', 'exams.school_grade_id', '=', 'school_grades.id')
            ->join('subjects', 'exams.subject_id', '=', 'subjects.id')
            ->select('exams.*', 'subjects.title as subject_name', 'school_grades.name as school_grade')
            ->where("exams.teacher_id","=",Auth::guard('teacher')->user()->id)
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
                $data.=$unit;
                $data.=',';
            }

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

            // questions per unit  ==> count q / count unit ==> 3 ==> 2 2

            foreach ($request->units as $unit) {
                $unitQuestions = Question::whereHas('unit', function ($query) use ($unit) {
                    $query->where('id', $unit);
                })->inRandomOrder()->take($request->count_question/count($request->units))->pluck('id')->toArray();

                $questions = array_merge($questions, $unitQuestions);
            }

            $exam->questions()->attach($questions);

            $users=User::where("school_grade_id","=",$request->school_grade_id)->get();
            NotificationExamJob::dispatch($users,$exam);

            return redirect()->route("exams")->with('message','تم اضافة الامتحان بنجاح');
        } catch (\Throwable $th) {
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
            ->paginate(5);

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
            $units=DB::table("units")->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();
            $exam=Exam::findOrFail($id);

            if (!$exam) {
                // If the exam is not found, return back with a message
                return back()->with('error', 'هذا الامتحان غير موجود' . $id);
            }

            return view("Teacher.exams.edit",compact("school_grades","units","exam"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function update(UpdateExamRequest $request, Exam $exam)
    {
        try {
            // return $request->all();
            $data='';
            foreach ($request->all() as $key => $value) {
                if(str_contains($key, 'unit')){
                    $data.=$value;
                    $data.=',';
                }
            }

            $exam=Exam::find($request->id);
            $exam->code=$request->code;
            $exam->title=$request->title;
            $exam->description=$request->description;
            $exam->duration=$request->duration;
            $exam->date_exam=$this->make_date($request->date_exam);
            $exam->start_time=$request->start_time;
            $exam->units_id=substr($data,0,strlen($data)-1);
            $exam->end_time=$request->end_time;
            $exam->school_grade_id=$request->school_grade_id;
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
        $exam = Exam::findOrFail($id);
        $exam->delete();

        return redirect()->route("exams")->with('message','تم الحذف بنجاح');
    }

    public function printExam($id)
    {
        $exam = Exam::with('questions',"stage")->findOrFail($id);

        $alphabet=["a","b","c","d","e","f"];

        $pdf = PDF::loadView('Teacher.exams.print', ['exam' => $exam,"chars"=>$alphabet]);

        return $pdf->stream('document.pdf');
    }
}
