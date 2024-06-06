<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MediaLibraryController extends Controller
{
  public function __construct()
  {
    $this->middleware(['auth', 'verified']);
  }

  public function mediaLibrary(Request $request){
    $user_obj = auth()->user();
    return view('medialibrary', ['user_obj' => $user_obj ]);
  }
}
