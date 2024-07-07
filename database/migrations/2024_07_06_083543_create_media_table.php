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
        Schema::create('media', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title')->unique('title');
            $table->longText('description');
            $table->string('media_url');
            $table->unsignedBigInteger('unit_id')->nullable()->index('media_subject_id_foreign');
            $table->unsignedBigInteger('school_grade_id')->index('media_school_grade_id_foreign');
            $table->unsignedBigInteger('teacher_id')->index('media_teacher_id_foreign');
            $table->softDeletes();
            $table->timestamps();
            $table->string('url')->nullable();
            $table->date('date_show');
            $table->string('caption')->nullable();
            $table->tinyInteger('free')->default(0)->comment('0==> not free,1==> free');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('media');
    }
};
