<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Exam extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable=[
        'code',
        'duration',
        'exam_date',
        'start_time',
        'school_grade_id',
        'subject_id',
        'teacher_id'
    ];

    public function users(){
        return $this->belongsToMany(User::class,"exam_student");
    }

    public function stage(){
        return $this->belongsTo(SchoolGrade::class,"school_grade_id");
    }

    public function questions(){
        return $this->belongsToMany(Question::class,"question_exams");
    }
}
