<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreVrSessionRequest;
use App\Http\Requests\UpdateVrSessionRequest;
use App\Models\VrService;
use App\Models\VRSession;
use App\Traits\Upload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class VrSessionController extends Controller
{
    use Upload;
    public function index()
    {
        try {
            $vrsession=VRSession::with("school_grade","unit")->orderByDesc("id")->paginate(15);

            return view("Teacher.vrsessions.index",compact("vrsession"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function create()
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=DB::table("units")->get();
            $vrservice=VrService::get();

            return view("Teacher.vrsessions.add",compact("school_grades","units","vrservice"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function store(StoreVrSessionRequest $request)
    {
        try {
            $data=$request->all();
            $data["teacher_id"]=Auth::guard("teacher")->id();

            if($request->hasFile("photo")){
                $data["photo"]=$this->image_upload($request,"sessions","photo");
            }

            VRSession::create($data);

            return redirect()->route("teacher.sessions")->with('message','تم اضافة الحصة بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function show(){

    }

    public function edit($id)
    {
        $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
        $units=DB::table("units")->get();
        $vrservice=VrService::get();

        $vrsession=VRSession::find($id);

        return view("Teacher.vrsessions.edit",compact("school_grades","units","vrservice","vrsession"));
    }

    public function update(UpdateVrSessionRequest $request)
    {

        try {
            $data=$request->all();

            if($request->hasFile("photo")){
                $data["photo"]=$this->image_upload($request,"sessions","photo");
            }

            VRSession::find($request->id)->update($data);

            return redirect()->route("teacher.sessions")->with('message','تم الحفظ بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }

    public function destroy($id)
    {
        try {
            VRSession::find($id)->delete();

            return redirect()->route("teacher.sessions")->with('message','تم حذف  المادة بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }
}
