<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CurrentTimeController extends Controller
{
    public function index(Request $request){
        try {
            $video_minute=DB::table("video_minute")->where("video_id","=",$request->input("video_id"))
            ->where("user_id","=",Auth::user()->id)->count();

            if($video_minute > 0){
                $video_minute=DB::table("video_minute")->where("video_id","=",$request->input("video_id"))->where("user_id","=",Auth::user()->id);

                $video_minute->update(["current_time"=>$request->input("current_time")]);

            }else{
                DB::table("video_minute")->insert([
                    "user_id"=>Auth::user()->id,
                    "video_id"=>$request->input("video_id"),
                    "current_time"=>$request->input("current_time")
                ]);
            }

            return "success";
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");

        }
    }
}
