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
        Schema::create('lessons', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title')->unique('title');
            $table->longText('description');
            $table->string('source', 150)->default('main_server');
            $table->text('video_url')->nullable();
            $table->string('img_caption')->nullable();
            $table->unsignedBigInteger('subject_id')->index('lessons_subject_id_foreign');
            $table->unsignedBigInteger('school_grade_id')->index('lessons_school_grade_id_foreign');
            $table->unsignedBigInteger('teacher_id')->index('lessons_teacher_id_foreign');
            $table->date('date_show')->nullable();
            $table->softDeletes();
            $table->timestamps();
            $table->unsignedBigInteger('unit_id');
            $table->integer('duration')->nullable()->default(0);
            $table->tinyInteger('free')->default(0)->comment('0==> not free,1==> free');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lessons');
    }
};
