<?php

namespace App\Http\Controllers;

use App\Models\
    {
    ClassStudy,
    SchoolGrade,User
    };
use App\Http\Requests\StoreSchoolGradeRequest;
use App\Http\Requests\UpdateSchoolGradeRequest;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;

class SchoolGradeController extends Controller
{
    public function index()
    {
        try {
            $school_grades='';

            // if (Cache::has('school_grades')) {
            //     $school_grades = Cache::get('school_grades');
            // }else{
            //     Cache::put('school_grades', $school_grades,6000);
            // }

            $school_grades=SchoolGrade::with('users','exams','classes','lessons','books')->paginate();

            return view("Teacher.school_grade.index",compact("school_grades"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function students($school_grade_id){
        try {

            $students=User::with('group','schoolgrade')->where("school_grade_id","=",$school_grade_id)->get();

            return view("Teacher.school_grade.students",compact("students"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function groups($school_grade_id){
        try {
            $classes = ClassStudy::where("school_grade_id",$school_grade_id)
            ->withCount("students")->with("school_grade:id,name")->paginate(10);

            return view("Teacher.classes.index",compact("classes"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function create()
    {
        return view("Teacher.school_grade.add");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreSchoolGradeRequest $request)
    {
        try {
            SchoolGrade::updateOrCreate([
                "name" => $request->name
            ],[
                "name" => $request->name,
                "description" => $request->description,
                "teacher_id" => Auth::guard('teacher')->user()->id
            ]);

            return redirect()->route("school_grade")->with('message','تم اضافة صف دراسى بنجاح');
        } catch (\Throwable $th) {

            echo $th->getMessage();
            // return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function show($id)
    {
       try {
        $school_grade=SchoolGrade::findorFail($id);

        if(!$school_grade){
            return redirect()->back()->with('error', 'هذا الصف الدراسى غير موجود غير موجود' . $id);
        }

        return view("Teacher.school_grade.show",compact("school_grade"));
       } catch (\Throwable $th) {
        return redirect()->back()->with('error',"عفوا حدث خطأ ما");
       }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        try{
            $schoolgrade=SchoolGrade::find($id);

            if(!$schoolgrade){
                return redirect()->back()->with('error', 'هذا الصف الدراسى غير موجود غير موجود' . $id);
            }

            return view("Teacher.school_grade.edit",compact("schoolgrade"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSchoolGradeRequest $request, SchoolGrade $schoolGrade)
    {
        try {
            $school_grade=SchoolGrade::find($request->id);
            $school_grade->name=$request->name;
            $school_grade->description=$request->description;
            $school_grade->teacher_id=Auth::guard('teacher')->user()->id;
            $school_grade->save();

            return redirect()->route("school_grade")->with('message','تم حفظ الصف الدراسى بنجاح');
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
            $school_grade=SchoolGrade::find($id);

            if(!$school_grade){
                return redirect()->back()->with('error', 'هذا الصف الدراسى غير موجود غير موجود' . $id);
            }

            SchoolGrade::find($id)->delete();

            return redirect()->route("school_grade")->with('message','تم حذف الصف الدراسى بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
