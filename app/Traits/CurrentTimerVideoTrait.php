<?php
namespace App\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

trait CurrentTimerVideoTrait
{
    public function current_timer_video($request,$guard){
        $video_minute=DB::table("video_minute")->where("video_id","=",$request->input("video_id"))
        ->where("user_id","=",Auth::guard($guard)->user()->id)->count();

        if($video_minute > 0){
            $video_minute=DB::table("video_minute")->where("video_id","=",$request->input("video_id"))
            ->where("user_id","=",Auth::guard($guard)->user()->id);

            $video_minute->update(["current_time"=>$request->input("current_time")]); // get per seconds

        }else{
            DB::table("video_minute")->insert([
                "user_id"=>Auth::guard($guard)->user()->id,
                "video_id"=>$request->input("video_id"),
                "current_time"=>$request->input("current_time") // get per seconds
            ]);
        }
    }
}

?>
