<?php

namespace App\Traits;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

trait MakeDate{

    /**
     * take data from input monht type and convert it to shape of date
     *
     */
    public function make_date($date){
        $t=strtotime($date);
        return date("Y-m-d",$t);
    }
}

?>
