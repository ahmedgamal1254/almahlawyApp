<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VrService extends Model
{
    use HasFactory;

    protected $table="vr_services";
    protected $fillable=["name","creds","description"];
}
