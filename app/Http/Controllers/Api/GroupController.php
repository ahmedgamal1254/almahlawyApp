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
        ->join("school_grades","school_grades.id","=","class_studies.school_grade_id")
        ->select("class_studies.id","group_name","school_grades.name as school_grade_name")
        ->whereNull("deleted_at")->get();

        return $this->make_response($groups,200);
    }
}
