<?php

namespace App\Http\Controllers\Teacher;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\UpdateStudentRequest;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Traits\{ResponseRequest,Upload};

class StudentTeacherController extends Controller
{
    use ResponseRequest,Upload;
    public function index(){
        try {
            $students=DB::table('users')
            ->leftjoin('school_grades', 'users.school_grade_id', '=', 'school_grades.id')
            ->leftjoin('class_studies', 'users.group_id', '=', 'class_studies.id')
            ->select('users.*', 'class_studies.group_name as subject_name',
            'school_grades.name as school_grade', DB::raw('SUM(exam_student.degree) AS points'))
            ->leftjoin("exam_student","exam_student.user_id","=","users.id")
            ->groupBy("users.id")
            ->whereNull("users.deleted_at")
            ->orderByDesc("created_at")
            ->paginate(15);

            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $groups=DB::table("class_studies")->where("deleted_at","=",null)->get();

            return view("Teacher.students.index",compact("students","school_grades","groups"));
        } catch (\Throwable $th) {

            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function search(Request $request){
        $students=DB::table('users')
        ->leftJoin('school_grades', 'users.school_grade_id', '=', 'school_grades.id')
        ->leftJoin('class_studies', 'users.group_id', '=', 'class_studies.id')
        ->select('users.*', 'class_studies.group_name as subject_name',
        'school_grades.name as school_grade', DB::raw('SUM(exam_student.degree) AS points'))
        ->leftjoin("exam_student","exam_student.user_id","=","users.id")
        ->where('users.name','LIKE','%'.$request->query("search").'%')
        ->groupBy("users.id")
        ->orderByDesc("created_at")
        ->get();

        $content=view("Teacher.students.load",["students" => $students])->render();

        return response([
            "data" => $content,
            'success' => true,
            'status'=>200
        ]);
    }

    public function filter(Request $request){
        try{
            $query=DB::table('users')
            ->leftJoin('school_grades', 'users.school_grade_id', '=', 'school_grades.id')
            ->leftJoin('class_studies', 'users.group_id', '=', 'class_studies.id')
            ->select('users.*', 'class_studies.group_name as subject_name',
            'school_grades.name as school_grade', DB::raw('SUM(exam_student.degree) AS points'))
            ->leftjoin("exam_student","exam_student.user_id","=","users.id")
            ->groupBy("users.id");

            if($request->has('name') and strlen($request->input("name"))>0 and $request->input("school_grade")==0 and
            $request->input("group") == 0){
                $students=$query->where("users.name","LIKE","%". $request->input("name") ."%")->orderByDesc("id")
                ->paginate(25);

                return view("Teacher.students.filter",compact("students"));
            }elseif(strlen($request->input("name"))>0 and $request->input("school_grade")>0 and $request->input("group") == 0){
                $students=$query->where("users.name","LIKE","%". $request->input("name") ."%")
                ->where("users.school_grade_id","=",$request->input("school_grade"))->orderByDesc("id")->paginate(25);

                return view("Teacher.students.filter",compact("students"));
            }elseif(strlen($request->input("name"))>0 and $request->input("group")>0 and $request->input("school_grade")==0){
                $students=$query->where("users.name","LIKE","%". $request->input("name") ."%")
                ->where("users.group_id","=",$request->input("group"))->orderByDesc("id")->paginate(25);

                return view("Teacher.students.filter",compact("students"));
            }elseif(strlen($request->input("name"))>0 and $request->input("group")>0 and $request->input("school_grade")>0){
                $students=$query->where("users.name","LIKE","%". $request->input("name") ."%")->
                where("users.group_id","=",$request->input("group"))
                ->where("users.school_grade_id","=",$request->input("school_grade"))->orderByDesc("id")->paginate(25);

                return view("Teacher.students.filter",compact("students"));
            }elseif(strlen($request->input("name"))==0 and $request->input("group")>0 and $request->input("school_grade") > 0){
                $students=$query->where("users.group_id","=",$request->input("group"))
                ->where("users.school_grade_id","=",$request->input("school_grade"))->orderByDesc("id")->paginate(25);

                return view("Teacher.students.filter",compact("students"));
            }elseif(strlen($request->input("name"))==0 and $request->input("group")>0 and $request->input("school_grade") == 0){
                $students=$query->where("users.group_id","=",$request->input("group"))
                ->orderByDesc("id")->paginate(25);

                return  view("Teacher.students.filter",compact("students"));
            }elseif(strlen($request->input("name"))==0 and $request->input("group")==0 and $request->input("school_grade")>0){
                $students=$query->where("users.school_grade_id","=",$request->input("school_grade"))->orderByDesc("id")->paginate(25);

                return  view("Teacher.students.filter",compact("students"));
            }
        }
        catch(\Throwable $th){
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function students_points(){
        try {
            $students=DB::table('users')
            ->leftJoin('school_grades', 'users.school_grade_id', '=', 'school_grades.id')
            ->leftJoin('class_studies', 'users.group_id', '=', 'class_studies.id')
            ->select('users.*', 'class_studies.group_name as subject_name',
            'school_grades.name as school_grade', DB::raw('SUM(exam_student.degree) AS points'))
            ->leftjoin("exam_student","exam_student.user_id","=","users.id")
            ->groupBy("users.id")
            ->orderByDesc("users.all_points")
            ->paginate(25);

            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $groups=DB::table("class_studies")->where("deleted_at","=",null)->get();

            return view("Teacher.students.points",compact("students","school_grades","groups"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function add_student(){
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $groups=DB::table("class_studies")->where("deleted_at","=",null)
            ->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

            $governments=DB::table("governments")->get();

            return view("Teacher.students.add",compact('school_grades','groups',"governments"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function save_student(RegisterRequest $request){
        try {
            $file=null;
            if($request->file("img")){
                $file=$this->image_upload($request,'users');
            }

            User::create([
                'name' => $request->name,
                'email' => $request->email,
                "email_verified_at" => now(),
                'profile' => $file,
                'password' => Hash::make($request->password),
                'phonenumber' => $request->phonenumber,
                'phone_parent' => $request->phone_parent,
                'government' => $request->government,
                'subject_id' => Auth::guard("teacher")->user()->subject_id,
                'school_grade_id' => $request->school_grade_id,
                'teacher_id' => Auth::guard("teacher")->user()->id,
                'group_id' => $request->group_id,
            ]);

            return redirect()->route("students")->with("success","تم الحفظ بنجاح");
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function edit_student($id){
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $groups=DB::table("class_studies")->where("deleted_at","=",null)
            ->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();
            $governments=DB::table("governments")->get();

            $student=User::find($id);

            if(!$student){
                return redirect()->back()->with('error', 'هذا الطالب غير موجود '. $id);
            }

            return view("Teacher.students.edit",compact("student",'school_grades',"groups","governments"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }


    public function update_student(UpdateStudentRequest $request){
        try {
            $pass='';
            if($request->password == null){
                $pass=Hash::make($request->password);
            }else{
                $pass=$request->old_password;
            }


            if($request->img){
                $file=$this->image_upload($request,"users");
            }

            $user=User::find($request->id);
            $user->update([
                'name' => $request->name,
                'email' => $request->email,
                'profile' => $request->img == null ? $request->old_img:$file,
                'password' => $pass,
                'phonenumber' => $request->phonenumber,
                'phone_parent' => $request->phone_parent,
                'government' => $request->government,
                'subject_id' => Auth::guard("teacher")->user()->subject_id,
                'school_grade_id' => $request->school_grade_id,
                'teacher_id' => Auth::guard("teacher")->user()->id,
                'group_id' => $request->group_id,
            ]);

            return redirect()->route("students")->with("success","تم الحفظ بنجاح");
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function show($id){
        try {
            $student=DB::table('users')
            ->leftJoin('school_grades', 'users.school_grade_id', '=', 'school_grades.id')
            ->leftJoin('class_studies', 'users.group_id', '=', 'class_studies.id')
            ->select('users.*', 'class_studies.group_name as subject_name',
            'school_grades.name as school_grade', DB::raw('SUM(exam_student.degree) AS points'))
            ->leftjoin("exam_student","exam_student.user_id","=","users.id")
            ->groupBy("users.id")
            ->where("users.id","=",$id)
            ->first();

            if(!$student){
                return redirect()->back()->with('error', 'هذا الطالب غير موجود '. $id);
            }

            $exams=DB::table('exam_student')->join("exams","exams.id","=","exam_student.exam_id")
            ->select("exams.code","exam_student.degree","exam_student.total")->where("exam_student.user_id","=",$id)->get();
            return view("Teacher.students.show",compact("student","exams"));
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function update_points(Request $request){
        if($request->point != null){
            $user=User::find($request->user_id);
            $user->active_points+=$request->point;
            $user->all_points+=$request->point;
            $user->save();

            return $this->make_response([
                "data"=>"تم التعديل بنجاح"
            ],200);
        }else{
            return $this->make_response([
                "data"=>"لم يتم ادخال بيانات"
            ],200);
        }
    }
}
