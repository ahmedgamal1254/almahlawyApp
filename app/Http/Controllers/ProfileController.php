<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use App\Models\Teacher;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Traits\Upload;

class ProfileController extends Controller
{
    use Upload;
    public function index($id){
        try {
            $student=DB::table('users')
            ->join('school_grades', 'users.school_grade_id', '=', 'school_grades.id')
            ->join('class_studies', 'users.group_id', '=', 'class_studies.id')
            ->select('users.*', 'class_studies.group_name as subject_name',
            'school_grades.name as school_grade', DB::raw('SUM(exam_student.degree) AS points'))
            ->leftjoin("exam_student","exam_student.user_id","=","users.id")
            ->groupBy("users.id")
            ->where("users.id","=",Auth::user()->id)
            ->first();

            $exams=DB::table('exam_student')->join("exams","exams.id","=","exam_student.exam_id")
            ->select("exams.code","exam_student.degree","exam_student.total")->where("exam_student.user_id","=",Auth::user()->id)->get();

            $teachers=Teacher::get();

            $teacher_toggle=DB::table("teachers")->join("subjects","subjects.id","=","teachers.subject_id")
            ->select("teachers.*","subjects.title as subject")->where("teachers.id","!=",$id)->first();

            $teacher=DB::table("teachers")->join("subjects","subjects.id","=","teachers.subject_id")
            ->select("teachers.*","subjects.title as subject")->where("teachers.id","=",$id)->first();

            return view("profile.index",compact("student","exams","teachers","teacher","teacher_toggle"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function edit(Request $request,$id)
    {
        try {
            $student=DB::table('users')
            ->join('school_grades', 'users.school_grade_id', '=', 'school_grades.id')
            ->join('class_studies', 'users.group_id', '=', 'class_studies.id')
            ->select('users.*', 'class_studies.group_name as subject_name', 'school_grades.name as school_grade')
            ->where("users.id","=",Auth::user()->id)
            ->first();

            if(!$student){
                return redirect()->back()->with('error', 'حساب هذا غير موجود' . $id);
            }

            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $groups=DB::table("class_studies")->get();
            $governments=DB::table("governments")->get();

            $teachers=Teacher::get();

            $teacher_toggle=DB::table("teachers")->join("subjects","subjects.id","=","teachers.subject_id")
            ->select("teachers.*","subjects.title as subject")->where("teachers.id","!=",$id)->first();

            $teacher=DB::table("teachers")->join("subjects","subjects.id","=","teachers.subject_id")
            ->select("teachers.*","subjects.title as subject")->where("teachers.id","=",$id)->first();

            return view("profile.edit",compact("student","school_grades","groups","governments","teachers","teacher","teacher_toggle"));

        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function store(Request $request){
        try {
            $file=Null;
            if($request->file("img")){
                // image upload name must img
                $file=$this->image_upload($request,'users');

                $user=user::find($request->id);
                $user->email=$request->email;
                $user->name=$request->username;
                $user->government=$request->government;
                $user->profile=$file;
                $user->school_grade_id=$request->school_grade_id;
                $user->save();

            }else{
                $user=user::find($request->id);
                $user->email=$request->email;
                $user->name=$request->username;
                $user->government=$request->government;
                $user->school_grade_id=$request->school_grade_id;
                $user->save();
            }

            return redirect()->route("user-profile");
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        try {
            $request->user()->fill($request->validated());

            if ($request->user()->isDirty('email')) {
                $request->user()->email_verified_at = null;
            }

            $request->user()->save();

            return Redirect::route('profile.edit')->with('status', 'profile-updated');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function destroy(Request $request): RedirectResponse
    {
        try {
            $request->validateWithBag('userDeletion', [
                'password' => ['required', 'current_password'],
            ]);

            $user = $request->user();

            Auth::logout();

            $user->delete();

            $request->session()->invalidate();
            $request->session()->regenerateToken();

            return Redirect::to('/');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function profile_public($id){
        try {
            $user=DB::table("users")->select("users.*","school_grades.name as grade_name")
            ->join("school_grades","school_grades.id","=","users.school_grade_id")
            ->where("users.id","=",$id)->first();

            if(!$user){
                return redirect()->back()->with('error', 'هذا الطالب غير موجود' . $id);
            }
            return view("public_profile",compact("user"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
