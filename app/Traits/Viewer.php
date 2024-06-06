<?php

namespace App\Traits;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

trait Viewer{

    public function viewer($book_id){
        $book_view=DB::table("book_view")->where("book_id","=",$book_id)
        ->where("user_id","=",Auth::user()->id)->count();

        if($book_view > 0){
            $book_view=DB::table("book_view")->where("book_id","=",$book_id)
            ->where("user_id","=",Auth::user()->id)->first();

            DB::table("book_view")->where("book_id","=",$book_id)->where("user_id","=",Auth::user()->id)->update(["counter"=>$book_view->counter+=1]);

        }else{
            DB::table("book_view")->insert([
                "user_id"=>Auth::user()->id,
                "book_id"=>$book_id,
                "counter"=>1
            ]);
        }
    }
}
