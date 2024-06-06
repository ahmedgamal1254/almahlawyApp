<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProfileTeacher extends Model
{
    use HasFactory;

    protected $table="teacher_settings";

    protected $fillable=[
        "id",
        "phonenumber",
        "whatsapp",
        "bio",
        "avater",
        "facebook",
        "youtube",
        "instagram",
        "tiktok"
        ,"linkedin",
        "telegram",
        "subject",
        "address",
        "city",
        "state",
        "teacher_id"
    ];
}
