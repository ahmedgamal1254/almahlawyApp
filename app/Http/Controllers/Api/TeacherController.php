<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Teacher;
use Illuminate\Support\Facades\Log;
use App\Traits\Viewer;
use App\Traits\ResponseRequest;
use Exception;
use Illuminate\Support\Facades\Cache;

class TeacherController extends Controller
{
    use ResponseRequest;
    public function index(){
        try{
            $teacher=Cache::get("teacher",function (){
                return DB::table("teachers")->join("teacher_settings","teacher_settings.teacher_id","=","teachers.id")
                ->select("name","email","phonenumber","whatsapp","avater","img_url","bio","subject","address","city","state",
                "facebook","instagram","linkedin","telegram")
                ->first();
            });

            if(!$teacher){
                return response()->json([
                    "message" => "teacher not found"
                ],404);
            }
            return $this->make_response($teacher,200);
        }catch(Exception $th){
            Log::error('Error fetching teacher details: ' . $th->getMessage());

            return response()->json([
                'message' => 'An error occurred, please contact the administrator'
            ], 500);
        }
    }
}
