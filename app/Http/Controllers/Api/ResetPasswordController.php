<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Mail\ResetPassword;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Password;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class ResetPasswordController extends Controller
{
    public function store(Request $request){
        $validator=Validator::make($request->all(),[
            'email' => ['required', 'email'],
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(), 422);
        }

        $user=User::where("email",$request->email)->first();

        if(!$user){
            return response()->json([
                "message"=>"user not found , please singup",
                "success" => "false"
            ],404);
        }

        $pincode=rand(100000,999999);

        try {
            // Create pin code
            DB::beginTransaction();

            DB::table('password_reset_tokens')->insert([
                'email' => $request->email,
                'pin_code' => $pincode,
                'expired_at' => Carbon::now()->addMinutes(10),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]);

            Mail::to($request->email)->send(new ResetPassword($pincode));

            DB::commit();

            return response()->json([
                "success" => true,
                "message" => "تم ارسال ايميل لك بنجاح"
            ], 201);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                "message" => "An error occurred while sending the reset email. Please try again. ",
                "success" => false
            ], 500);
        }
    }
}
