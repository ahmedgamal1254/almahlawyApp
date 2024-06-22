<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Traits\ResponseRequest;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class GovernmnetController extends Controller
{
    use ResponseRequest;
    public function index(){

        $cacheKey = 'governments_all';
        $cacheDuration = now()->addDays(30);

        $governments = Cache::remember($cacheKey, $cacheDuration, function () {
            return DB::table('governments')->get();
        });

        return $this->make_response($governments, 200);
    }
}
