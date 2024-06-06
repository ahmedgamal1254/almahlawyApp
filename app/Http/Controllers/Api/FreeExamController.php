<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\ResponseRequest;

class FreeExamController extends Controller
{
    use ResponseRequest;
    public function index(){
        $free_exams=DB::table("exams")
        ->where("school_grade_id","=",Auth::guard("api")->user()->school_grade_id)->where("free","=",1)
        ->limit(2)->get();

        return $this->make_response($free_exams,200);
    }

    public function show($id){
        $questions=DB::table("question_exams")->join("questions","questions.id","=","question_exams.question_id")
            ->join("exams","exams.id","=","question_exams.exam_id")
            ->select("questions.name","questions.img","questions.id","questions.chooses")
            ->where("question_exams.exam_id","=",$id)->where("exams.free","=",1)->get();

        $questions=$questions->map(function ($question){
            return [
                "question_id" => $question->id,
                "question_title" => $question->name ? $question->name:NULL,
                "question_image" => $question->img ? $question->img:NULL,
                "question_answers" => json_decode($question->chooses, true),
            ];
        });

        $data["count"]=count($questions);
        $data["questions"]=$questions;
        $data["exam_id"]=$id;

        return $this->make_response($data,200);
    }
}
