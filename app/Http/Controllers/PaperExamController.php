<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreVrSessionRequest;
use App\Http\Requests\UpdateVrSessionRequest;
use App\Models\StaticExam;
use App\Models\User;
use App\Traits\Upload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PaperExamController extends Controller
{
    use Upload;
    public function index()
    {
        try {
            $exams=StaticExam::with("school_grade","user")->paginate(15);

            return view("Teacher.paper-exams.index",compact("exams"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }


    public function students(Request $request){
        $user=User::whereAny(["name","phonenumber","government","phone_parent"],'LIKE','%'.$request->query("search").'%')->get();

        if($user){
            return response([
                "users" => $user,
                "success" => true
            ]);
        }else{
            return response([
                "success" => false,
                "message" => "no found users"
            ]);
        }
    }

    public function create()
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=DB::table("units")->get();
            $users=User::paginate(15);

            return view("Teacher.paper-exams.add",compact("school_grades","units","users"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function store(Request $request)
    {
        try {
            $data=$request->all();
            $data["teacher_id"]=Auth::guard("teacher")->id();

            if($request->hasFile("exam")){
                $data["exam"]=$this->pdf_upload($request,"sessions","exam");
            }

            $user=User::find($request->user_id);

            $data["title"]="امتحان الطالب " . $user->name;

            StaticExam::create($data);

            return redirect()->route("teacher.paper-exams")->with('message','تم اضافة الامتحان بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function show(){
        //
    }

    public function edit($id)
    {
        $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
        $exam=StaticExam::with("school_grade","user")->find($id);

        return view("Teacher.paper-exams.edit",compact("school_grades","exam"));
    }

    public function update(UpdateVrSessionRequest $request)
    {

        try {
            $data=$request->all();
            $data["teacher_id"]=Auth::guard("teacher")->id();

            if($request->hasFile("exam")){
                $data["exam"]=$this->pdf_upload($request,"sessions","exam");
            }

            $user=User::findOrFail($request->user_id);

            $data["title"]="امتحان الطالب " . $user->name;

            StaticExam::findOrFail($request->id)->update($data);

            return redirect()->route("teacher.sessions")->with('message','تم الحفظ بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function destroy($id)
    {
        try {
            StaticExam::findOrFail($id)->delete();

            return redirect()->route("teacher.paper-exams")->with('message','تم حذف  بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }
}
