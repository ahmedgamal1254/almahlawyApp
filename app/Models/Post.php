<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    public function school_grade(){
        return $this->belongsTo(SchoolGrade::class,"school_grade_id");
    }
}
