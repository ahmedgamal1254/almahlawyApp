<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\{User,Month_User};
use Illuminate\Support\Facades\Request;

class UnLockMonth{
    public function update_user($month,$guard="web"){
        // update user
        $id=Auth::guard($guard)->user()->id;
        $user=User::find($id);
        $user->active_points=Auth::guard($guard)->user()->active_points-$month->cost;
        $user->save();
    }

    public function register_month_for_student($request,$month,$guard="web"){
        // month user
        $month_user=new Month_User();
        $month_user->user_id=Auth::guard($guard)->user()->id;
        $month_user->month_id=$request->month_id;
        $month_user->teacher_id=1;
        $month_user->lock=1; // 1 month unlocked
        $month_user->points_paid=$month->cost;
        $month_user->save();

    }

    public function check_if_user_get_month($request,$guard="web"){
        $count=DB::table("month_student")->where("user_id","=",Auth::guard($guard)->user()->id)->
        where("month_id","=",$request->month_id)->count();

        return $count;
    }
}
