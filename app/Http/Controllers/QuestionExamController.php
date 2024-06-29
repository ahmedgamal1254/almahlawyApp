<?php

namespace App\Http\Controllers;

use App\Models\Question;
use App\Http\Requests\StoreQuestion_ExamRequest;
use App\Http\Requests\UpdateQuestion_ExamRequest;
use App\Models\Exam;
use App\Models\Question_Exam;
use App\Models\SchoolGrade;
use App\Models\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;

class QuestionExamController extends Controller
{
    use ResponseRequest;
    public function index()
    {
        //
    }

    public function create($id)
    {
        try {
            $exam_id=$id;

            // return exam to get units
            $exam=Exam::find($exam_id);

            if(!$exam){
                return redirect()->back()->with('error', 'هذا الامتحان غير موجود' . $id);
            }

            // split units sring to array to use it in query
            $units=explode(',',$exam->units_id);

            $unit_codes=DB::table("units")
            ->whereIn('id',$units)->get();

            $questions=Question::whereIn('unit_id',$units)->orderBy('id', 'DESC')->paginate(10);
            $school_grades=SchoolGrade::get();

            return view("Teacher.exams.questions",compact("questions","exam_id","school_grades","unit_codes","exam"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function store(StoreQuestion_ExamRequest $request)
    {
       try {
        foreach($request->questions as $question){
            Question_Exam::create([
                'exam_id'=>$request->exam_id,
                'question_id' => $question,
                'teacher_id' => Auth::guard("teacher")->user()->id
            ]);
        }

        return redirect()->route('add_questions',[$request->exam_id]);
       } catch (\Throwable $th) {
        return redirect()->back()->with('error',"عفوا حدث خطأ ما");
       }
    }

    public function store_ajax(StoreQuestion_ExamRequest $request){

        $question_exam=Question_Exam::where('exam_id',"=",$request->exam_id)
        ->where('question_id','=',$request->question_id)->count();

        if($question_exam > 0){
            return response([
                'status' => 200,
                'msg' => 'تم اضافة هذا السؤال من قبل'
            ]);
        }else{
            Question_Exam::create([
                'exam_id'=>$request->exam_id,
                'question_id' => $request->question_id,
                'teacher_id' => Auth::guard("teacher")->user()->id
            ]);

            return response([
                'status' => 200,
                'msg' => 'تم اضافة السؤال بنجاح'
            ]);
        }
    }

    public function store_ajax_question(Request $request){
        $chooses=explode(",",$request->chooses);
        if(in_array($request->answer,$chooses)){
            $question=Question::create([
                'name' => $request->title,
                'type' => $request->type_question,
                'title' => $request->title,
                'description' => $request->description,
                'chooses' => $request->chooses,
                'answer' => $request->answer,
                'unit_id' => $request->unit_id,
                'subject_id' => Auth::guard("teacher")->user()->subject_id,
                'school_grade_id' => $request->school_grade_id,
                'teacher_id' => Auth::guard("teacher")->user()->id,
            ]);

            Question_Exam::create([
                'exam_id'=>$request->exam_id,
                'question_id' => $question->id,
                'teacher_id' => Auth::guard("teacher")->user()->id
            ]);

            $data="تم اضافة السؤال بنجاح";
            return $this->make_response($data,200);

        }else{
            return response([
                "error"=>"عفوا هناك خطا ما"
            ]);
        }
    }

    public function show()
    {
        //
    }

    public function edit()
    {
        //
    }

    public function update(UpdateQuestion_ExamRequest $request)
    {
        //
    }

    public function destroy()
    {
        //
    }
}
