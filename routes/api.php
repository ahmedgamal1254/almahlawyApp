<?php

use App\Http\Middleware\AuthMobileTeacher;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\LessonController as ApiLessonController;
use App\Http\Controllers\Api\PostController as ApiPostController;
use App\Http\Controllers\Api\{
    TeacherController,
    TeacherAuthMobileController,
    SchoolGradeController,
    ProfileController,
    MonthController,
    MediaController,
    GroupController,
    GovernmnetController,
    ExamController,
    AuthMobileController,
    FreeBookController,
    FreeCourcesController,
    FreeExamController,
    NotificationController,
    RechargeWalletController,
    ResetPasswordController,
    UpdatePasswordController
};
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
*/

Route::get("school_grades",[SchoolGradeController::class,'index']);
Route::get("groups",[GroupController::class,'index']);
Route::get("givernments",[GovernmnetController::class,'index']);

Route::group([
    'prefix' => 'auth'
],function ($router) {
    Route::post('/login', [AuthMobileController::class, 'login']);
    Route::post('/register', [AuthMobileController::class, 'register']);
    Route::post('/resend-otp', [AuthMobileController::class, 'resend_otp']);
    Route::post('/register-otp', [AuthMobileController::class, 'register_otp']);
    Route::post("/reset-password",[ResetPasswordController::class,"store"]);
    Route::post("/check-code",[UpdatePasswordController::class,"check_code"]);
    Route::post("/update-password",[UpdatePasswordController::class,"store"]);

});

Route::group([
    'middleware' => 'auth_user',
    'prefix' => 'auth'

], function ($router) {
    Route::post('/logout', [AuthMobileController::class, 'logout']);
    Route::post('/refresh', [AuthMobileController::class, 'refresh']);
    Route::get('/user-profile', [AuthMobileController::class, 'userProfile']);
    Route::post('/update-profile', [AuthMobileController::class, 'update']);
});

// all posts which user ==> school_grade_id
Route::group([
    'middleware' => 'auth_user',
], function ($router) {
    Route::get('/posts', [ApiPostController::class, 'index']);
    Route::get('/post/{id}', [ApiPostController::class, 'show']);
});

// all lessons (videos)
Route::group([
    'middleware' => 'auth_user',
], function ($router) {
    Route::get('/lessons', [ApiLessonController::class, 'index']);
    Route::get('/lesson/{id}', [ApiLessonController::class, 'show']);
});

// all books
Route::group([
    'middleware' => 'auth_user',
], function ($router) {
    Route::get('/books', [MediaController::class, 'index']);
    Route::get('/book/{id}', [MediaController::class, 'show']);
});

// all exams
Route::group([
    'middleware' => 'auth_user',
], function ($router) {
    Route::get('/exams', [ExamController::class, 'index']);
    Route::get('/exam/{id}', [ExamController::class, 'show']);
    Route::post('/send_exam', [ExamController::class, 'send_exam']);
    Route::get('/exam/{id}/show_results', [ExamController::class, 'show_exam_results']);
});

Route::group([
    'middleware' => 'auth_user'
], function ($router){
    Route::get("/profile",[ProfileController::class,'index']);
});

Route::group([
    'middleware' => 'auth_user'
], function ($router){
    Route::get("months",[MonthController::class,'index']);
    Route::get("month/{id}",[MonthController::class,'show']);
    Route::get("open_month",[MonthController::class,'unlock_month']);
});

Route::group([
    // 'middleware' => 'auth_user'
], function ($router){
    Route::get("teacher",[TeacherController::class,'index']);
});

// free videos / books / exam
Route::group([
    'middleware' => 'auth_user'
],function ($router){
    Route::get("free-videos",[FreeCourcesController::class,'index']);
    Route::get("free-video/{id}",[FreeCourcesController::class,'show']);

    Route::get("free-books",[FreeBookController::class,'index']);
    Route::get("free-book/{id}",[FreeBookController::class,'show']);
});

// teacher dashboard
Route::group([
    'middleware' => 'auth:api_teacher',
    'prefix' => 'auth-teacher'

], function ($router) {
    Route::post('/login', [TeacherAuthMobileController::class, 'login']);
    Route::post('/logout', [TeacherAuthMobileController::class, 'logout']);
    Route::post('/refresh', [TeacherAuthMobileController::class, 'refresh']);
    Route::get('/user-profile', [TeacherAuthMobileController::class, 'userProfile']);
});

Route::group([
    'middleware' =>'guest:api_teacher',
    'prefix' => 'auth-teacher'
],function ($router) {
    Route::post('/login', [TeacherAuthMobileController::class, 'login']);
});

// recharge wallet
Route::group([
    'middleware' => 'auth_user'
], function ($router){
    Route::post("recharge_wallet",[RechargeWalletController::class,'recharge']);
});

// notifications
Route::middleware(['auth_user'])->group(function () {
    Route::get('/notifcations',[NotificationController::class,"index"]);
    // show notification payment to make it read
    Route::get('/notifications/show/{id}',[NotificationController::class,"update"]);
    // make all notifications read
    Route::get('/notifications/make_all_read',[NotificationController::class,"make_all_read"]);
});
