<?php
namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject,MustVerifyEmail{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name','email','password',
        'provider_id','provider',
        'subject_id','school_grade_id',
        'phonenumber','teacher_id',
        'all_points','active_points','group_id',
        'phone_parent','government','profile',
        "email_verified_at"
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
    */
    public function getJWTCustomClaims()
    {
        return [];
    }
    public function exams(){
        return $this->belongsToMany(Exam::class,'exam_student')
        ->select("exams.id as exam_id","title","description","date_exam","degree","total");
    }

    public function paper_exams(){
        return $this->hasMany(StaticExam::class,"user_id");
    }

    public function schoolgrade(){
        return $this->belongsTo(SchoolGrade::class,"school_grade_id");
    }
    public function group(){
        return $this->belongsTo(Group::class,"group_id");
    }

    public function months(){
        return $this->belongsToMany(Month::class,"month_student")->withPivot("points_paid","created_at");
    }
}
