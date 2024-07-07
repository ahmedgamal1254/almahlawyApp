<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('question_exam_students', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('student_answer');
            $table->unsignedBigInteger('exam_id')->index('question_exam_students_exam_id_foreign');
            $table->unsignedBigInteger('user_id')->index('question_exam_students_user_id_foreign');
            $table->unsignedBigInteger('question_id')->index('question_exam_students_question_id_foreign');
            $table->boolean('correct')->default(false)->comment('0 ==> wrong
1 ==> correct');
            $table->unsignedBigInteger('subject_id')->nullable()->index('question_exam_students_subject_id_foreign');
            $table->unsignedBigInteger('school_grade_id')->index('question_exam_students_school_grade_id_foreign');
            $table->unsignedBigInteger('teacher_id')->nullable()->index('question_exam_students_teacher_id_foreign');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('question_exam_students');
    }
};
