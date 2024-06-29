<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\ResponseRequest;
use App\Services\{
    Month,
    MonthService,
    UnLockMonth,
};
use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;

class MonthController extends Controller
{
    use ResponseRequest;

    protected $month;
    protected $unlockmonth;

    public function __construct(MonthService $month){
        $this->month=$month;
        $this->unlockmonth=new UnLockMonth();
    }
    public function index(){
        $user = Auth::guard("api")->user();

        $cacheKey = "months_data_{$user->id}";
        $cacheDuration = 60 * 60 * 24; // Cache duration in seconds (e.g., 24 hour / 1 day)

        // store user id key in months cache
        function storeCacheKey($key) {
            $cacheKeyList = "months_data_keys";

            $keys = Cache::get($cacheKeyList, []);
            $keys[] = $key;
            Cache::put($cacheKeyList, $keys, 60*60);
        }

        $months = Cache::remember($cacheKey, $cacheDuration, function () use ($user) {
            return DB::table("months")
            ->leftJoin("month_student", function ($join) use ($user) {
                $join->on("months.id", "=", "month_student.month_id")
                ->where("month_student.user_id", $user->id);
            })
            ->select("months.id", "months.month_date as date", "months.month_name as name",
            "months.month_description as description",
            "year", "month", "month_student.lock", "month_student.points_paid", "month_student.user_id")
            ->orderByDesc("month_student.points_paid")
            ->get();
        });

        storeCacheKey($cacheKey);

        $cacheKeyBooks = "books_data_{$user->school_grade_id}";
        $cacheKeyLessons = "lessons_data_{$user->school_grade_id}";
        $cacheKeyExams = "exams_data_{$user->school_grade_id}";

        $books = Cache::remember($cacheKeyBooks, $cacheDuration, function () use ($user) {
            return DB::table("months")
            ->select("months.month_date", DB::raw('Count(DISTINCT media.id) as book_count'), "status")
            ->leftJoin("media", "months.month_date", "=", DB::raw("DATE_FORMAT(media.date_show, '%Y-%m')"))
            ->groupBy("months.month_date")
            ->where("months.status", "=", 0)
            ->where("media.school_grade_id", "=", $user->school_grade_id)
            ->get();
        });

        $lessons = Cache::remember($cacheKeyLessons, $cacheDuration, function () use ($user) {
            return DB::table("months")
                ->select("months.month_date", DB::raw('Count(DISTINCT lessons.id) as lesson_count'), "status")
                ->leftJoin("lessons", "months.month_date", "=", DB::raw("DATE_FORMAT(lessons.date_show, '%Y-%m')"))
                ->groupBy("months.month_date")
                ->where("lessons.school_grade_id", "=", $user->school_grade_id)
                ->get();
        });

        $exams = Cache::remember($cacheKeyExams, $cacheDuration, function () use ($user) {
            return DB::table("months")
                ->select("months.month_date", DB::raw('Count(DISTINCT exams.id) as exam_count'), "status")
                ->leftJoin("exams", "months.month_date", "=", DB::raw("DATE_FORMAT(exams.date_exam, '%Y-%m')"))
                ->groupBy("months.month_date")
                ->where("exams.school_grade_id", "=", $user->school_grade_id)
                ->get();
        });

        $months = collect($months)->map(function ($month) use ($lessons, $exams, $books) {
            $lesson = $lessons->where('month_date', $month->date)->first();
            $exam = $exams->where('month_date', $month->date)->first();
            $book = $books->where('month_date', $month->date)->first();

            return (object)array_merge([
                "id" => $month->id,
                "date" => Carbon::parse($month->date)->format("Y-m-d"),
                "name" => $month->name,
                "description" => $month->description,
                "opened" => isset($month->lock) ? true:False,
                "points_paid" => isset($month->points_paid) ? $month->points_paid:0,
                'lesson_count' => $lesson ? $lesson->lesson_count : 0,
                'exam_count' => $exam ? $exam->exam_count : 0,
                'book_count' => $book ? $book->book_count : 0,
            ]);
        });

        return $this->make_response($months,200);
    }

    public function show($id){
        $user=Auth::guard("api")->user();

        $value=$this->month->check_student_month($id,$user);

        if($value > 0){
            $data=$this->month->get_data($id,$user);

            return $this->make_response($data,200);
        }else{
            return response()->json(
                [
                    "error" => "عفوا أنت غير مصرح لك بالدخول على هذا  المحتوى",
                    "status" => 401,
                    "success" => false
                ],
            401);
        }
    }

    public function unlock_month(Request $request){
        // validation exam id , question array
        $validator = Validator::make($request->all(), [
            'month_id' => 'required|integer|exists:months,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        if(isset($request->month_id)){
            $monthId = $request->input('month_id');

            $month=DB::table("months")->where("id","=",$monthId)->first();

            if(!$month){
                return $this->make_response([
                    "error" => "عفوا هذا الشهر غير موجود"
                ],404);
            }

            if(!is_null($monthId)){
                // user id
                $user=Auth::guard('api')->user();
                // check if points greater than 100
                if($user->active_points >= $month->cost){
                    $months=$this->unlockmonth->check_if_user_get_month($request,"api");

                    if($months<=0){
                        $this->unlockmonth->update_user($month,"api");

                        $this->unlockmonth->register_month_for_student($request,$month,"api");

                        // forget cache
                        $cacheKey = "months_data_{$user->id}";
                        Cache::forget($cacheKey);

                        return response([
                            "status" => 200,
                            "msg" => "مبروك لقد تم فتح محتويات الشهر يمكنك التصفح الان",
                            "success"=>true,
                            "points" =>Auth::guard('api')->user()->active_points,
                        ]);
                    }else{
                        return response([
                            "status" => 200,
                            "msg" => "مبروك لقد تم شراء محتويات هذا الشهر من قبل",
                            "success"=>true,
                        ]);
                    }
                }else{
                    return response([
                        "status"=>200,
                        "msg" => "عفوا أنت لا تملك الرصيد الكافى لفتح الشهر",
                    ]);
                }
            }
            else{
                return response()->json([
                    "status"=>500,
                    "msg" => "عفوا هذا المحتوى  خاطئ",
                ],500);
            }
        }else{
            return response()->json([
                "status"=>404,
                "msg" => "عفوا هذا غير صحيح ربما تكون مشترك فى الكورس من قبل",
            ],404);
        }
    }
}
