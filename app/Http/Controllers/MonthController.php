<?php
namespace App\Http\Controllers;

use App\Http\Requests\MonthRequest;
use App\Http\Requests\UpdateMonthRequest;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Month;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

use function PHPSTORM_META\type;

class MonthController extends Controller
{
    public function index(){
        try {
            $months=DB::table("months")->where("teacher_id","=",Auth::guard("teacher")->user()->id)
            ->orderBy("orderValue")->orderBy("year")->get();

            return view("teacher.months.index",compact("months"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function show($id){
        try {
            $month=DB::table("months")->where("id","=",$id)->first();

            if (!$month) {
                // If the exam is not found, return back with a message
                return back()->with('error', 'هذا الشهر غير موجود' . $id);
            }

            // extract year and month
            $month_date=explode("-",$month->month_date);

            // year and month
            $year=$month_date[0];
            $month_num=$month_date[1];

            $school_grades=DB::table("school_grades")->get();

            // lessons
            $lessons=DB::table('lessons')->select("lessons.*","school_grades.name as school_grade_name")
            ->whereYear("lessons.date_show","=",$year)->whereMonth("lessons.date_show","=",$month_num)
            ->join("school_grades","school_grades.id","=","lessons.school_grade_id")
            ->where("lessons.teacher_id","=",Auth::guard("teacher")->user()->id)->orderByDesc("lessons.id")->get();

            // media
            $books=DB::table('media')->select("media.*","school_grades.name as school_grade_name")
            ->join("school_grades","school_grades.id","=","media.school_grade_id")
            ->whereYear("media.date_show","=",$year)->whereMonth("media.date_show","=",$month_num)
            ->where("media.teacher_id","=",Auth::guard("teacher")->user()->id)->orderByDesc("media.id")->get();

            $data["month"]=$month;
            $data["lessons"]=$lessons;
            $data["books"]=$books;
            $data["school_grades"]=$school_grades;

            return view("Teacher.months.show",compact("data"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function filter($id,$school_grade_id){
        try {
            $month=DB::table("months")->where("id","=",$id)->first();

            if (!$month) {
                // If the exam is not found, return back with a message
                return back()->with('error', 'هذا الشهر غير موجود' . $id);
            }

            // extract year and month
            $month_date=explode("-",$month->month_date);

            // year and month
            $year=$month_date[0];
            $month_num=$month_date[1];

            // lessons
            $lessons=DB::table('lessons')->select("lessons.*","school_grades.name as school_grade_name")
            ->whereYear("lessons.date_show","=",$year)->whereMonth("lessons.date_show","=",$month_num)
            ->join("school_grades","school_grades.id","=","lessons.school_grade_id")
            ->where("lessons.teacher_id","=",Auth::guard("teacher")->user()->id)
            ->where("lessons.school_grade_id","=",$school_grade_id)
            ->orderByDesc("lessons.id")->get();

            // media
            $books=DB::table('media')->select("media.*","school_grades.name as school_grade_name")
            ->join("school_grades","school_grades.id","=","media.school_grade_id")
            ->whereYear("media.date_show","=",$year)->whereMonth("media.date_show","=",$month_num)
            ->where("media.teacher_id","=",Auth::guard("teacher")->user()->id)
            ->where("media.school_grade_id","=",$school_grade_id)
            ->orderByDesc("media.id")->get();

            $data["month"]=$month;
            $data["lessons"]=$lessons;
            $data["books"]=$books;

            return view("Teacher.months.filter",compact("data"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function set_state($id){
        try {
            $month=DB::table("months")->where("id","=",$id)->first();

            if (!$month) {
                // If the exam is not found, return back with a message
                return response(['error'=>'هذا الشهر غير موجود' . $id],200);
            }

            $status=0;
            if($month->status == 1){
                $status=0;
            }else{
                $status=1;
            }

            DB::update('update months set status = ? where id = ?', [$status,$id]);

            return response([
                'status' => 200,
                'msg' => 'تم التعديل بنجاح',
                "months" => DB::table('months')->get(),
            ]);
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function edit($id){
        try {
            $month=DB::table("months")->where("id","=",$id)->first();

            if (!$month) {
                // If the exam is not found, return back with a message
                return redirect()->back()->with('error', 'هذا الشهر غير موجود' . $id);
            }

            return view("Teacher.months.edit",compact("month"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function update(UpdateMonthRequest $request){
        $date = Carbon::parse($request->month);
        $month_en = $date->monthName;
        $month_ar = $date->locale('ar')->monthName;
        $year = $date->year;

        $month_num=$date->month < 10 ? "0".$date->month:$date->month;

        try {
            $month=Month::find($request->id);
            $month->month_date=$year."-".$month_num;
            $month->year=$year;
            $month->month=$date->month;
            $month->month_name=$month_en;
            $month->month_name_ar=$month_ar;
            $month->month_description=$request->description;
            $month->cost=$request->cost;
            $month->orderValue=$request->orderValue;
            $month->teacher_id=Auth::guard("teacher")->user()->id;
            $month->save();

            return redirect()->route("show_months");
        }catch (\Throwable $th) {
            return redirect()->route("show_months")->with("error","عفوا لم يتم اضافة الشهر");
        }
    }

    public function add(){
        return view("Teacher.months.add");
    }

    public function store(MonthRequest $request){
        try {
            $date = Carbon::parse($request->month);
            $month_en = $date->monthName;
            $month_ar = $date->locale('ar')->monthName;
            $year = $date->year;

            $month_num=$date->month < 10 ? "0".$date->month:$date->month;

            $count=DB::table('months')->where("month_date","=",$year."-".$month_num)->count();

            if($count <= 0){
                $month=new Month();
                $month->month_date=$year."-".$month_num;
                $month->year=$year;
                $month->month=$date->month;
                $month->month_name=$month_en;
                $month->month_name_ar=$month_ar;
                $month->month_description=$request->description;
                $month->cost=$request->cost;
                $month->status=0;
                $month->orderValue=$request->orderValue;
                $month->teacher_id=Auth::guard("teacher")->user()->id;
                $month->save();

                return redirect()->route("show_months");
            }else{
                return redirect()->route("show_months");
            }
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
