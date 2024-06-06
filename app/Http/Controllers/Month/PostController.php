<?php

namespace App\Http\Controllers\Month;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Teacher;
use App\Traits\Viewer;


class PostController extends Controller
{
    public function posts($teacher_id,$month_id){
        // posts
        $posts=DB::table("posts")->select('posts.*')->where('school_grade_id','=',Auth::user()->school_grade_id)
        ->where('teacher_id','=',$teacher_id)->get();

        // return $teacher
        $teacher=Teacher::where("id","=",$teacher_id)->first();

        // array of data (lessons , videos , exams , month , teacher_id , month_id)
        $data["posts"]=$posts;
        $data["teacher_id"]=$teacher_id;
        $data["month_id"]=$month_id;

        return view("student.posts.index",compact("data","teacher"));
    }

    public function show_post($teacher_id,$month_id,$id){
        try {
            // post
            $post=DB::table("posts")->select('posts.*')->where('school_grade_id','=',Auth::user()->school_grade_id)
            ->where('teacher_id','=',$teacher_id)->where("id","=",$id)->first();

            // return $teacher
            $teacher=Teacher::where("id","=",$teacher_id)->first();

            // array of data (lessons , videos , exams , month , teacher_id , month_id)
            $data["post"]=$post;
            $data["teacher_id"]=$teacher_id;
            $data["month_id"]=$month_id;

            // return $data;
            return view("student.posts.show",compact("data","teacher"));
        } catch (\Throwable $th) {
            //throw $th;
        }
    }
}
