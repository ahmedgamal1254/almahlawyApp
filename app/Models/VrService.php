<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class VrService extends Model
{
    use HasFactory,SoftDeletes;

    protected $table="vr_services";
    protected $fillable=["name","creds","description"];
}
