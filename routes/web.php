<?php

use App\Http\Controllers\{
    SchoolGradeController,
    SubjectController,
    GroupController,
    ExamController,
    FreeBooksController,
    FreeVideosController,
    LessonController,
    PostController,
    TeacherController,
    MediaController,
    MonthController,
    QuestionController,
    QuestionExamController,
    ProfileTeacherController,
    QuestionFilterController,
    QuestionSearchController,
    RegisterFilterController,
    StaticExamController,
    StudentExamsController,
    UnitController,
    VrSessionController,
    ContactUsController
};

use App\Http\Controllers\PaperExamController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\Teacher\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Teacher\StudentTeacherController;
use App\Http\Controllers\Student\StudentController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Video\UploadController;
use App\Models\Group;
use App\Models\Post;
use App\Models\SchoolGrade;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get("/",function (){
    return view("welcome");
})->name("home");

Route::middleware(['guest:teacher','guest','throttle:40,2'])->group(function () {
    Route::get("teacher/login",[AuthenticatedSessionController::class,'create'])->name("teacher.login");
    Route::post("teacher/store",[AuthenticatedSessionController::class,'store'])->name("teacher.store");
});

// teacher dashboard
Route::middleware(['teacher'])->group(function () {
    Route::get('/teacher',[TeacherController::class,'index'])->name("teacher");
    Route::get('/teacher/statics',[TeacherController::class,'stat'])->name("teacher.stat");
    Route::get('/teacher/profile/',[TeacherController::class,'profile'])->name("teacher.profile");
    Route::post('/teacher/update/profile',[TeacherController::class,'update'])->name("teacher.update.profile");

    Route::post("teacher/destroy",[AuthenticatedSessionController::class,'destroy'])->name("teacher.destroy");
    Route::get("teacher/posts/show/{id}",[AuthenticatedSessionController::class,'show'])->name("posts.show");
    Route::get("teacher/posts/edit/{id}",[AuthenticatedSessionController::class,'show'])->name("posts.edit");
    Route::post("teacher/posts/post",[AuthenticatedSessionController::class,'show'])->name("posts.destroy");

    Route::get("teacher/profile/edit",[ProfileTeacherController::class,'edit'])->name("teacher.edit");
    Route::post("teacher/profile/update",[ProfileTeacherController::class,'update'])->name("teacher.update");
});

// school grade
Route::middleware(['teacher'])->group(function () {
    Route::get("teachers/school_grade",[SchoolGradeController::class,'index'])->name("school_grade");
    Route::get("teachers/school_grade/{school_grade_id}/users",[SchoolGradeController::class,'students'])->name("school_grade.students");
    Route::get("teachers/school_grade/{school_grade_id}/groups",[SchoolGradeController::class,'groups'])->name("school_grade.groups");
    Route::get("teachers/school_grade/{school_grade_id}/units",[SchoolGradeController::class,'units'])->name("school_grade.units");
    Route::get("teachers/school_grade/edit/{id}",[SchoolGradeController::class,'edit'])->name("school_grade.edit");
    Route::post("teachers/school_grade/update",[SchoolGradeController::class,'update'])->name("school_grade.update");
    Route::get("teachers/school_grade/show/{id}",[SchoolGradeController::class,'show'])->name("school_grade.show");
    Route::get("teachers/school_grade/add",[SchoolGradeController::class,'create'])->name("school_grade.add");
    Route::post("teachers/school_grade/store",[SchoolGradeController::class,'store'])->name("school_grade.store");
    Route::get("teachers/school_grade/delete/{id}",[SchoolGradeController::class,'destroy'])->name("school_grade.destroy");
});

// Route::get('/drop', function () {
//     DB::statement('DROP DATABASE `t`');
// });

// Subject
Route::middleware(['teacher'])->group(function () {
    Route::get("teachers/subject",[SubjectController::class,'index'])->name("subject");
    Route::get("teachers/subject/edit/{id}",[SubjectController::class,'edit'])->name("subject.edit");
    Route::post("teachers/subject/update",[SubjectController::class,'update'])->name("subject.update");
    Route::get("teachers/subject/show/{id}",[SubjectController::class,'show'])->name("subject.show");
    Route::get("teachers/subject/add",[SubjectController::class,'create'])->name("subject.add");
    Route::post("teachers/subject/store",[SubjectController::class,'store'])->name("subject.store");
    Route::get("teachers/subject/delete/{id}",[SubjectController::class,'destroy'])->name("subject.destroy");
});

// classes
Route::middleware(['teacher'])->group(function () {
    Route::get("teachers/class",[GroupController::class,'index'])->name("class");
    Route::get("teachers/groups/{group_id}/users",[GroupController::class,'students'])->name("group.students");
    Route::get("teachers/class/edit/{id}",[GroupController::class,'edit'])->name("class.edit");
    Route::post("teachers/class/update",[GroupController::class,'update'])->name("class.update");
    Route::get("teachers/class/show/{id}",[GroupController::class,'show'])->name("class.show");
    Route::get("teachers/class/add",[GroupController::class,'create'])->name("class.add");
    Route::post("teachers/class/store",[GroupController::class,'store'])->name("class.store");
    Route::get("teachers/class/delete/{id}",[GroupController::class,'destroy'])->name("class.destroy");
});

// vr sessions
Route::middleware(["teacher"])->group(function (){
    Route::get("teacher/vr-sessions",[VrSessionController::class,'index'])->name("teacher.sessions");
    Route::get("teacher/vr-sessions/edit/{id}",[VrSessionController::class,'edit'])->name("teacher.sessions.edit");
    Route::post("teacher/vr-sessions/update",[VrSessionController::class,'update'])->name("teacher.sessions.update");
    Route::get("teacher/vr-sessions/show/{id}",[VrSessionController::class,'show'])->name("teacher.sessions.show");
    Route::get("teacher/vr-sessions/add",[VrSessionController::class,'create'])->name("teacher.sessions.create");
    Route::post("teacher/vr-sessions/store",[VrSessionController::class,'store'])->name("teacher.sessions.store");
    Route::get("teacher/vr-sessions/delete/{id}",[VrSessionController::class,'destroy'])->name("teacher.sessions.destroy");
});

// paper exams
Route::middleware(["teacher"])->group(function (){
    Route::get("teacher/paper-exams",[PaperExamController::class,'index'])->name("teacher.paper-exams");
    Route::get("teacher/paper-exams/edit/{id}",[PaperExamController::class,'edit'])->name("teacher.paper-exams.edit");
    Route::post("teacher/paper-exams/update",[PaperExamController::class,'update'])->name("teacher.paper-exams.update");
    Route::get("teacher/paper-exams/show/{id}",[PaperExamController::class,'show'])->name("teacher.paper-exams.show");
    Route::get("teacher/paper-exams/add",[PaperExamController::class,'create'])->name("teacher.paper-exams.create");
    Route::post("teacher/paper-exams/store",[PaperExamController::class,'store'])->name("teacher.paper-exams.store");
    Route::get("teacher/paper-exams/delete/{id}",[PaperExamController::class,'destroy'])->name("teacher.paper-exams.destroy");
});

Route::get("/teacher/users/search",[PaperExamController::class,'students']);

// static exams ==> الامتحانات الورقية
Route::resource("teacher/papers-exams",StaticExamController::class)->names("teacher.paper_exam");

// posts
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/posts",[PostController::class,'index'])->name("posts");
    Route::get("teacher/post/edit/{id}",[PostController::class,'edit'])->name("post.edit");
    Route::post("teacher/post/update",[PostController::class,'update'])->name("post.update");
    Route::get("teacher/post/show/{id}",[PostController::class,'show'])->name("post.show");
    Route::get("teacher/post/add",[PostController::class,'create'])->name("post.add");
    Route::post("teacher/post/store",[PostController::class,'store'])->name("post.store");
    Route::get("teacher/post/delete/{id}",[PostController::class,'destroy'])->name("post.destroy");
});

// lessons
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/lessons",[LessonController::class,'index'])->name("lessons");
    Route::get("teacher/lesson/edit/{id}",[LessonController::class,'edit'])->name("lesson.edit");
    Route::post("teacher/lesson/update",[LessonController::class,'update'])->name("lesson.update");
    Route::get("teacher/lesson/show/{id}",[LessonController::class,'show'])->name("lesson.show");
    Route::get("teacher/lesson/add",[LessonController::class,'create'])->name("lesson.add");
    Route::post("teacher/lesson/store",[LessonController::class,'store'])->name("lesson.store");
    Route::get("teacher/lesson/delete/{id}",[LessonController::class,'destroy'])->name("lesson.destroy");
});

// upload progress bar Larage video
Route::middleware(['teacher'])->group(function (){
    Route::get('/teacher/video/{id}/file-upload', [UploadController::class, 'index'])->name('files.index');
    Route::post('file-upload/upload-large-files', [UploadController::class, 'upload'])->name('chunk.store');
});

// free-lessons
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/free-lessons",[FreeVideosController::class,'index'])->name("free-lessons");
    Route::get("teacher/free-lesson/edit/{id}",[FreeVideosController::class,'edit'])->name("free-lesson.edit");
    Route::post("teacher/free-lesson/update",[FreeVideosController::class,'update'])->name("free-lesson.update");
    Route::get("teacher/free-lesson/show/{id}",[FreeVideosController::class,'show'])->name("free-lesson.show");
    Route::get("teacher/free-lesson/add",[FreeVideosController::class,'create'])->name("free-lesson.add");
    Route::post("teacher/free-lesson/store",[FreeVideosController::class,'store'])->name("free-lesson.store");
    Route::get("teacher/free-lesson/delete/{id}",[FreeVideosController::class,'destroy'])->name("free-lesson.destroy");
    Route::get('/teacher/free-lesson/{id}/file-upload', [FreeVideosController::class, 'upload_show'])->name('free-lesson.upload');
    Route::post('free-lesson/upload-large-video', [FreeVideosController::class, 'upload'])->name('video.upload');
});

// units
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/units",[UnitController::class,'index'])->name("units");
    Route::get("teacher/unit/edit/{id}",[UnitController::class,'edit'])->name("unit.edit");
    Route::get("teacher/units/search",[UnitController::class,'search'])->name("unit.search");
    Route::post("teacher/unit/update",[UnitController::class,'update'])->name("unit.update");
    Route::get("teacher/unit/show/{id}",[UnitController::class,'show'])->name("unit.show");
    Route::get("teacher/unit/add",[UnitController::class,'create'])->name("unit.add");
    Route::post("teacher/unit/store",[UnitController::class,'store'])->name("unit.store");
    Route::get("teacher/unit/delete/{id}",[UnitController::class,'destroy'])->name("unit.destroy");
});

// books and summaries
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/books",[MediaController::class,'index'])->name("books");
    Route::get("teacher/book/edit/{id}",[MediaController::class,'edit'])->name("book.edit");
    Route::post("teacher/book/update",[MediaController::class,'update'])->name("book.update");
    Route::get("teacher/book/show/{id}",[MediaController::class,'show'])->name("book.show");
    Route::get("teacher/book/add",[MediaController::class,'create'])->name("book.add");
    Route::post("teacher/book/store",[MediaController::class,'store'])->name("book.store");
    Route::get("teacher/book/delete/{id}",[MediaController::class,'destroy'])->name("book.destroy");
    Route::get('/teacher/book/{id}/file-upload', [MediaController::class, 'upload_show'])->name('book.index');
    Route::post('book/upload-large-book', [MediaController::class, 'upload'])->name('book.upload');
});

// free books and summaries
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/free-books",[FreeBooksController::class,'index'])->name("free-books");
    Route::get("teacher/free-book/edit/{id}",[FreeBooksController::class,'edit'])->name("free-book.edit");
    Route::post("teacher/free-book/update",[FreeBooksController::class,'update'])->name("free-book.update");
    Route::get("teacher/free-book/show/{id}",[FreeBooksController::class,'show'])->name("free-book.show");
    Route::get("teacher/free-book/add",[FreeBooksController::class,'create'])->name("free-book.add");
    Route::post("teacher/free-book/store",[FreeBooksController::class,'store'])->name("free-book.store");
    Route::get("teacher/free-book/delete/{id}",[FreeBooksController::class,'destroy'])->name("free-book.destroy");
    Route::get('/teacher/free-book/{id}/file-upload', [FreeBooksController::class, 'upload_show'])->name('free-book.index');
    Route::post('free-book/upload-large-book', [FreeBooksController::class, 'upload'])->name('free-book.upload');
});

// questions
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/questions",[QuestionController::class,'index'])->name("questions");
    Route::get("teacher/question/edit/{id}",[QuestionController::class,'edit'])->name("question.edit");
    Route::post("teacher/question/update",[QuestionController::class,'update'])->name("question.update");
    Route::get("teacher/question/show/{id}",[QuestionController::class,'show'])->name("question.show");
    Route::get("teacher/question/add",[QuestionController::class,'create'])->name("question.add");
    Route::post("teacher/question/store",[QuestionController::class,'store'])->name("question.store");
    Route::get("teacher/question/delete/{id}",[QuestionController::class,'destroy'])->name("question.destroy");
    Route::get("teacher/question/search",[QuestionFilterController::class,'filter']);
    Route::get("teacher/questions/search",[QuestionSearchController::class,'filter'])->name("search_questins");
    Route::get("teacher/question/search/name",[QuestionFilterController::class,'filter_name']);
});

// Exams
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/exams",[ExamController::class,'index'])->name("exams");
    Route::get("teacher/exam/edit/{id}",[ExamController::class,'edit'])->name("exam.edit");
    Route::post("teacher/exam/update",[ExamController::class,'update'])->name("exam.update");
    Route::get("teacher/exam/show/{id}",[ExamController::class,'show'])->name("exam.show");
    Route::get("teacher/exam/add",[ExamController::class,'create'])->name("exam.add");
    Route::post("teacher/exam/store",[ExamController::class,'store'])->name("exam.store");
    Route::get("teacher/exam/delete/{id}",[ExamController::class,'destroy'])->name("exam.destroy");
    Route::get("teacher/exam/print/{id}",[ExamController::class,'printExam'])->name("exam.print");
    Route::get("teacher/exam/{id}/studetns",[ExamController::class,'students'])->name("exam.students");
});



// Exam and Questions
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/exam/{id}/questions",[QuestionExamController::class,'create'])->name("add_questions");
    Route::post("teacher/exam/store/questions",[QuestionExamController::class,'store'])->name("store_questions");
    Route::post("teacher/exam/questions/store",[QuestionExamController::class,'store_ajax'])->name("store_ajax_student");
    Route::post("teacher/exam/question/store",[QuestionExamController::class,'store_ajax_question'])->name("store_ajax_question");
});

// months
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/show/months",[MonthController::class,'index'])->name("show_months");
    Route::get("teacher/edit/month/{id}",[MonthController::class,'edit'])->name("months.get");
    Route::post("teacher/month/update/",[MonthController::class,'update'])->name("months.update");
    Route::get("teacher/add/month/",[MonthController::class,'add'])->name("months.add");
    Route::post("teacher/month/store/",[MonthController::class,'store'])->name("months.store");
    Route::get("teacher/set_state/months/{id}",[MonthController::class,'set_state'])->name("state");
    Route::get("teacher/month/{id}",[MonthController::class,'show'])->name("show_month");
    Route::get("teacher/{id}/month/{school_grade_id}",[MonthController::class,'filter'])->name("filter_month");
});

// payments
Route::middleware(['auth'])->group(function (){
    Route::get("dashboar/student/teacher/{id}/profile/payments",[PaymentController::class,'index'])->name("payments");
    Route::get('dashboar/student/teacher/{id}',[PaymentController::class,'create'])->name("payment.add");
    Route::post('/student/payment/store',[PaymentController::class,'store'])->name("payments.store");
});

Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/payments/all",[PaymentController::class,'all_payments'])->name("all_payments");
    Route::get("teacher/payments/show/{id}",[PaymentController::class,'show'])->name("single_payment");
    Route::post("teacher/student/payment/store",[PaymentController::class,'points_update'])->name("points_update");
});


// students
Route::middleware(['teacher'])->group(function () {
    Route::get("teacher/student/add",[StudentTeacherController::class,'add_student'])->name("students.add");
    Route::post("teacher/student/store",[StudentTeacherController::class,'save_student'])->name("students.store");
    Route::get("teacher/student/edit/{id}",[StudentTeacherController::class,'edit_student'])->name("students.edit");
    Route::post("teacher/student/update",[StudentTeacherController::class,'update_student'])->name("students.update");
    Route::get("teachers/student/delete/{id}",[StudentTeacherController::class,'destroy'])->name("students.destroy");
    Route::get("teacher/students",[StudentTeacherController::class,'index'])->name("students");
    Route::get("teacher/students/search",[StudentTeacherController::class,'search'])->name("students.search");
    Route::get("teacher/students/filter",[StudentTeacherController::class,'filter'])->name("students.filter");
    Route::get("teacher/students/points",[StudentTeacherController::class,'students_points'])->name("students.points");
    Route::post("teacher/student/point",[StudentTeacherController::class,'update_points'])->name("update.points");

    Route::get("student/{id}/exams",[StudentExamsController::class,'index'])->name("students.show_exams");
    Route::get("student/{user_id}/exam/{exam_id}",[StudentExamsController::class,'show'])->name("students.show_exam");

});

// public profile
Route::get("student/{id}",[StudentTeacherController::class,'show'])->name("students.show");

// notifications
Route::middleware(['auth'])->group(function () {
    Route::get('/notifcations',function (){
        return view("student.notifications.index");
    })->name("notifcations");

    // show notification payment to make it read
    Route::get('/notifications/show/{id}',function ($id){
        DB::table("notifications")->where("id","=",$id)->update(["read_at"=>now()]);

        return redirect()->back();
    })->name("show_notification");

    // make all notifications read
    Route::get('/notifications/make_all_read',function (){
        $user=User::find(Auth::user()->id);

        foreach($user->unreadNotifications as $notification){
            $notification->markAsRead();
        }

        return redirect()->back();
    })->name("make_notifications_read");
});

Route::get("/filter_data",[RegisterFilterController::class,'index']);

// contact us
Route::post("/contact-us",[ContactUsController::class, "contact_us"])->name("contact_us");
