<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RegisterToken extends Model
{
    use HasFactory;

    protected $fillable=["email","expired_at","pin_code"];
}
