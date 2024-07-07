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
        Schema::table('media', function (Blueprint $table) {
            $table->foreign(['school_grade_id'])->references(['id'])->on('school_grades')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['unit_id'], 'media_subject_id_foreign')->references(['id'])->on('units')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['teacher_id'])->references(['id'])->on('teachers')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('media', function (Blueprint $table) {
            $table->dropForeign('media_school_grade_id_foreign');
            $table->dropForeign('media_subject_id_foreign');
            $table->dropForeign('media_teacher_id_foreign');
        });
    }
};
