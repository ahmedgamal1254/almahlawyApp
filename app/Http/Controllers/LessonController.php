<?php

namespace App\Http\Controllers;

use App\Models\Lesson;
use App\Http\Requests\StoreLessonRequest;
use App\Http\Requests\UpdateLessonRequest;
use App\Jobs\NotificationLessonJob;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\{
    Upload,
    MakeDate
};
use App\Models\User;
use App\Models\Teacher;
use App\Jobs\UploadVideoNotificationJob;
use App\Notifications\NotificationLesson;
use App\Notifications\UploadVideoNotification;
use Carbon\Carbon;
use Illuminate\Support\Facades\Notification;

class LessonController extends Controller
{
    use Upload,MakeDate;
    public function index()
    {
        try {
            $lessons=DB::table('lessons')
            ->join('school_grades', 'lessons.school_grade_id', '=', 'school_grades.id')
            ->leftJoin('units', 'lessons.unit_id', '=', 'units.id')
            ->select('lessons.*',"units.title as unit_name", 'school_grades.name as school_grade')
            ->where("lessons.teacher_id","=",Auth::guard('teacher')->user()->id)
            ->whereNull("lessons.deleted_at")
            ->orderByDesc("created_at")
            ->paginate(5);

            return view("Teacher.lessons.index",compact("lessons"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function create()
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=DB::table("units")->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

            return view("Teacher.lessons.add",compact("school_grades","units"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function store(StoreLessonRequest $request)
    {
        try {
            $file=Null;
            if($request->file("img")){
                // image upload name must img
                $file=$this->image_upload($request,'captions');
            }

            $lesson=new Lesson();
            $lesson->title=$request->title;
            $lesson->description=$request->description;
            $lesson->school_grade_id=$request->school_grade_id;
            $lesson->unit_id=$request->unit_id;
            $lesson->img_caption=$file;
            $lesson->subject_id=Auth::guard('teacher')->user()->subject_id;
            $lesson->teacher_id=Auth::guard('teacher')->user()->id;
            $lesson->date_show=$this->make_date($request->date_show);
            $lesson->duration=$request->duration;
            $lesson->save();

            $dateShow = Carbon::parse($lesson->date_show);
            Carbon::setLocale("ar");
            $monthName = $dateShow->format('F'); // Full month name
            $message="تم رفع فيديو جديد لشهر $monthName";

            // send users where show this video to job to send notification
            NotificationLessonJob::dispatch(
                User::where("school_grade_id",$request->school_grade_id)->get(),
                $message
            );

            return redirect()->route("lessons")->with('message','تم اضافة الدرس بنجاح من فضلك قم برفع الغيديو للدرس');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function show($id)
    {
        try {
            $lesson=DB::table('lessons')
            ->join('school_grades', 'lessons.school_grade_id', '=', 'school_grades.id')
            ->leftJoin('units', 'lessons.unit_id', '=', 'units.id')
            ->select('lessons.*', 'units.title as unit_name', 'school_grades.name as school_grade')
            ->where('lessons.id','=',$id)
            ->first();

            if(!$lesson){
                return redirect()->back()->with('error',"عفوا حدث خطأ ما");
            }

            return view("Teacher.lessons.show",compact("lesson"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function edit($id)
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=DB::table("units")->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();
            $lesson=Lesson::findOrFail($id);

            return view("Teacher.lessons.edit",compact("school_grades","units","lesson"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateLessonRequest $request)
    {
        try {
            $file=Null;
            if($request->file("img")){
                // image upload name must img
                $file=$this->image_upload($request,'captions');

                $lesson=Lesson::find($request->id);
                $lesson->title=$request->title;
                $lesson->description=$request->description;
                $lesson->img_caption=$file;
                $lesson->school_grade_id=$request->school_grade_id;
                $lesson->unit_id=$request->unit_id;
                $lesson->subject_id=Auth::guard('teacher')->user()->subject_id;
                $lesson->date_show=$this->make_date($request->date_show);
                $lesson->duration=$request->duration;
                $lesson->save();

            }else{
                $lesson=Lesson::find($request->id);
                $lesson->title=$request->title;
                $lesson->description=$request->description;
                $lesson->school_grade_id=$request->school_grade_id;
                $lesson->unit_id=$request->unit_id;
                $lesson->subject_id=Auth::guard('teacher')->user()->subject_id;
                $lesson->date_show=$this->make_date($request->date_show);
                $lesson->duration=$request->duration;
                $lesson->save();
            }

            return redirect()->route("lessons")->with('message','تم التعديل على الدرس بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            $lesson=Lesson::find($id);

            if(!$lesson){
                return redirect()->back()->with('error', 'هذا الدرس (الفيديو) غير موجود' . $id);
            }

            Lesson::find($id)->delete();

            return redirect()->route("lessons")->with('message','تم حذف الدرس بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
