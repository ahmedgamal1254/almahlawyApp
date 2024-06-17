<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Http\Request;

class GroupController extends Controller
{
    use ResponseRequest;
    public function index(){
        $groups=DB::table("class_studies")
        ->select("class_studies.id","group_name")
        ->whereNull("deleted_at")->get();

        return $this->make_response($groups,200);
    }
}
