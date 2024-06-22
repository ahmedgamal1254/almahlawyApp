<?php

namespace App\Traits;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

trait ViewerTrait{

    public function view_book($book_id,$guard="web"){
        $book_view=DB::table("book_view")->where("book_id","=",$book_id)
        ->where("user_id","=",Auth::guard($guard)->user()->id)->first();

        if(!$book_view){
            DB::table("book_view")->insert([
                "user_id"=>Auth::guard($guard)->user()->id,
                "book_id"=>$book_id,
                "counter"=>1
            ]);
        }
    }
}
