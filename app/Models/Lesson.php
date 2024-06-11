<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Lesson extends Model
{
    use HasFactory,SoftDeletes;

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
