<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\ResponseRequest;

class FreeBookController extends Controller
{
    use ResponseRequest;
    public function index(){
        $free_books=DB::table("media","books")
        ->where("school_grade_id","=",Auth::guard("api")->user()->school_grade_id)->where("free","=",1)
        ->limit(2)->get();

        return $this->make_response($free_books,200);
    }
}
