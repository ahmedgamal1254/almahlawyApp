<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassStudy extends Model
{
    use HasFactory;

    protected $fillable=[
        "group_name","group_time","description","school_grade_id",
        "subject_id","teacher_id"
    ];

    public function students(){
        return $this->hasMany(User::class,"group_id","id");
    }

    public function school_grade(){
        return $this->belongsTo(SchoolGrade::class,"school_grade_id");
    }
}
