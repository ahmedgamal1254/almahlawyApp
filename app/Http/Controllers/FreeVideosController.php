<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreFreeBookRequest;
use App\Http\Requests\StoreFreeLessonRequest;
use App\Http\Requests\UpdateFreeLessonRequest;
use App\Models\FreeVideos;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\UpdateLessonRequest;
use Illuminate\Support\Facades\Auth;
use App\Traits\{
    Upload,
    MakeDate,
    UploadLarageFile
};
use App\Models\User;
use App\Models\Teacher;
use App\Jobs\UploadVideoNotificationJob;
use Illuminate\Support\Facades\Cache;

class FreeVideosController extends Controller
{
    use Upload,MakeDate,UploadLarageFile;
    public function index()
    {
        try {
            $lessons=DB::table('free_videos')
            ->join('school_grades', 'free_videos.school_grade_id', '=', 'school_grades.id')
            ->leftJoin('units', 'free_videos.unit_id', '=', 'units.id')
            ->select('free_videos.*',"units.title as unit_name", 'school_grades.name as school_grade')
            ->where("free_videos.teacher_id","=",Auth::guard('teacher')->user()->id)
            ->whereNull("free_videos.deleted_at")
            ->orderByDesc("created_at")
            ->paginate(5);

            return view("Teacher.free-lessons.index",compact("lessons"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function create()
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=DB::table("units")->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

            return view("Teacher.free-lessons.add",compact("school_grades","units"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function store(StoreFreeLessonRequest $request)
    {
        try {
            $file=Null;
            if($request->file("img")){
                $file=$this->image_upload($request,'captions');
            }

            $lesson=new FreeVideos();
            $lesson->title=$request->title;
            $lesson->description=$request->description;
            $lesson->school_grade_id=$request->school_grade_id;
            $lesson->unit_id=$request->unit_id;
            $lesson->image_caption=$file;
            $lesson->source=$request->source;
            $lesson->video_url=$request->video_url;
            $lesson->subject_id=Auth::guard('teacher')->user()->subject_id;
            $lesson->teacher_id=Auth::guard('teacher')->user()->id;
            $lesson->duration=$request->duration;
            $lesson->save();

            // send users where show this video to job to send notification
            $video_id=$lesson->id;
            $teacher=Teacher::find(Auth::guard('teacher')->user()->id);

            $users=User::where("school_grade_id","=",$request->school_grade_id)->get();
            UploadVideoNotificationJob::dispatch($users,$video_id,$teacher->name);

            $school_grade=$request->school_grade_id;
            Cache::put("free_videos_{$school_grade}",DB::table("free_videos")->select("id","title","description","video_url","source","image_caption as img_caption")
            ->where("school_grade_id","=",$school_grade)
           ->get());

            return redirect()->route("free-lessons")->with('message','تم اضافة الدرس بنجاح من فضلك قم برفع الغيديو للدرس');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما")->withInput();
        }
    }

    public function show($id)
    {
        try {
            $lesson=DB::table('free_videos')
            ->join('school_grades', 'free_videos.school_grade_id', '=', 'school_grades.id')
            ->leftJoin('units', 'free_videos.unit_id', '=', 'units.id')
            ->select('free_videos.*', 'units.title as unit_name', 'school_grades.name as school_grade')
            ->where('free_videos.id','=',$id)
            ->first();

            if(!$lesson){
                return redirect()->back()->with('error',"عفوا حدث خطأ ما");
            }

            return view("Teacher.free-lessons.show",compact("lesson"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function edit($id)
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=DB::table("units")->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();
            $lesson=FreeVideos::findOrFail($id);

            return view("Teacher.free-lessons.edit",compact("school_grades","units","lesson"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateFreeLessonRequest $request)
    {
        try {
            $file=Null;
            if($request->file("img")){
                // image upload name must img
                $file=$this->image_upload($request,'captions');

                $lesson=FreeVideos::find($request->id);
                $lesson->title=$request->title;
                $lesson->description=$request->description;
                $lesson->image_caption=$file;
                $lesson->source=$request->source;
                $lesson->video_url=$request->video_url;
                $lesson->school_grade_id=$request->school_grade_id;
                $lesson->unit_id=$request->unit_id;
                $lesson->subject_id=Auth::guard('teacher')->user()->subject_id;
                $lesson->duration=$request->duration;
                $lesson->save();

            }else{
                $lesson=FreeVideos::find($request->id);
                $lesson->title=$request->title;
                $lesson->description=$request->description;
                $lesson->school_grade_id=$request->school_grade_id;
                $lesson->source=$request->source;
                $lesson->video_url=$request->video_url;
                $lesson->unit_id=$request->unit_id;
                $lesson->subject_id=Auth::guard('teacher')->user()->subject_id;
                $lesson->duration=$request->duration;
                $lesson->save();
            }

            $school_grade=$request->school_grade_id;
            Cache::put("free_videos_{$school_grade}",DB::table("free_videos")->select("id","title","description","source","video_url","image_caption as img_caption")
            ->where("school_grade_id","=",$school_grade)
           ->get());

            return redirect()->route("free-lessons")->with('message','تم التعديل على الدرس بنجاح');
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
            $lesson=FreeVideos::find($id);

            if(!$lesson){
                return redirect()->back()->with('error', 'هذا الدرس (الفيديو) غير موجود' . $id);
            }

            FreeVideos::find($id)->delete();

            return redirect()->route("free-lessons")->with('message','تم حذف الدرس بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function upload_show($id) {
        $video_id=$id;
        $lesson=FreeVideos::find($id);
        return view('Teacher.free-lessons.upload',compact("lesson"));
    }

    public function upload(Request $request) {
        try{
            $data=$this->upload_larage_file($request,'app/videos');

            $lesson=FreeVideos::find($request->id);
            $lesson->video_url=env("APP_URL") . "/public/app/videos/" . $data["fileName"];
            $lesson->save();

            return response()->json(["ok"=>$data["ok"],"info"=>$data["info"]]);
        }catch(\Throwable $th){
            return $th->getMessage();
        }
    }
}
