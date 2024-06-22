<?php
namespace App\Http\Controllers;

use App\Models\Media;
use App\Http\Requests\StoreMediaRequest;
use App\Http\Requests\UpdateMediaRequest;
use App\Jobs\NotificationBookJob;
use App\Models\Unit;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use App\Traits\{Upload,MakeDate};
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Traits\UploadLarageFile;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class MediaController extends Controller
{
    use Upload,MakeDate,UploadLarageFile;
    public function index()
    {
        try {
            $books=DB::table('media')
            ->join('school_grades', 'media.school_grade_id', '=', 'school_grades.id')
            ->leftJoin('units', 'media.unit_id', '=', 'units.id')
            ->select('media.*', 'units.title as subject_name', 'school_grades.name as school_grade')
            ->whereNull("media.deleted_at")
            ->orderByDesc("created_at")
            ->paginate(10);

            return view("Teacher.books.index",compact("books"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function create()
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=Unit::get();

            return view("Teacher.books.add",compact("school_grades","units"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function store(StoreMediaRequest $request)
    {
        try {
            $caption=Null;
            if($request->file("img")){
                // image upload name must img
                $caption=$this->image_upload($request,'books_caption');
            }

            $book=new Media();
            $book->title=$request->title;
            $book->description=$request->description;
            $book->caption=$caption;
            $book->school_grade_id=$request->school_grade_id;
            $book->unit_id=$request->unit_id;
            $book->url=$request->url;
            $book->teacher_id=Auth::guard('teacher')->user()->id;
            $book->date_show=$this->make_date($request->date_show);
            $book->save();

            $users=User::where("school_grade_id","=",$request->school_grade_id)->get();
            NotificationBookJob::dispatch($users,$book);

            return redirect()->route("books")->with('message','تم اضافة الكتاب بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function upload_show($id){
        try {
            $video_id=$id;
            $lesson=Media::find($id);

            if(!$lesson){
                return redirect()->back()->with('error', 'هذا الدرس (الفيديو) غير موجود' . $id);
            }

            return view("Teacher.books.upload",compact("lesson"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function upload(Request $request){
        try {
            $data=$this->upload_larage_file($request,"app/books");

            $book=Media::find($request->id);
            $book->media_url=$data["fileName"];
            $book->save();

            return response()->json(["ok"=>$data["ok"],"info"=>$data["info"]]);
        } catch (\Throwable $th) {
            return $th->getMessage();
            // return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function show($id)
    {
        try {
            $book=DB::table('media')
                ->join('school_grades', 'media.school_grade_id', '=', 'school_grades.id')
                ->leftJoin('units', 'media.unit_id', '=', 'units.id')
                ->select('media.*', 'units.title as subject_name', 'school_grades.name as school_grade')
                ->where('media.id','=',$id)
                ->first();

            if(!$book){
                return redirect()->back()->with('error',"عفوا هذا الكتاب غير موجود");
            }

            return view("Teacher.books.show",compact("book"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function edit($id)
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=Unit::get();
            $book=Media::findOrFail($id);

            return view("Teacher.books.edit",compact("school_grades","units","book"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function update(UpdateMediaRequest $request)
    {
        try {
            $caption=Null;
            if($request->file("img")){
                // image upload name must img
                $caption=$this->image_upload($request,'books_caption');
            }

            $book=Media::find($request->id);
            $book->title=$request->title;
            $book->description=$request->description;
            $book->school_grade_id=$request->school_grade_id;
            $book->date_show=$this->make_date($request->date_show);
            $book->unit_id=$request->unit_id;
            $book->caption=$caption == null ? $request->book_caption : $caption;
            $book->teacher_id=Auth::guard('teacher')->user()->id;
            $book->save();

            return redirect()->route("books")->with('message','تم الحفظ بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function destroy($id)
    {
        try {
            $book=Media::find($id);

            if(!$book){
                return redirect()->back()->with('error', 'هذا الدرس (الفيديو) غير موجود' . $id);
            }

            Media::find($id)->delete();

            return redirect()->route("books")->with('message','تم حذف الدرس بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function download($id){

    }
}
