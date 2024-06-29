<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BookResource;
use App\Http\Resources\FreeBookResource;
use App\Models\FreeBooks;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\ResponseRequest;
use Illuminate\Support\Facades\Cache;

class FreeBookController extends Controller
{
    use ResponseRequest;
    public function index(){
        $school_grade=Auth::guard("api")->user()->school_grade_id;
        $free_books=Cache::get("free_books_{$school_grade}",function () use($school_grade){
            return DB::table("free_books")->select("id","title","description","media_url","cover")
            ->where("school_grade_id","=",$school_grade)
            ->get();
        });

        return $this->make_response(FreeBookResource::collection($free_books),200);
    }

    public function show($id){
        $free_book=FreeBooks::where("id",$id)->select("id as book_id","title","description","media_url","cover")
        ->where("school_grade_id","=",Auth::guard("api")->user()->school_grade_id)->first();

        if(!$free_book){
            return response()->json([
                "message" => "book not found",
                "success" => false,
                "status" => 404
            ],404);
        }

        return response()->json([
            "data" => new FreeBookResource($free_book),
            "success" => true,
            "status" => 200
        ],200);
    }
}
