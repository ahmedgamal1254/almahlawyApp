<?php

namespace App\Http\Controllers\Video;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Lesson;
use App\Traits\UploadLarageFile;

class UploadController extends Controller
{
    use UploadLarageFile;

    public function index($id) {
        $video_id=$id;
        $lesson=Lesson::find($id);
        return view('Videos.index',compact("lesson"));
    }

    public function upload(Request $request) {
        try{
            $data=$this->upload_larage_file($request,'app/videos');

            $lesson=Lesson::find($request->id);
            $lesson->video_url=env("APP_URL") . "/public/app/videos/" . $data["fileName"];
            $lesson->save();

            return response()->json(["ok"=>$data["ok"],"info"=>$data["info"]]);
        }catch(\Throwable $th){
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
