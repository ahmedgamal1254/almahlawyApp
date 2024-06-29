<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;

class PostController extends Controller
{
    use ResponseRequest;
    public function index(Request $request){
        $schoolgrade=Auth::guard('api')->user()->school_grade_id;

        $posts = Cache::get("posts_by_{$schoolgrade}",function () use($schoolgrade){
            return Post::select('id', 'title', 'description',"image_url","created_at")
            ->where("school_grade_id","=",$schoolgrade)->orderByDesc("created_at")->paginate(10);
        });


        if(!$posts){
            return response()->json([
                "message" => "not found posts",
                "success" => true
            ],404);
        }

        return $this->make_response([
            "data" => PostResource::collection($posts),
            'current_page' => $posts->currentPage(),
            'per_page' => $posts->perPage(),
            'total' => $posts->total(),
            'total_pages' => $posts->lastPage()
        ],200);
    }

    public function show($id){
        $schoolgrade=Auth::guard('api')->user()->school_grade_id;

        $post =DB::table("posts")->select("*")
            ->where("school_grade_id","=",$schoolgrade)->where("id","=",$id)->first();

        if(!$post){
            return response()->json([
                "message" => "not found post",
                "success" => true
            ],404);
        }

        return $this->make_response(new PostResource($post),200);
    }
}
