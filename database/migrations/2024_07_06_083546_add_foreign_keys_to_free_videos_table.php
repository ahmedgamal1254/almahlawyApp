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
        Schema::table('free_videos', function (Blueprint $table) {
            $table->foreign(['school_grade_id'])->references(['id'])->on('school_grades')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['subject_id'])->references(['id'])->on('subjects')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['teacher_id'])->references(['id'])->on('teachers')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['unit_id'])->references(['id'])->on('units')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('free_videos', function (Blueprint $table) {
            $table->dropForeign('free_videos_school_grade_id_foreign');
            $table->dropForeign('free_videos_subject_id_foreign');
            $table->dropForeign('free_videos_teacher_id_foreign');
            $table->dropForeign('free_videos_unit_id_foreign');
        });
    }
};
