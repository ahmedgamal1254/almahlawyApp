<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\LessonResource;
use App\Traits\MakeDate;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonController extends Controller
{
    use ResponseRequest,MakeDate;
    public function index(){
        $user = Auth::guard("api")->user();

        // Extract months and school grade ID from the user
        $months = $user->months;
        $schoolGradeId = $user->school_grade_id;

        $lessons=DB::table("lessons")->select("*")
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
        ->where("school_grade_id","=",$schoolGradeId)->paginate(15);

        if(!$lessons){
            return response()->json([
                "message" => "not found lessons",
                "success" => false
            ],404);
        }

        return $this->make_response(LessonResource::collection($lessons),200);
    }

    public function show($id){
        $lesson=DB::table("lessons")->select("*")->
        where("school_grade_id","=",Auth::guard('api')->user()->school_grade_id)->where("id","=",$id)->first();

        if(!$lesson){
            return response()->json([
                "message" => "lesson not found",
                "success" => false
            ],404);
        }

        return $this->make_response(new LessonResource($lesson),200);
    }
}
