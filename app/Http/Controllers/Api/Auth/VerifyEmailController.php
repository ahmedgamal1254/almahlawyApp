<?php

namespace App\Http\Controllers\APi\Auth;

use App\Http\Controllers\Controller;
use App\Mail\RegisterUser;
use App\Models\RegisterToken;
use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Http\Resources\PaperExamStudentResource;
use App\Http\Resources\ProfileUserResource;
use App\Http\Resources\ExamStudentResource;
use Illuminate\Support\Facades\Log;
use JWTAuth;

class VerifyEmailController extends Controller
{
    public function send_otp(Request $request){
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'string', 'email', 'max:255', "exists:users,email"],
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(), 422);
        }

        try {
            $pincode=rand(100000,999999);

            // user
            $user=User::where("email",$request->email)->first();

            if(!$user){
                return response()->json(["message" => "user not found","status"=>404,"success"=>false],404);
            }

            // Send verification email
            RegisterToken::updateOrCreate([
                "email" => $request->email
            ],[
                "email" => $request->email,
                "pin_code" => $pincode,
                "expired_at" => Carbon::parse()->addDays(1)
            ]);

            Mail::to($request->email)->send(new RegisterUser($user,$pincode));

            return response()->json([
                "message" => "تم ارسال الرمز على البريد الالكترونى بنجاح",
                "status" => 200,
                "success" => true
            ],200);
        } catch (\Throwable $th) {
            Log::error($th);
            return response()->json([
                "message" => "An error occurred while sending the reset email. Please try again. ",
                "success" => false
            ], 500);
        }
    }

    public function verify_email(Request $request){
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255|exists:users,email',
            'pin_code' => 'required|digits:6|numeric|exists:register_tokens,pin_code',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors(), 'status' => 422], 422);
        }

        try {
            $otp = RegisterToken::where('pin_code', $request->pin_code)
            ->where('email', $request->email)
            ->first();

            if (!$otp) {
                return response()->json(['error' => 'Invalid OTP or email', 'status' => 404], 404);
            }

            $user = User::where('email', $otp->email)->first();

            // Generate token for the user
            $token = JWTAuth::fromUser($user);

            if ($user->email_verified_at) {
                return $this->createNewToken($token, $user,'Email Already verified .');
            }

            $user->update(['email_verified_at' => now()]);
            $otp->delete();

            return $this->createNewToken($token, $user,'Email verified successfully.');
        } catch (\Throwable $th) {
            Log::error($th);

            return response()->json([
                "message" => "An error occurred while sending the reset email. Please try again. ",
                "success" => false
            ], 500);
        }
    }

    protected function createNewToken($token, $user,$message)
    {
        $profile = new ProfileUserResource($user);
        $paper_exams = PaperExamStudentResource::collection($user->paper_exams);
        $exams = ExamStudentResource::collection($user->exams);

        return response()->json([
            'message' => $message,
            'status' => 200,
            'success' => true,
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => JWTAuth::factory()->getTTL(),
            'data' => [
                'profile' => $profile,
                'paper_exams' => $paper_exams,
                'exams' => $exams
            ]
        ],200);
    }
}
