<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\{
    Month_User,
    User,
    Teacher
};

class StudentController extends Controller
{
    public function index(){
        try {
            $teachers=DB::table('teachers')
            ->join('subjects','teachers.subject_id','=','subjects.id')
            ->select("teachers.*","subjects.title as subject_name")
            ->get();

            return view("student.dashboard",compact("teachers"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function add(){
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $subjects=DB::table("subjects")->where("deleted_at","=",null)->get();
            $groups=DB::table("class_studies")->where("deleted_at","=",null)->get();

            return view("auth.register_socialite",compact("school_grades","subjects","groups"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function store(Request $request){

        try {
            $user=User::find(Auth::user()->id);
            $user->school_grade_id=$request->school_grade_id;
            $user->subject_id=$request->subject_id;
            $user->group_id=$request->group_id;
            $user->save();

            toastr()->success("تم حفظ البيانات بنجاح");

            return redirect()->route("student_dashboard");
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
