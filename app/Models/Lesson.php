<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    use HasFactory;

    public function school_grade(){
        return $this->belongsTo(SchoolGrade::class);
    }

    public function unit(){
        return $this->belongsTo(Unit::class);
    }

    public function teacher(){
        return $this->belongsTo(Teacher::class);
    }
}
