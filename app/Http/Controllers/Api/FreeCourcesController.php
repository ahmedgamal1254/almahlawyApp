<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\ResponseRequest;

class FreeCourcesController extends Controller
{
    use ResponseRequest;
    public function index(){
        $free_videos=DB::table("free_videos")->select("title","description","video_url","image_caption")
        ->get();

        return $this->make_response($free_videos,200);
    }
}
