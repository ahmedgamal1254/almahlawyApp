<?php

namespace App\Http\Controllers;

use App\Models\Month;
use App\Models\Month_User;
use App\Models\Payment;
use App\Models\User;
use App\Notifications\MonthNotification;
use App\Notifications\UpdatePoints;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Notification;

class UpdateWalletUserController extends Controller
{
    public function updatePoints(Request $request)
    {
        try {
            $this->validateRequest($request);

            $user = User::findOrFail($request->user_id);

            if ($request->points !== null) {
                DB::beginTransaction();

                $this->updateUserPoints($user, $request->points);
                $this->updatePayment($request->payment_id, $request->cost);

                if ($request->month_id) {
                    $this->handleMonthPurchase($user, $request->month_id, $request->points);
                }

                DB::commit();

                return $this->sendSuccessResponse($user, $request->points);
            } else {
                return redirect()->route('all_payments')->with('data', 'لم يتم ادخال بيانات');
            }
        } catch (\Throwable $th) {
            DB::rollBack();

            return redirect()->back()->with('error', 'عفوا حدث خطأ ما: ' . $th->getMessage());
        }
    }

    private function validateRequest($request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'points' => 'nullable|integer',
            'payment_id' => 'required|exists:payments,id',
            'cost' => 'required|numeric',
            'month_id' => 'nullable|exists:months,id'
        ]);
    }

    private function updateUserPoints($user, $points)
    {
        $user->active_points += $points;
        $user->all_points += $points;
        $user->save();
    }

    private function updatePayment($paymentId, $cost)
    {
        $payment = Payment::findOrFail($paymentId);
        $payment->status = $cost == 0 ? 2 : 0;
        $payment->value = $cost;
        $payment->save();
    }

    private function handleMonthPurchase($user, $monthId, $points)
    {
        $month = Month::findOrFail($monthId);

        Month_User::updateOrCreate(
            [
                'month_id' => $monthId,
                'user_id' => $user->id
            ],
            [
                'lock' => 1,
                'points_paid' => $month->cost
            ]
        );

        $user->active_points -= $month->cost;
        $user->save();

        $message = [
            'msg' => "تم شراء الشهر {$month->month_name} بنجاح",
            'points' => $points
        ];

        Notification::send($user, new MonthNotification($message));
    }

    private function sendSuccessResponse($user, $points)
    {
        $message = [
            'success' => true,
            'msg' => "تم اضافة {$points} جنيه رصيد لك",
            'points' => $points,
            'teacher_name' => Auth::guard('teacher')->user()->name
        ];

        Notification::send($user, new UpdatePoints($message));

        return redirect()->route('all_payments')->with('data', 'تم التعديل بنجاح');
    }

}
