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
        Schema::create('free_exams', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('code');
            $table->string('duration');
            $table->unsignedBigInteger('unit_id')->index('free_exams_unit_id_foreign');
            $table->unsignedBigInteger('subject_id')->index('free_exams_subject_id_foreign');
            $table->unsignedBigInteger('school_grade_id')->index('free_exams_school_grade_id_foreign');
            $table->unsignedBigInteger('teacher_id')->index('free_exams_teacher_id_foreign');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('free_exams');
    }
};
