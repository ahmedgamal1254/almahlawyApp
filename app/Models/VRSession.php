<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class VRSession extends Model
{
    use HasFactory,SoftDeletes;

    protected $table="sessionslive";

    protected $fillable=["name","photo","link","description","serviceName","teacher_id","unit_id","school_grade_id","active"];

    public function school_grade(){
        return $this->belongsTo(SchoolGrade::class,"school_grade_id");
    }

    public function unit(){
        return $this->belongsTo(Unit::class,"unit_id");
    }
}
