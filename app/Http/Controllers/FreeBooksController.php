<?php
namespace App\Http\Controllers;

use App\Models\Media;
use App\Http\Requests\StoreMediaRequest;
use App\Http\Requests\UpdateMediaRequest;
use App\Models\FreeBooks;
use Illuminate\Support\Facades\DB;
use App\Traits\{Upload,MakeDate};
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Traits\UploadLarageFile;

class FreeBooksController extends Controller
{
    use Upload,MakeDate,UploadLarageFile;
    public function index()
    {
        try {
            $books=DB::table('free_books')
            ->join('school_grades', 'free_books.school_grade_id', '=', 'school_grades.id')
            ->join('subjects', 'free_books.subject_id', '=', 'subjects.id')
            ->select('free_books.*', 'subjects.title as subject_name', 'school_grades.name as school_grade')
            ->where("free_books.teacher_id","=",Auth::guard('teacher')->user()->id)
            ->orderByDesc("created_at")
            ->paginate(10);

            return view("Teacher.free-books.index",compact("books"));
        } catch (\Throwable $th) {
            echo $th->getMessage();
            // return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function create()
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $units=DB::table("units")->get();
            $subjects=DB::table("subjects")->where("deleted_at","=",null)->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();

            return view("Teacher.free-books.add",compact("school_grades","units","subjects"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function store(Request $request)
    {
        // return $request->all();
        try {
            $caption=Null;
            if($request->file("img")){
                // image upload name must img
                $caption=$this->image_upload($request,'books_caption');
            }

            $book=new FreeBooks();
            $book->title=$request->title;
            $book->description=$request->description;
            $book->cover=$caption;
            $book->unit_id=$request->unit_id;
            $book->school_grade_id=$request->school_grade_id;
            $book->subject_id=Auth::guard('teacher')->user()->subject_id;
            $book->media_url=$request->url;
            $book->teacher_id=Auth::guard('teacher')->user()->id;
            $book->save();

            return redirect()->route("free-books")->with('message','تم اضافة الكتاب بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما")->withInput();
        }
    }

    public function upload_show($id){
        try {
            $video_id=$id;
            $lesson=FreeBooks::find($id);

            if(!$lesson){
                return redirect()->back()->with('error', 'هذا المحتوى غير موجود' . $id);
            }

            return view("Teacher.free-books.upload",compact("lesson"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function upload(Request $request){
        try {
            $data=$this->upload_larage_file($request,"app/books");

            $book=FreeBooks::find($request->id);
            $book->media_url=$data["fileName"];
            $book->save();

            return response()->json(["ok"=>$data["ok"],"info"=>$data["info"]]);
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function show($id)
    {
        try {
            $book=DB::table('free_books')
                ->join('school_grades', 'media.school_grade_id', '=', 'school_grades.id')
                ->join('subjects', 'media.subject_id', '=', 'subjects.id')
                ->select('media.*', 'subjects.title as subject_name', 'school_grades.name as school_grade')
                ->where('media.id','=',$id)
                ->first();

            return view("Teacher.free-books.show",compact("book"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function edit($id)
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
            $subjects=DB::table("subjects")->where("deleted_at","=",null)->where("teacher_id","=",Auth::guard("teacher")->user()->id)->get();
            $book=FreeBooks::findOrFail($id);

            return view("Teacher.free-books.edit",compact("school_grades","subjects","book"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function update(UpdateMediaRequest $request)
    {
        try {
            $file=Null;
            if($request->file("pdf")){
                // image upload name must img
                $file=$this->pdf_upload($request,'books');
            }

            $caption=Null;
            if($request->file("img")){
                // image upload name must img
                $caption=$this->image_upload($request,'books_caption');
            }

            $book=FreeBooks::find($request->id);
            $book->title=$request->title;
            $book->description=$request->description;
            $book->school_grade_id=$request->school_grade_id;
            $book->date_show=$this->make_date($request->date_show);
            $book->subject_id=Auth::guard('teacher')->user()->subject_id;
            $book->media_url=$file == null ? $request->book_url : $file;
            $book->caption=$caption == null ? $request->book_caption : $caption;
            $book->teacher_id=Auth::guard('teacher')->user()->id;
            $book->save();

            return redirect()->route("books")->with('message','تم الحفظ بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
    public function destroy(Media $media)
    {
        //
    }

    public function download($id){

    }
}
