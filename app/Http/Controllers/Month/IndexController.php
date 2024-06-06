<?php
namespace App\Http\Controllers\Month;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Teacher;
use App\Traits\Viewer;
use App\Services\Month;

class IndexController extends Controller
{
    use Viewer;
    protected $month;
    public function __construct(Month $month){
        $this->month=$month;
    }
    public function index(Request $request,$teacher_id,$id){
       try {
            // check if auth id and month id identical
            // if not return user to dashboard
            $value=$this->month->check_student_month($id);

            if($value > 0){
                $data=$this->month->get_data($teacher_id,$id);
                $teacher=$data["teacher"];
                $teacher_toggle=$data["teacher_toggle"];

                return view("student.month",compact("data","teacher","teacher_toggle"));
            }else{
                return redirect()->route("student_dashboard");
            }
       } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
       }
    }
}
