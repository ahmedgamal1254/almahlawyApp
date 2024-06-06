<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ExamStudentResource;
use App\Http\Resources\PaperExamStudentResource;
use App\Http\Resources\ProfileUserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Traits\ResponseRequest;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    use ResponseRequest;
    public function index(){
        $profile=User::find(Auth::guard('api')->id());

        $data["profile"]=new ProfileUserResource($profile);
        $data["paper_exams"]=PaperExamStudentResource::collection(User::find(Auth::guard('api')->id())->paper_exams);
        $data["exams"]=ExamStudentResource::collection(User::find(Auth::guard('api')->id())->exams);

        return $this->make_response($data,200);
    }
}
