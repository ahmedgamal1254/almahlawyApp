<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\PostResource;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    use ResponseRequest;
    public function index(){
        $posts=DB::table("posts")->select('*')->
        where("school_grade_id","=",Auth::guard('api')->user()->school_grade_id)->orderByDesc("created_at")->get();

        if(!$posts){
            return response()->json([
                "message" => "not found posts",
                "success" => true
            ],404);
        }

        return $this->make_response(PostResource::collection(($posts)),200);
    }

    public function show($id){
        $post=DB::table("posts")->select("*")->
        where("school_grade_id","=",Auth::guard('api')->user()->school_grade_id)->where("id","=",$id)->first();

        if(!$post){
            return response()->json([
                "message" => "not found post",
                "success" => true
            ],404);
        }

        return $this->make_response(new PostResource($post),200);
    }
}
