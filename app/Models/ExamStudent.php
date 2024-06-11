<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ExamStudent extends Model
{
    use HasFactory,SoftDeletes;
    protected $table="exam_student";
    protected $fillable=["user_id","exam_id","status","degree","total"];
}
