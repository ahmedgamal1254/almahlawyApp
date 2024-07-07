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
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email');
            $table->integer('gender')->nullable()->comment('1:male,0:femal');
            $table->string('phonenumber')->nullable();
            $table->string('phone_parent')->nullable();
            $table->string('government')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->integer('all_points')->default(0);
            $table->integer('active_points')->default(0);
            $table->string('profile')->nullable()->comment('profile image');
            $table->unsignedBigInteger('subject_id')->nullable();
            $table->unsignedBigInteger('school_grade_id')->nullable()->default(0);
            $table->bigInteger('group_id')->nullable();
            $table->unsignedBigInteger('teacher_id')->nullable();
            $table->rememberToken();
            $table->smallInteger('status_exam')->default(0);
            $table->string('provider_id')->nullable();
            $table->string('provider')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->index(['email', 'password']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
