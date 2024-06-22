<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StudentExamsController extends Controller
{
    public function index($id){
        try {
            $student=User::find($id);

            $exams = DB::table('exams')
            ->join('exam_student', 'exam_student.exam_id', '=', 'exams.id')
            ->join('question_exams', 'question_exams.exam_id', '=', 'exams.id')
            ->leftJoin('question_exam_students', function ($join) use($id) {
                $join->on('question_exam_students.exam_id', '=', 'exams.id')
                ->where("question_exam_students.user_id","=",$id);
            })
            ->select(
                'exams.id',
                "exams.title",
                "exam_student.created_at",
                "degree",
                "total",
                DB::raw('COUNT(DISTINCT question_exams.id) as question_exams_count'),
                DB::raw('COUNT(DISTINCT question_exam_students.id) as question_exam_students_count')
            )
            ->where("exam_student.user_id",$id)
            ->groupBy('exam_student.exam_id')
            ->orderByDesc("exam_student.exam_id")
            ->paginate(20);

            return view("Teacher.students.show_exams",compact("student","exams"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'عفوا حدث خطا ما');
        }
    }

    public function show($user_id,$exam_id){
        try {
            $questions=DB::table('questions')
            ->leftJoin('question_exam_students',function ($join) use ($user_id){
                $join->on('questions.id',"=","question_exam_students.question_id")
                ->where("question_exam_students.user_id","=",$user_id);
            })
            ->join("question_exams","question_exams.question_id","=","questions.id")
            ->select('questions.id','question_exam_students.student_answer',"questions.degree",
            'question_exam_students.exam_id',"questions.img",'questions.name','questions.answer','questions.chooses')
            ->groupBy("questions.id")
            ->get();

            $exam=DB::table("exams")->where("id","=",$exam_id)->first();

            if(!$exam){
                return redirect()->back()->with('error',' عفوا لا يوجد هذا الامتحان'.$exam_id);
            }

            if(!$questions){
                return redirect()->back()->with('error',' عفوا ربما لم تم  تمتحن هذا الامتحان من قبل'.$exam_id);
            }


            // array of data (exams , month , teacher_id , month_id)
            $data["count"]=count($questions);
            $data["questions"]=$questions;
            $data["exam"]=DB::table("exams")->where("id","=",$exam_id)->first();

            return view("Teacher.students.show_exam",compact("data"));
        } catch (\Throwable $th) {
            // return $th->getMessage();
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }
}
