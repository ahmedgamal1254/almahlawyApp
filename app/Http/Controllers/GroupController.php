<?php

namespace App\Http\Controllers;

use App\Models\ClassStudy;
use App\Http\Requests\StoreClassStudyRequest;
use App\Http\Requests\UpdateClassStudyRequest;
use App\Models\Group;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;

class GroupController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $classes = ClassStudy::withCount("students")->paginate(10);

            return view("Teacher.classes.index",compact("classes"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function students($group_id){
        try {
            $students=DB::table('users')
            ->join('school_grades', 'users.school_grade_id', '=', 'school_grades.id')
            ->join('class_studies', 'users.group_id', '=', 'class_studies.id')
            ->select('users.*', 'class_studies.group_name as subject_name', 'school_grades.name as school_grade')
            ->where("users.group_id","=",$group_id)
            ->paginate(15);

            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $groups=DB::table("class_studies")->where("deleted_at","=",null)->get();


            return view("Teacher.students.index",compact("students","school_grades","groups"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        try{
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $subjects=DB::table("subjects")->where("deleted_at","=",null)->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

            return view("Teacher.classes.add",compact("school_grades","subjects"));
        }catch(\Throwable $th){
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreClassStudyRequest $request)
    {
        try {
            ClassStudy::updateOrCreate([
                "group_name" => $request->name,
            ],[
                "group_name" => $request->name,
                "description" => $request->description,
                "subject_id" => Auth::guard('teacher')->user()->subject_id,
                "teacher_id" => Auth::guard('teacher')->user()->id,
            ]);

            Cache::put("groups",Group::select("class_studies.id","group_name")->get());

            return redirect()->route('class')->with('message','تم اضافة مجموعة جديدة بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما")->withInput();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        try {
            $class=DB::select('SELECT class_studies.*,subjects.title as subject_name,school_grades.name as scholl_grade from class_studies
            INNER JOIN subjects on subjects.id=class_studies.subject_id
            INNER JOIN school_grades on school_grades.id=class_studies.school_grade_id where class_studies.id=?',[$id]);

            if(!$class){
                return redirect()->back()->with('error', 'هذه المجموعة غير موجودة' . $id);
            }

            $class=$class[0];
            return view("Teacher.classes.show",compact("class"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function edit($id)
    {
        try {
            $class=DB::table('class_studies')->find($id);
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $subjects=DB::table("subjects")->where("deleted_at","=",null)->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

            if(!$class){
                return redirect()->back()->with('error', 'هذه المجموعة غير موجودة' . $id);
            }
            return view("Teacher.classes.edit",compact("class","school_grades","subjects"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateClassStudyRequest $request)
    {
        try {
            $class_study=ClassStudy::find($request->id);
            $class_study->group_name=$request->group_name;
            $class_study->description=$request->description;
            $class_study->subject_id=Auth::guard('teacher')->user()->subject_id;
            $class_study->save();

            Cache::put("groups",Group::select("class_studies.id","group_name")->get());

            return redirect()->route('class');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            $group=ClassStudy::find($id);

            if(!$group){
                return redirect()->back()->with('error', 'هذه المجموعة غير موجودة' . $id);
            }

            ClassStudy::find($id)->delete();

            return redirect()->route("class");
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
