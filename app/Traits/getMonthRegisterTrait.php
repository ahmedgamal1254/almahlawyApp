<?php

namespace App\Traits;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

trait GetMonthRegisterTrait{

    public function get_months($guard="api"){
        $months=Auth::guard($guard)->user()->months;

        return $months;
    }
}

