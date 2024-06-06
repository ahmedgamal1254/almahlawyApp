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
        Schema::create('static_exams', function (Blueprint $table) {
            $table->id();
            $table->string("title");
            $table->longText("description");
            $table->float("student_degree");
            $table->float("total_degree");
            $table->string("exam")->comment("file ==> pdf");
            $table->bigInteger("user_id")->unsigned();
            $table->bigInteger("teacher_id")->unsigned();
            $table->bigInteger("unit_id")->unsigned();
            $table->bigInteger("school_grade_id")->unsigned();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('static_exams');
    }
};
