<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    protected $fillable=[
        'name','type','description','chooses',"type_question","img","degree",
        'answer','subject_id','school_grade_id','teacher_id','unit_id'
    ];

    public function unit(){
        return $this->belongsTo(Unit::class,"unit_id");
    }

    public function exams(){
        return $this->belongsToMany(Exam::class,"question_exams");
    }

    public function users(){
        return $this->belongsToMany(User::class,"question_exam_students");
    }

    public function exam_students(){
        return $this->belongsToMany(User::class,"exam_student");
    }

    public function exam_timer(){
        return $this->belongsToMany(User::class,"exam_student");
    }

    public function delete()
    {
        $this->exams()->detach();
        $this->users()->detach();
        $this->exam_students()->detach();
        $this->exam_timer()->detach();
        return parent::delete();
    }
}
