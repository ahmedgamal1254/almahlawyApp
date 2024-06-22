<?php

namespace App\Http\Controllers;

use App\Traits\CurrentTimerVideoTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CurrentTimeController extends Controller
{
    use CurrentTimerVideoTrait;
    public function index(Request $request){
        try {
            $this->current_timer_video($request,"web");

            return "success";
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");

        }
    }
}
