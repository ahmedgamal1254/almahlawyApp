<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BookResource;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class MediaController extends Controller
{
    use ResponseRequest;
    public function index(){
        $user = Auth::guard("api")->user();

        // Extract months and school grade ID from the user
        $months = $user->months;
        $schoolGradeId = $user->school_grade_id;

        $books=DB::table("media")->select("*")
        ->where(function ($query) use ($months) {
            foreach ($months as $month) {
                $year = date('Y', strtotime($month->month_date));
                $month = date('m', strtotime($month->month_date));
                $query->orWhere(function ($query) use ($year, $month) {
                    $query->whereYear('date_show', '=', $year)
                          ->whereMonth('date_show', '=', $month);
                });
            }
        })
        ->where("school_grade_id","=",$schoolGradeId)->get();

        if(!$books){
            return response()->json([
                "message" => "not found books",
                "success" => false
            ],404);
        }

        return $this->make_response(BookResource::collection($books),200);
    }

    public function show($id){
        $book=DB::table("media")->select("*")->
        where("school_grade_id","=",Auth::guard('api')->user()->school_grade_id)->where("id","=",$id)->first();

        if(!$book){
            return response()->json([
                "message" => "not found book",
                "success" => false
            ],404);
        }

        return $this->make_response(new BookResource($book),200);
    }
}
