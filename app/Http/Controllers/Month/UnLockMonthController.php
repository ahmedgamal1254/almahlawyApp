<?php
namespace App\Http\Controllers\Month;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\
{Teacher,User,Month_User};
use App\Traits\Viewer;
use App\Services\UnLockMonth;

class UnLockMonthController extends Controller
{
    /***
     * user auth can unlock month if
     * he paid required points
     * steps
     * check user auth points if greater than 100 complete process
     * decreament 100 points from user auth
     * make month unlocked and add it to table month_user
    */
    protected $unlockmonth;

    public function __construct(){
        $this->unlockmonth=new UnLockMonth();
    }

    public function unlock_month(Request $request){
        if(isset($request->month_id) && isset($request->teacher_id)){
            $monthId = $request->input('month_id');
            $teacherId = $request->input('teacher_id');

            $month=DB::table("months")->where("id","=",$monthId)->first();

            if(!is_null($monthId) & !is_null($teacherId)){
                // check if points greater than 100
                if(Auth::user()->active_points >= $month->cost){
                    $months=$this->unlockmonth->check_if_user_get_month($request);

                    if($months<=0){
                        $this->unlockmonth->update_user($month);

                        $this->unlockmonth->register_month_for_student($request,$month);

                        return response([
                            "status" => 200,
                            "msg" => "مبروك لقد تم فتح مجتويات الشهر يمكنك التصفح الان",
                            "success"=>true,
                            "points" =>Auth::user()->active_points,
                            "swal" => "swal2-success"
                        ]);
                    }else{
                        return response([
                            "status" => 200,
                            "swal" => "swal2-info",
                            "msg" => "مبروك لقد تم شراء محتويات هذا الشهر من قبل",
                            "success"=>true,
                        ]);
                    }
                }else{
                    return response([
                        "status"=>200,
                        "msg" => "عفوا أنت لا تملك الرصيد الكافى لفتح الشهر",
                        "swal" => "swal2-error"
                    ]);
                }
            }
            else{
                return response([
                    "status"=>201,
                    "msg" => "عفوا هذا المحتوى  خاطئ",
                    "swal" => "swal2-error"
                ]);
            }
        }else{
           return response([
                    "status"=>200,
                    "msg" => "عفوا هذا غير صحيح ربما تكون مشترك فى الكورس من قبل",
                    "swal" => "swal2-error"
                ]);
        }
    }
}
