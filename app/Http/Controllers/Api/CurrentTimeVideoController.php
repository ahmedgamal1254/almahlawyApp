<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Traits\CurrentTimerVideoTrait;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class CurrentTimeVideoController extends Controller
{
    use CurrentTimerVideoTrait;

    public function index(Request $request){
        try {
            $validator = Validator::make($request->all(), [
                'video_id' => 'required|integer|exists:lessons,id',
                "current_time" => "required|numeric"
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $this->current_timer_video($request,"api");

            return response()->json([
                "msg" => "تم حفظ البيانات بنجاح",
                "status" => 201
            ],201);
        } catch (\Throwable $th) {
            return response()->json([
                "error" => "error happend,please send to adminstrator" . $th->getMessage(),
                "status" => 500,
                "success" => false
            ],500);
        }
    }
}
