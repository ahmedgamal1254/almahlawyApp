<?php

namespace App\Http\Controllers;

use App\Models\SchoolGrade;
use App\Models\Teacher;
use App\Models\User;
use Illuminate\Http\Request;
use App\Traits\Upload;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class TeacherController extends Controller
{
    use Upload;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $school_grades=SchoolGrade::withCount("users")->get();
        $users=User::count();

        return view("Teacher.dashboard",compact("school_grades","users"));
    }

    public function stat(){
        return response()->json([
            "school_grades" => SchoolGrade::withCount("users")->get(),
            "governments" => User::groupBy("government")->select('government', DB::raw('count(*) as total'))->get()
        ],200);
    }

    public function profile(){
        return view("Teacher.teacher_profile");
    }

    public function update(Request $request){
        $file=Null;
        if($request->file("img")){
            // image upload name must img
            $file=$this->image_upload($request,'teachers',"img");
        }

        $data=$request->all();
        $data["img_url"]=$file?$file:$request->img;
        $data["password"]=$request->password != NULL ? Hash::make($request->password):$request->old_password;

        Teacher::find(Auth::guard("teacher")->id())->update($data);

        return redirect()->route("teacher.profile");
    }
}
