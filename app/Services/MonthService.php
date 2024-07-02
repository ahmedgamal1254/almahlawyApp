<?php
namespace App\Services;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\{
    LessonResource,BookResource,
};
use App\Models\Month as ModelsMonth;
use Illuminate\Support\Facades\Cache;

class MonthService{

    public function check_student_month($id,$user){
        return DB::table('month_student')->where("user_id","=",$user->id)->where("month_id","=",$id)->count();
    }

    public function extract_month_and_year($id){
        $month=Cache::get("month_{$id}",function () use($id){
            return DB::table('months')->select("month_date","year","month","month_description","cost")->find($id);
        });

        if(!$month){
            return response([
                "success" => false,
                "message" => "data not found",
                "status" => 404
            ],404);
        }

        // extract year and month
        $month_date=explode("-",$month->month_date);

        // year and month
        $year=$month_date[0];
        $month_num=$month_date[1];

        $data["month"]=$month;
        $data["year"]=$year;
        $data["month_num"]=$month_num;

        return $data;
    }

    public function get_lessons_per_month($year,$month,$user){
        // cache lessons by school_grade and month and key
        $lesson_key="lessons_per_month_{$month}_for_{$year}_school_grade_{$user->school_grade_id}";

        $lessons=Cache::remember($lesson_key,now()->addDays(30),function () use($year,$month,$user){
            return DB::table("lessons")->select("*")->whereYear("date_show","=",$year)->whereMonth("date_show","=",$month)
            ->where("school_grade_id","=",$user->school_grade_id)->get();
        });

        return LessonResource::collection($lessons);
    }

    public function get_books_per_month($year,$month,$user){
        // cache books by school_grade and month and key
        $book_key="books_per_month_{$month}_for_{$year}_school_grade_{$user->school_grade_id}";

        $books=Cache::remember($book_key,now()->addDays(30),function () use($year,$month,$user){
            return DB::table("media")->whereYear("date_show","=",$year)->whereMonth("date_show","=",$month)
            ->where("school_grade_id","=",$user->school_grade_id)->get();
        });

        return BookResource::collection($books);
    }

    public function get_exams_per_month($year,$month,$user){
        // cache exams by school_grade and month and key
        $exams_key="exams_per_month_{$month}_for_{$year}_school_grade_{$user->school_grade_id}_user_{$user->id}";

        $exams=Cache::remember($exams_key,60*60,function () use($year,$month,$user){
            return DB::table('exams')->leftJoin('exam_student', function ($join) use ($user) {
                $join->on('exams.id', '=', 'exam_student.exam_id')
                ->where('exam_student.user_id', '=', $user->id);
            })
            ->leftJoin('question_exams', 'question_exams.exam_id', '=', 'exams.id')
            ->select('exams.*', 'exam_student.total', 'exam_student.degree', DB::raw('COUNT(question_exams.id) as cnt'))
            ->where('exams.school_grade_id', '=', $user->school_grade_id)
            ->whereMonth('exams.date_exam', '=', $month)
            ->whereYear('exams.date_exam', '=', $year)
            ->groupBy('exams.id')
            ->get();
        });

        return $exams;
    }

    public function month_stats($year,$month,$guard){
        $stats["questions_rate"]=$this->questions_rate($year,$month,$guard);
        $stats["complete_month"]=$this->compelete_month($year,$month,$guard);
        return $stats;
    }

    public function questions_rate($year,$month,$user){
        // cache exams by school_grade and month and key
        $questions_key="questions_per_month_{$month}_for_{$year}_school_grade_{$user->school_grade_id}";

        // all questions belong month and year
        $all_questions=Cache::remember($questions_key,60*60,function () use($year,$month,$user){
            return DB::table('exams')->join("question_exams","question_exams.exam_id","=","exams.id")
            ->select("exams.id","question_exams.id as question_id")
            ->where("exams.school_grade_id","=",$user->school_grade_id)
            ->whereMonth("date_exam","=",$month)->whereYear("date_exam","=",$year)
            ->get();
        });

        //  all questions belong month and year for user
        $questions_user_key="questions_student_{$user->id}_per_month_{$month}_for_{$year}";

        $all_questions_student=Cache::remember($questions_user_key,60*60,function () use($year,$month,$user){
            return DB::table('question_exam_students')
            ->select("questions.answer","student_answer","exams.id")
            ->join("exams","exams.id","=","question_exam_students.exam_id")
            ->join("questions","questions.id","=","question_exam_students.question_id")
            ->where("question_exam_students.user_id","=",$user->id)
            ->whereMonth("date_exam","=",$month)->whereYear("date_exam","=",$year)
            ->get();
        });

        //  all questions belong month and year for user and correct
        $count_correct_answers=0;
        foreach($all_questions_student as $question){
            if($question->answer == $question->student_answer){
                $count_correct_answers++;
            }
        }

        $stats_question["count_correct_answers"]=$count_correct_answers;
        $stats_question["all_questions_student"]=count($all_questions_student);
        $stats_question["all_questions_count"]=count($all_questions);

        return $stats_question;
    }

    public function compelete_month($year,$month,$user){
        $book_viewed_user_key="books_viewed_student_{$user->id}_per_month_{$month}_for_{$year}";
        $minute_watched_user_key="minute_watched_student_{$user->id}_per_month_{$month}_for_{$year}";

        // all books view and in belongs this month
        $book_viewed_count=Cache::remember($book_viewed_user_key,60*60*24,function () use ($year,$month,$user){
            return DB::table("book_view")->select("book_view.counter")
            ->join("media","media.id","=","book_view.book_id")
            ->whereMonth("date_show","=",$month)->whereYear("date_show","=",$year)
            ->where("book_view.user_id","=",$user->id)->count();
        });

        // lesson if watched
        $lessons_watched=Cache::remember($minute_watched_user_key,60*60*24,function () use($year,$month,$user){
            return DB::table("lessons")->select('lessons.id',"lessons.duration","video_minute.current_time")
            ->whereYear('date_show','=',$year)
            ->leftJoin("video_minute",function ($join) use ($user){
                $join->on("video_minute.video_id","=","lessons.id")
                ->where("video_minute.user_id","=",$user->id);
            })
            ->whereMonth('date_show','=',$month)->where('school_grade_id','=',$user->school_grade_id)
            ->get();
        });

        $sum_watched=0;
        $sum_video_duration=0;

        foreach($lessons_watched as $lesson){
            $sum_watched+=$lesson->current_time;
            $sum_video_duration+=$lesson->duration;
        }

        $complete_month["book_viewed"]=$book_viewed_count;
        $complete_month["minute_watched"]=round($sum_watched/60,2);
        $complete_month["video_duration"]=round($sum_video_duration==0?1:$sum_video_duration);
        $complete_month["all_minutes"]=round($sum_video_duration==0?1:$sum_video_duration);
        $complete_month["minutes_watched"]=$sum_watched/60;

        return $complete_month;
    }

    public function get_data($month_id,$user){
        $month_value=$this->extract_month_and_year($month_id);

        // lessons
        $lessons=$this->get_lessons_per_month($month_value["year"],$month_value["month_num"],$user);

        // media
        $books=$this->get_books_per_month($month_value["year"],$month_value["month_num"],$user);

        // exams
        $exams=$this->get_exams_per_month($month_value["year"],$month_value["month_num"],$user);

        $exams=collect($exams)->map(function ($exam){
            return [
                "id" => $exam->id,
                "title" => $exam->title,
                "description" => $exam->description,
                "code" => $exam->code,
                "duration" => $exam->duration,
                "exam_date" => $exam->date_exam,
                "start_time" => $exam->start_time,
                "end_time" => $exam->end_time,
                "total" => $exam->total,
                "degree" => $exam->degree,
                "questions_count" => $exam->cnt
            ];
        });

        $stats=$this->month_stats($month_value["year"],$month_value["month_num"],$user);

        // array of data (lessons , videos , exams , month , month_id , months stats)
        $data["lessons"]=$lessons;
        $data["books"]=$books;
        $data["exams"]=$exams;
        $data["month"]=$month_value["month"];

        $data["count_correct_answers"]=$stats["questions_rate"]["count_correct_answers"];
        $data["all_questions_student"]=$stats["questions_rate"]["all_questions_student"];
        $data["all_questions_count"]=$stats["questions_rate"]["all_questions_count"];

        $data["books_count"]=count($books)==0?1:count($books);
        $data["book_viewed"]=$stats["complete_month"]["book_viewed"];

        $data["minute_watched"]=$stats["complete_month"]["minute_watched"];
        $data["video_duration"]=$stats["complete_month"]["video_duration"];

        $percentage_lessons=round(($stats["complete_month"]["minutes_watched"])/($stats["complete_month"]["all_minutes"]),2)*100;
        $percentage_books=round(($stats["complete_month"]["book_viewed"])/$data["books_count"],2)*100;
        $data["percentage"]=($percentage_books + $percentage_lessons) / 2;

        return $data;
    }
}
