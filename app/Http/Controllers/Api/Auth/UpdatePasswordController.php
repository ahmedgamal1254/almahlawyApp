<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UpdatePasswordController extends Controller
{
    public function check_code(Request $request){
        $validator=Validator::make($request->all(),[
            'pin_code' => ['required', "digits_between:5,7","numeric"],
            "email" => ["required","email","exists:password_reset_tokens,email"]
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(), 422);
        }

        $code=DB::table("password_reset_tokens")->where("pin_code",$request->pin_code)->where("email",$request->email)->first();

        if($code){
            $expire_at=Carbon::createFromFormat('Y-m-d H:i:s', $code->expired_at);

            if ($expire_at->isPast()) {
                return response()->json([
                    'message' => 'your pincode is expired please try again.'
                ], 200);
            }

            return response()->json([
                "email" => $code->email,
                "pin_code" => $request->pin_code,
                "success" => true
            ],200);
        }else{
            return response()->json([
                "message" => "may be error pincode not be accepted",
                "success" => false
            ],200);
        }
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'pin_code' => ['required', 'digits_between:5,7', 'numeric', 'exists:password_reset_tokens,pin_code'],
            'email' => ['required', 'email', 'exists:users,email'],
            'password' => ['required', 'min:8', 'max:25'],
            'password_confirmed' => ['required', 'same:password'],
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Check password reset token
        $reset = DB::table('password_reset_tokens')
            ->where('email', $request->email)
            ->where('pin_code', $request->pin_code)
            ->first();

        if ($reset) {
            $expire_at = Carbon::createFromFormat('Y-m-d H:i:s', $reset->expired_at);

            if ($expire_at->isPast()) {
                return response()->json([
                    'message' => 'Your pin code is expired. Please try again.',
                    'success' => false
                ], 200);
            }

            DB::beginTransaction();
            try {
                $user = User::where('email', $request->email)->first();
                $user->update([
                    'password' => Hash::make($request->password)
                ]);

                // Delete token
                DB::table('password_reset_tokens')
                    ->where('email', $request->email)
                    ->where('pin_code', $request->pin_code)
                    ->delete();

                DB::commit();

                return response()->json([
                    'success' => true,
                    'message' => 'Password updated successfully',
                    'user' => $user
                ], 200);
            } catch (\Exception $e) {
                DB::rollBack();
                return response()->json([
                    'success' => false,
                    'message' => 'An error occurred while updating the password. Please try again.'
                ], 500);
            }
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Invalid pin code or email.'
            ], 200);
        }
    }
}
