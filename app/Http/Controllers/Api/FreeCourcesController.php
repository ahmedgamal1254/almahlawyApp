<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\FreeLessonResource;
use App\Http\Resources\LessonResource;
use App\Models\FreeVideos;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\ResponseRequest;
use Illuminate\Support\Facades\Cache;

class FreeCourcesController extends Controller
{
    use ResponseRequest;
    public function index(){
        $schoolgrade=Auth::guard("api")->user()->school_grade_id;
        $free_videos=Cache::get("free_videos_{$schoolgrade}", function () use($schoolgrade){
            return DB::table("free_videos")->select("id","title","description","source","video_url","image_caption as img_caption")
            ->where("school_grade_id","=",$schoolgrade)
           ->get();
        });

        return $this->make_response(FreeLessonResource::collection($free_videos),200);
    }

    public function show($id){
        $free_video=FreeVideos::where("id",$id)->select("id","title","description","video_url","source","image_caption as img_caption")
        ->where("school_grade_id","=",Auth::guard("api")->user()->school_grade_id)->first();

        if(!$free_video){
            return response()->json([
                "message" => "lesson not found",
                "success" => false,
                "status" => 404
            ],404);
        }

        return response()->json([
            "data" => new FreeLessonResource($free_video),
            "success" => true,
            "status" => 200
        ],200);
    }
}
