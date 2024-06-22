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
        Schema::table('question_exam_students', function (Blueprint $table) {
            $table->boolean("correct")->after("question_id")->default(0)->comment("0 ==> wrong 1 ==> correct");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('question_exam_students', function (Blueprint $table) {
            //
        });
    }
};
