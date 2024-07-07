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
        Schema::create('question_exams', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('exam_id')->index('question_exams_exam_id_foreign');
            $table->unsignedBigInteger('question_id')->index('question_exams_question_id_foreign');
            $table->unsignedBigInteger('subject_id')->nullable()->index('question_exams_subject_id_foreign');
            $table->unsignedBigInteger('school_grade_id')->nullable()->index('question_exams_school_grade_id_foreign');
            $table->unsignedBigInteger('teacher_id')->nullable()->index('question_exams_teacher_id_foreign');
            $table->softDeletes();
            $table->timestamps();

            $table->unique(['question_id', 'exam_id'], 'unique_question_exam');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('question_exams');
    }
};
