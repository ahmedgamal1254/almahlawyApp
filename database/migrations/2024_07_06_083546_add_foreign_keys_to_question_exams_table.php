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
        Schema::table('question_exams', function (Blueprint $table) {
            $table->foreign(['exam_id'])->references(['id'])->on('exams')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['school_grade_id'])->references(['id'])->on('school_grades')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['subject_id'])->references(['id'])->on('subjects')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['teacher_id'])->references(['id'])->on('teachers')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('question_exams', function (Blueprint $table) {
            $table->dropForeign('question_exams_exam_id_foreign');
            $table->dropForeign('question_exams_school_grade_id_foreign');
            $table->dropForeign('question_exams_subject_id_foreign');
            $table->dropForeign('question_exams_teacher_id_foreign');
        });
    }
};
