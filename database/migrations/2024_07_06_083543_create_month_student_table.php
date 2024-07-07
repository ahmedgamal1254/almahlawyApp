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
        Schema::create('month_student', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id')->index('month_student_user_id_foreign');
            $table->unsignedBigInteger('month_id')->index('month_student_month_id_foreign');
            $table->bigInteger('teacher_id');
            $table->tinyInteger('lock')->comment('0==> locked,1 ==> unlocked');
            $table->smallInteger('points_paid')->default(100)->comment('100 point paid for lock month');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('month_student');
    }
};
