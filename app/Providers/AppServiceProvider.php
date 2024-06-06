<?php

namespace App\Providers;

use Carbon\Carbon;
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\View;
use App\Models\Teacher;
use Illuminate\Support\Facades\DB;
use App\Services\{
    Month,
    UnLockMonth
};
use App\View\Components\Operation;
use Illuminate\Support\Facades\Blade;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Carbon::setLocale('ar'); //

        Paginator::useBootstrapFive();

        Blade::component('operation', Operation::class);


        // $teachers=DB::table("teachers")->join("subjects","subjects.id","=","teachers.subject_id")
        // ->select("teachers.*","subjects.title as subject")->get();

        // View::share("teachers",$teachers);
//
        // $this->app->singleton(Month::class, function ($app) {return new Month(); });
        // $this->app->singleton(UnLockMonth::class, function ($app) {return new UnLockMonth(); });
//
    }
}
