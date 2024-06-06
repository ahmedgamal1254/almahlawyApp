<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ExamTimerController extends Controller
{
    public function index(Request $request){
        try {
            $exam_timer=DB::table("exam_timer")->where("exam_id","=",$request->input("exam_id"))
            ->where("user_id","=",Auth::user()->id)->count();

            if($exam_timer > 0){
                $exam_timer=DB::table("exam_timer")->where("exam_id","=",$request->input("exam_id"))->where("user_id","=",Auth::user()->id);

                $exam_timer->update(["timer"=>$request->input("exam_time")]);

            }else{
                DB::table("exam_timer")->insert([
                    "user_id"=>Auth::user()->id,
                    "exam_id"=>$request->input("exam_id"),
                    "timer"=>$request->input("exam_time")
                ]);
            }

            return "success";

        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
