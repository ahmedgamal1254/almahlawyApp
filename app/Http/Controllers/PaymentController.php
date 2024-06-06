<?php

namespace App\Http\Controllers;

use App\Notifications\UpdatePoints;
use Illuminate\Http\Request;
use App\Models\Payment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Traits\Upload;
use Illuminate\Support\Facades\Notification;

class PaymentController extends Controller
{
    use Upload;
    public function index(){
        try {
            $payments=DB::table("payments")->join("teachers","teachers.id","=","payments.teacher_id")
            ->select("payments.*","teachers.name as teacher_name")
            ->where("user_id","=",Auth::user()->id)->orderByDesc("created_at")->limit(25)->get();

            $months=DB::table("month_student")->select("month_student.*","months.year","months.month_name_ar",
            "teachers.name as teacher_name","months.month as month_num","months.cost")
            ->join('months','months.id',"=","month_student.month_id")
            ->join("teachers","teachers.id","=","month_student.teacher_id")
            ->where("month_student.user_id",Auth::user()->id)
            ->orderByDesc("created_at")->get();

            return view("student.payments.index",compact("payments","months"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function create()
    {
        $teachers=DB::table("teachers")->get();
        return view("student.payments.add",compact("teachers"));
    }

    public function store(Request $request)
    {
        try {
            $file=Null;

            if($request->file("img")){
                // image upload name must img
                $file=$this->image_upload($request,'payments');
            }

            $payment=new Payment();
            $payment->image_url=$file;
            $payment->teacher_id=$request->teacher_id;
            $payment->user_id=Auth::user()->id;
            $payment->status=1;
            $payment->save();

            return response([
                "message" =>'تم رفع الايصال بنجاح'
            ]);
        } catch (\Throwable $th) {
            return response([
                "error" =>'لم يتم رفع الايصال بنجاح'
            ]);
        }
    }

    public function show($id)
    {
        try {
            $payment=DB::table("payments")->select("users.name as username","users.id as user_id","payments.*")
            ->join("users","users.id","=","payments.user_id")
            ->where("payments.status","=",1)->where("payments.id","=",$id)
            ->where("payments.teacher_id","=",Auth::guard("teacher")->user()->id)->first();

            if(!$payment){
                return redirect()->back()->with('error', 'هذا الطلب غير موجود' . $id);
            }

            return view("Teacher.payments.show",compact("payment"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function all_payments(){
        try {
            $payments=DB::table("payments")->select("users.name as username","payments.*")
            ->join("users","users.id","=","payments.user_id")
            ->where("payments.status","=",1)
            ->where("payments.teacher_id","=",Auth::guard("teacher")->user()->id)->paginate(50);

            return view("Teacher.payments.index",compact("payments"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function points_update(Request $request)
    {
        try {
            if($request->points != null){
                $user=User::find($request->user_id);
                $user->active_points+=$request->points;
                $user->all_points+=$request->points;
                $user->save();

                $payment=Payment::find($request->payment_id);
                $payment->status=$request->cost == 0 ? 2:0;
                $payment->value=$request->cost;
                $payment->save();

                // notification to selected user
                $user=User::find($request->user_id);

                $message["success"]=true;
                $message["msg"]="تم اضافة رصيد لك";
                $message["points"]=$request->points;
                $message["teacher_name"]=Auth::guard("teacher")->user()->name;

                Notification::send($user,new UpdatePoints($message));

                return redirect()->route("all_payments")->with("data","تم التعديل بنجاح");
            }else{
                return redirect()->route("all_payments")->with("data","لم يتم ادخال بيانات");
            }
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function destroy(Payment $payment)
    {
        return redirect()->back()->with("message","تمت العملية بنجاح");
    }
}
