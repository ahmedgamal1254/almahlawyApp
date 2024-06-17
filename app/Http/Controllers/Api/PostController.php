<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    use ResponseRequest;
    public function index(Request $request){
        $posts = Post::select('id as post_id', 'title', 'description',"image_url","created_at")
        ->where("school_grade_id","=",Auth::guard('api')->user()->school_grade_id)->orderByDesc("created_at")->paginate(10);


        if(!$posts){
            return response()->json([
                "message" => "not found posts",
                "success" => true
            ],404);
        }

        return $this->make_response($posts,200);
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
