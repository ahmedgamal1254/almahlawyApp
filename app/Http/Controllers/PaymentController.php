<?php

namespace App\Http\Controllers;

use App\Models\Month;
use App\Models\Month_User;
use App\Notifications\UpdatePoints;
use Illuminate\Http\Request;
use App\Models\Payment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Notifications\MonthNotification;
use App\Traits\Upload;
use Illuminate\Support\Facades\Notification;

class PaymentController extends Controller
{
    use Upload;

    public function index(){
        try {
            $payments=Payment::with("user:id,name")->whereNull("status")->paginate(50);

            return view("Teacher.payments.index",compact("payments"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function show($id)
    {
        try {
            $payment=Payment::with("user","month")->find($id);

            if(!$payment){
                return redirect()->back()->with('error', 'هذا الطلب غير موجود' . $id);
            }

            if($payment->status != 0){
                return redirect()->back()->with('error', 'هذا الطلب غير صحيح' . $id);
            }

            return view("Teacher.payments.show",compact("payment"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
