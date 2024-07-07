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
        Schema::create('exam_student', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id')->index('exam_student_user_id_foreign');
            $table->unsignedBigInteger('exam_id')->index('exam_student_exam_id_foreign');
            $table->tinyInteger('status')->nullable()->comment('0:end,1:opened');
            $table->float('degree', null, 0)->nullable()->comment('student degree in exam');
            $table->float('total', null, 0)->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam_student');
    }
};
