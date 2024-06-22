<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BookResource;
use App\Models\FreeBooks;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\ResponseRequest;

class FreeBookController extends Controller
{
    use ResponseRequest;
    public function index(){
        $free_books=DB::table("free_books")->select("id as book_id","title","description","media_url","cover")
        ->where("school_grade_id","=",Auth::guard("api")->user()->school_grade_id)
        ->get();

        return $this->make_response($free_books,200);
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
            "data" => $free_book,
            "success" => true,
            "status" => 200
        ],200);
    }
}
