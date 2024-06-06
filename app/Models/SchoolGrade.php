<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class SchoolGrade extends Model
{
    use HasFactory , SoftDeletes;

    protected $table="school_grades";

    protected $fillable = [
        'name',
        'description',
        "teacher_id"
    ];

    public function lessons(){

        if(Auth::guard('teacher')->check()){
            return $this->hasMany(Lesson::class,'school_grade_id','id')->where('teacher_id',"=",1);
        }else{
            return $this->hasMany(Lesson::class,'school_grade_id','id');
        }

    }

    public function users(){
        return $this->hasMany(User::class,'school_grade_id','id');
    }

    public function classes(){
        return $this->hasMany(Group::class,'school_grade_id','id');
    }

    public function books(){
        if(Auth::guard('teacher')->check()){
            return $this->hasMany(Book::class,'school_grade_id','id')->where('teacher_id',"=",1);
        }else{
            return $this->hasMany(Book::class,'school_grade_id','id');
        }
    }

    public function exams(){
        if(Auth::guard('teacher')->check()){
            return $this->hasMany(Exam::class,'school_grade_id','id')->where('teacher_id',"=",1);
        }else{
            return $this->hasMany(Exam::class,'school_grade_id','id');
        }
    }
}
