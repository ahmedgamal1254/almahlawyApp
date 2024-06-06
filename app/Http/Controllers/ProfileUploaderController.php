<?php
namespace App\Http\Controllers;

use App\Http\Requests\ProfileUploaderRequest;
use Illuminate\Http\Request;
use App\Traits\Upload;
use Illuminate\Support\Facades\Validator;

class ProfileUploaderController extends Controller
{
    use Upload;
    public function index(Request $request){
        $validator = Validator::make($request->all(), [
            'file' => 'required|mimes:png,jpg,jpeg|max:2048'
       ]);

       if ($validator->fails()) {
            $data['success'] = 0;
            $data['error'] = $validator->errors()->first('file'); // Error response
       }else{
            if($request->file("img")){
                $this->image_upload($request,"users");
                $data["success"] = 1;
                $data["message"] = 'تم رفع الصورة بنجاح';
            }
            else{
                $data['success'] = 2;
                $data['message'] = 'لم يتم رفع الصورة';
            }
       }
    }
}
