<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Traits\Upload;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class RechargeWalletController extends Controller
{
    use Upload;
    public function recharge(Request $request){
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            "month_id" => "nullable|integer|exists:months,id"
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            if (!$request->hasFile("image")) {
                return response()->json(['errors' => ['image' => "No file image, please upload an image"]], 422);
            }

            // Assuming image_upload is a method to handle the file upload
            $data["image_url"] = $this->image_upload($request, "payments", "image");
            $data["user_id"] = Auth::guard("api")->id();
            $data["month_id"] = $request->month_id;

            $payment = Payment::create($data);

            if ($payment) {
                return response()->json(
                    [
                        "success" => true,
                        "message" => "File uploaded successfully",
                        "status" => 201
                    ],
                201);
            }

            return response()->json(
                [
                    "success" => false,
                    "message" => "Failed to create payment record",
                    "status" => 500
                ],
            500);
        } catch (\Exception $e) {
            // Log the error for debugging
            Log::error('Payment creation failed: ' . $e->getMessage());

            return response()->json(
                [
                    "success" => false,
                    "message" => "An unexpected error occurred" . $e->getMessage(),
                    "status" => 500
                ],
            500);
        }
    }
}
