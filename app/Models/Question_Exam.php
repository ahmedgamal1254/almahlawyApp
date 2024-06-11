<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Question_Exam extends Model
{
    use HasFactory,SoftDeletes;

    protected $table="question_exams";

    protected $fillable=['exam_id','question_id','teacher_id'];
}
