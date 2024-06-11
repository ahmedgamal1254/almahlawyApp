<?php

namespace App\Http\Controllers;

use App\Models\Question;
use App\Http\Requests\StoreQuestionRequest;
use App\Http\Requests\UpdateQuestionRequest;
use App\Traits\Upload;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class QuestionController extends Controller
{
    use Upload;
    public function index()
    {
        try {
            $questions=DB::table('questions')
            ->join('school_grades', 'questions.school_grade_id', '=', 'school_grades.id')
            ->join('units', 'questions.unit_id', '=', 'units.id')
            ->select('questions.*', 'units.title as unit_name', 'school_grades.name as school_grade')
            ->where("questions.teacher_id","=",Auth::guard('teacher')->user()->id)
            ->whereNull("questions.deleted_at")
            ->orderByDesc("id")
            ->paginate(15);

            $school_grades=DB::table("school_grades")->get();
            $units=DB::table("units")->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

            return view("Teacher.questions.index",compact('questions','school_grades','units'));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function create()
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=DB::table("units")->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

            return view("Teacher.questions.add",compact('school_grades','units'));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function store(StoreQuestionRequest $request)
    {
        // check if answer in chooses or not
        /***
         * if answer in chooses allow to him
         *
         */
        try {
            $chooses=$request->chooses;


            if($request->hasFile("img")){
                $file=$this->image_upload($request,"questions");
            }

            if($request->answer < array_count_values($chooses)){
                Question::create([
                    'name' => $request->title,
                    'type' => $request->type_question,
                    "type_question" => $request->type,
                    "img" => isset($file) ? $file:NULL,
                    'title' => $request->title,
                    'description' => $request->description,
                    'chooses' => json_encode($chooses,JSON_UNESCAPED_UNICODE),
                    'answer' => $chooses[$request->answer],
                    'degree' => $request->degree,
                    'subject_id' => Auth::guard("teacher")->user()->subject_id,
                    'school_grade_id' => $request->school_grade_id,
                    'unit_id' => $request->unit_id,
                    'teacher_id' => Auth::guard("teacher")->user()->id
                ]);

                return redirect()->route("questions")->with('message','تم اضافة السؤال بنجاح');

            }else{
                return back()->with("warning","عفوا الاجابة المدخلة ليست من ضمن الاختيارات");
            }
        } catch (\Throwable $th) {
            echo $th->getMessage();

            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function show($id)
    {
        try {
            $question=DB::table('questions')
            ->join('school_grades', 'questions.school_grade_id', '=', 'school_grades.id')
            ->join('units', 'questions.unit_id', '=', 'units.id')
            ->select('questions.*', 'units.title as unit_name', 'school_grades.name as school_grade')
            ->where('questions.id','=',$id)
            ->first();

            if(!$question){
                return redirect()->back()->with('error', 'هذا السؤال غير موجود' . $id);
            }

            return view("Teacher.questions.show",compact("question"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function edit($id)
    {
        try{
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=DB::table("units")->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

            $question=DB::table('questions')
            ->join('school_grades', 'questions.school_grade_id', '=', 'school_grades.id')
            ->join('units', 'questions.unit_id', '=', 'units.id')
            ->select('questions.*', 'units.title as unit_name', 'school_grades.name as school_grade')
            ->where('questions.id','=',$id)
            ->first();

            if(!$question){
                return redirect()->back()->with('error', 'هذا السؤال غير موجود' . $id);
            }

            return view("Teacher.questions.edit",compact("question","school_grades","units"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function update(UpdateQuestionRequest $request)
    {
        try{
            $chooses=$request->chooses;

            if($request->hasFile("img")){
                $file=$this->image_upload($request,"questions");
            }

            if($request->answer < array_count_values($chooses)){
                $question=Question::find($request->id);

                $question->update([
                    'name' => $request->title,
                    'type' => $request->type_question,
                    "type_question" => $request->type,
                    "img" => isset($file) ? $file:$request->old_image,
                    'title' => $request->title,
                    'description' => $request->description,
                    'chooses' => json_encode($chooses,JSON_UNESCAPED_UNICODE),
                    'answer' => $request->answer,
                    'degree' => $request->degree,
                    'subject_id' => Auth::guard("teacher")->user()->subject_id,
                    'school_grade_id' => $request->school_grade_id,
                    'unit_id' => $request->unit_id,
                    'teacher_id' => Auth::guard("teacher")->user()->id
                ]);

                return redirect()->route("questions")->with('message','تم الحفظ بنجاح');

            }else{
                return back()->with("warning","عفوا الاجابة المدخلة ليست من ضمن الاختيارات");
            }

        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function destroy($id)
    {
        try {
            $question = Question::findOrFail($id);
            $question->delete();

            return redirect()->route("questions")->with('message','تم الحذف بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
