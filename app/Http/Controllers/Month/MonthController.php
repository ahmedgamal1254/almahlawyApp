<?php
namespace App\Http\Controllers\Month;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Teacher;
use App\Traits\Viewer;

class MonthController extends Controller
{
    public function index(Request $request,$id){
        try {
            $query=DB::table("teachers")->join("subjects","subjects.id","=","teachers.subject_id")
            ->select("teachers.*","subjects.title as subject");

            $teacher_toggle=$query->where("teachers.id","!=",$request->id)->first();

            $teacher=DB::table("teachers")->join("subjects","subjects.id","=","teachers.subject_id")
            ->select("teachers.*","subjects.title as subject")->where("teachers.id","=",$request->id)->first();

            if(!$teacher){
                return redirect()->back()->with('error',' عفوا لا يوجد هذا المدرس'.$id);
            }

            $months=DB::table("months")->select("months.*")
            ->where("months.status","=",0)
            ->where("months.teacher_id","=",$teacher->id)
            ->groupBy("months.month_date")
            ->orderBy("months.year")->orderBy("months.orderValue")
            ->get();

            $months_available = DB::table("month_student")->select("months.*", "month_student.lock", "month_student.points_paid",
            "month_student.user_id")
            ->join("months","month_student.month_id","=","months.id")
            ->where("month_student.user_id", "=", Auth::user()->id)
            ->where("month_student.teacher_id", "=", $teacher->id)
            ->orderBy("months.year")->orderBy("months.orderValue")
            ->get();

            $months=$months_available->merge($months)->unique("id");  // merge two array all months and months which student participant for it

            // return $months;
            $books=DB::table("months")->select("months.month_date",DB::raw('Count(DISTINCT media.id) as book_count'),"status")
            ->leftJoin("media","months.month_date","=",DB::raw("DATE_FORMAT(media.date_show, '%Y-%m')"))
            ->leftJoin("users","users.school_grade_id","=","media.school_grade_id")
            ->groupBy("months.month_date")
            ->where("months.status","=",0)
            ->where("media.teacher_id","=",$teacher->id)
            ->where("months.teacher_id","=",$teacher->id)
            ->where("media.school_grade_id","=",Auth::user()->school_grade_id)->orWhereNull("media.id")
            ->orderBy("months.year")->orderBy("months.orderValue")
            ->get();

            $lessons=DB::table("months")->select("months.month_date",DB::raw('Count(DISTINCT lessons.id) as lesson_count'),"status")
            ->leftJoin("lessons","months.month_date","=",DB::raw("DATE_FORMAT(lessons.date_show, '%Y-%m')"))
            ->leftJoin("users","users.school_grade_id","=","lessons.school_grade_id")
            ->groupBy("months.month_date")
            ->where("lessons.teacher_id","=",$teacher->id)
            ->where("lessons.school_grade_id","=",Auth::user()->school_grade_id)->orWhereNull("lessons.id")
            ->where("months.teacher_id","=",$teacher->id)
            ->orderBy("months.year")->orderBy("months.orderValue")
            ->get();

            $exams=DB::table("months")->select("months.month_date",DB::raw('Count(DISTINCT exams.id) as exam_count'),"status")
            ->leftJoin("exams","months.month_date","=",DB::raw("DATE_FORMAT(exams.date_exam, '%Y-%m')"))
            ->leftJoin("users","users.school_grade_id","=","exams.school_grade_id")
            ->groupBy("months.month_date")
            ->where("exams.teacher_id","=",$teacher->id)
            ->where("exams.school_grade_id","=",Auth::user()->school_grade_id)->orWhereNull("exams.id")
            ->where("months.teacher_id","=",$teacher->id)
            ->orderBy("months.year")->orderBy("months.orderValue")
            ->get();

            $months = collect($months)->map(function ($month) use ($lessons, $exams, $books) {
                $lesson = $lessons->where('month_date', $month->month_date)->first();
                $exam = $exams->where('month_date', $month->month_date)->first();
                $book = $books->where('month_date', $month->month_date)->first();

                return (object)array_merge((array)$month, [
                    'lesson_count' => $lesson ? $lesson->lesson_count : 0,
                    'exam_count' => $exam ? $exam->exam_count : 0,
                    'book_count' => $book ? $book->book_count : 0,
                ]);
            });

            return view("student.teacher",compact("teacher_toggle","teacher","months"));
        } catch (\Throwable $th) {
            // echo $th->getMessage();
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }
}
