<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Traits\ResponseRequest;
use Illuminate\Support\Facades\DB;

class GovernmnetController extends Controller
{
    use ResponseRequest;
    public function index(){
        $governments=DB::table("governments")->get();

        return $this->make_response($governments,200);
    }
}
