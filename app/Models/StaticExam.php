<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StaticExam extends Model
{
    use HasFactory;

    protected $table="static_exams";

    protected $fillable=["title","description","student_degree",
        "total_degree","exam","user_id","teacher_id","unit_id","school_grade_id"];

    public function user(){
        return $this->belongsTo(User::class,"user_id");
    }

    public function school_grade(){
        return $this->belongsTo(SchoolGrade::class,"school_grade_id");
    }
}
