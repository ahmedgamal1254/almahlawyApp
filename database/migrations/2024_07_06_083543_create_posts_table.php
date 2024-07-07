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
        Schema::create('posts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title')->unique('title');
            $table->longText('description');
            $table->string('image_url')->nullable();
            $table->unsignedBigInteger('unit_id')->nullable()->index('posts_subject_id_foreign');
            $table->unsignedBigInteger('school_grade_id')->index('posts_school_grade_id_foreign');
            $table->unsignedBigInteger('teacher_id')->index('posts_teacher_id_foreign');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
