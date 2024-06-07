<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\LessonResource;
use App\Models\FreeVideos;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\ResponseRequest;

class FreeCourcesController extends Controller
{
    use ResponseRequest;
    public function index(){
        $free_videos=DB::table("free_videos")->select("id","title","description","video_url","image_caption")
        ->where("school_grade_id","=",Auth::guard("api")->user()->school_grade_id)
        ->paginate(15);

        return $this->make_response($free_videos,200);
    }

    public function show($id){
        $free_video=FreeVideos::where("id",$id)
        ->where("school_grade_id","=",Auth::guard("api")->user()->school_grade_id)->first();

        if(!$free_video){
            return response()->json([
                "message" => "lesson not found",
                "success" => false,
                "status" => 404
            ],404);
        }

        return response()->json([
            "data" => new LessonResource($free_video),
            "success" => true,
            "status" => 200
        ],200);
    }
}
