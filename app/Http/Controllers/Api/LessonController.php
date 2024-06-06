<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\LessonResource;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonController extends Controller
{
    use ResponseRequest;
    public function index(){
        $lessons=DB::table("lessons")->select("*")->
        where("school_grade_id","=",Auth::guard('api')->user()->school_grade_id)->get();

        if(!$lessons){
            return response()->json([
                "message" => "not found lessons",
                "success" => true
            ],404);
        }

        return $this->make_response(new LessonResource($lessons),200);
    }

    public function show($id){
        $lesson=DB::table("lessons")->select("*")->
        where("school_grade_id","=",Auth::guard('api')->user()->school_grade_id)->where("id","=",$id)->first();

        if(!$lesson){
            return response()->json([
                "message" => "not found lesson",
                "success" => true
            ],404);
        }

        return $this->make_response(new LessonResource($lesson),200);
    }
}
