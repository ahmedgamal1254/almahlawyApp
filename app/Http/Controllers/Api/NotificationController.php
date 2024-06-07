<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\NotificationResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class NotificationController extends Controller
{
    public function index(){
        $notifications=Auth::guard("api")->user()->unreadNotifications;

        if(!$notifications){
            return response()->json([
                "data" => "notifactions not found",
                "status" => 404,
                "success" => false
            ],404);
        }

        return response()->json([
            "data" => NotificationResource::collection($notifications),
            "status" => 200,
            "success" => true
        ],200);
    }

    public function update($id){
        try {
            $notification=DB::table("notifications")->where("id","=",$id)->first();

            if(!$notification){
                return response()->json([
                    "message" => "update notification error",
                    "status" => 404,
                    "success" => false
                ],404);
            }

            DB::table("notifications")->where("id","=",$id)->update(["read_at"=>now()]);

            return response()->json([
                "message" => "تم تحديث الاشعار بنجاح",
                "status" => 200,
                "success" => true
            ],200);
        } catch (\Throwable $th) {
            response()->json([
                "message" => "update notification error",
                "status" => 500,
                "success" => false
            ],500);
        }
    }

    public function make_all_read(){
        try {
            $user=User::findOrFail(Auth::guard("api")->user()->id);

            foreach($user->unreadNotifications as $notification){
                $notification->markAsRead();
            }

            return response()->json([
                "message" => "تم تحديث الاشعارات بنجاح",
                "status" => 200,
                "success" => true
            ]);
        } catch (\Throwable $th) {
            response()->json([
                "message" => "update notifications error",
                "status" => 500,
                "success" => false
            ],500);
        }
    }
}
