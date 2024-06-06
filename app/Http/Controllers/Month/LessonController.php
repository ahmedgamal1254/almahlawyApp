<?php

namespace App\Http\Controllers\Month;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Teacher;
use App\Traits\Viewer;
use App\Services\Month;

class LessonController extends Controller
{
    protected $month;
    public function __construct(Month $month){
        $this->month=$month;
    }
    public function lessons($teacher_id,$id){
        // check if auth id and month id identical
        // if not return user to dashboard
        $value=$this->month->check_student_month($id);

        if($value > 0){
            $month=DB::table("months")->where("id","=",$id)->first();

            $extract_month=$this->month->extract_month_and_year($id);

            // lessons
            $lessons=$this->month->get_lessons_per_month($extract_month["month"],$extract_month["year"],$teacher_id);

            // return $teacher
            $teacher=Teacher::where("id","=",$teacher_id)->first();

            // array of data (lessons , videos , exams , month , teacher_id , month_id)
            $data["lessons"]=$lessons;
            $data["month"]=$month;
            $data["teacher_id"]=$teacher_id;
            $data["month_id"]=$id;

            return view("student.lessons.index",compact("data","teacher"));
        }else{
            return redirect()->route("student_dashboard");
        }
    }


    public function lesson_show($teacher_id,$id,$lesson_id){
        try {
            // check if auth id and month id identical
            // if not return user to dashboard
            $value=DB::table('month_student')->where("user_id","=",Auth::user()->id)->where("month_id","=",$id)->count();

            if($value > 0){
                $month=DB::table("months")->where("id","=",$id)->first();

                // extract year and month
                $month_date=explode("-",$month->month_date);

                // year and month
                $year=$month_date[0];
                $month_num=$month_date[1];

                // lesson
                $lesson=DB::table("lessons")->select('lessons.*')->whereYear('date_show','=',$year)
                ->whereMonth('date_show','=',$month_num)->where('school_grade_id','=',Auth::user()->school_grade_id)
                ->where('teacher_id','=',$teacher_id)->where('lessons.id','=',$lesson_id)->first();

                // lesson if watched
                $lesson_watched=DB::table("lessons")->select('lessons.*',"video_minute.current_time")->whereYear('date_show','=',$year)
                ->leftJoin("video_minute","video_minute.video_id","=","lessons.id")
                ->whereMonth('date_show','=',$month_num)->where('school_grade_id','=',Auth::user()->school_grade_id)
                ->where("video_minute.user_id","=",Auth::user()->id)
                ->where('teacher_id','=',$teacher_id)->where('lessons.id','=',$lesson_id)->first();

                // return $teacher
                $teacher=Teacher::where("id","=",$teacher_id)->first();


                // array of data (lessons , videos , exams , month , teacher_id , month_id)
                $data["lesson"]=$lesson;
                $data["lesson_watch"]=$lesson_watched;
                $data["month"]=$month;
                $data["teacher_id"]=$teacher_id;
                $data["month_id"]=$id;

                // return $lesson_watched;
                return view("student.lessons.show",compact("data","teacher","lesson"));
            }else{
                return redirect()->route("student_dashboard");
            }
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }
}
