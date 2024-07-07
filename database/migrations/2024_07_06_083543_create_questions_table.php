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
        Schema::create('questions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('type_question')->nullable();
            $table->string('img')->nullable();
            $table->string('name')->nullable();
            $table->string('type')->default('msg');
            $table->string('title')->nullable();
            $table->string('description')->nullable();
            $table->string('chooses')->nullable();
            $table->string('answer');
            $table->float('degree', 10)->default(1)->comment('degree of question	');
            $table->unsignedBigInteger('subject_id')->index('questions_subject_id_foreign');
            $table->unsignedBigInteger('school_grade_id')->index('questions_school_grade_id_foreign');
            $table->unsignedBigInteger('teacher_id')->index('questions_teacher_id_foreign');
            $table->softDeletes();
            $table->timestamps();
            $table->unsignedBigInteger('unit_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('questions');
    }
};
