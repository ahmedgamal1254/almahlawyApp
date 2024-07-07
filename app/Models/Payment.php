<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Payment extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable=["image_url","user_id"];

    public function user(){
        return $this->belongsTo(User::class,"user_id");
    }

    public function month(){
        return $this->belongsTo(Month::class,"month_id");
    }
}
