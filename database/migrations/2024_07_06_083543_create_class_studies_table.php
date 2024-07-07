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
        Schema::create('class_studies', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('group_name');
            $table->time('group_time')->nullable();
            $table->text('description')->nullable();
            $table->unsignedBigInteger('subject_id')->index('class_studies_subject_id_foreign');
            $table->unsignedBigInteger('teacher_id')->index('class_studies_teacher_id_foreign');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('class_studies');
    }
};
