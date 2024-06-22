<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Group;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Http\Request;

class GroupController extends Controller
{
    use ResponseRequest;
    public function index(){
        $groups=Group::select("class_studies.id","group_name")->get();

        return $this->make_response($groups,200);
    }
}
