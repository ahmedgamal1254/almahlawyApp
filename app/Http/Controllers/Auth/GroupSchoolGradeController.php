<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use illuminate\Support\Facades\DB;

class GroupSchoolGradeController extends Controller
{
    public function index(Request $request){
        $groups=DB::table('class_studies')->where("school_grade_id","=",$request->input("school_grade_id"))->get();

        return response()->json($groups, 200);
    }
}
