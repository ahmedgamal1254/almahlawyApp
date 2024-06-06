<?php

namespace App\Http\Controllers\Month;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Teacher;
use App\Traits\Viewer;
use App\Services\Month;

class BookController extends Controller
{
    protected $month;
    public function __construct(Month $month){
        $this->month=$month;
    }

    public function books($teacher_id,$id){
        // check if auth id and month id identical
        // if not return user to dashboard
        $value=$this->month->check_student_month($id);

        if($value > 0){
            $extract_month=$this->month->extract_month_and_year($id);

            $month=DB::table("months")->where("id","=",$id)->first();

            $books=$this->month->get_books_per_month($extract_month["month"],$extract_month["year"],$teacher_id);

            // return $teacher
            $teacher=Teacher::where("id","=",$teacher_id)->first();

            // array of data (lessons , videos , exams , month , teacher_id , month_id)
            $data["books"]=$books;
            $data["month"]=$month;
            $data["teacher_id"]=$teacher_id;
            $data["month_id"]=$id;

            return view("student.books.index",compact("data","teacher"));
        }else{
            return redirect()->route("student_dashboard");
        }
    }

    public function book_show($teacher_id,$id,$book_id){
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

            // lessons
            $book=DB::table("media")->select('media.*')->whereYear('date_show','=',$year)
            ->whereMonth('date_show','=',$month_num)->where('school_grade_id','=',Auth::user()->school_grade_id)
            ->where('teacher_id','=',$teacher_id)->where('id','=',$book_id)->first();

            // return $teacher
            $teacher=Teacher::where("id","=",$teacher_id)->first();


            // array of data (lessons , videos , exams , month , teacher_id , month_id)
            $data["book"]=$book;
            $data["month"]=$month;
            $data["teacher_id"]=$teacher_id;
            $data["month_id"]=$id;


            // make user show book
            $this->viewer($book_id);

            return view("student.books.show",compact("data","teacher","book"));
        }else{
            return redirect()->route("student_dashboard");
        }
    }
}
