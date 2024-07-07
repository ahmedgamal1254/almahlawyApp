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
        Schema::table('class_studies', function (Blueprint $table) {
            $table->foreign(['subject_id'])->references(['id'])->on('subjects')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['teacher_id'])->references(['id'])->on('teachers')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('class_studies', function (Blueprint $table) {
            $table->dropForeign('class_studies_subject_id_foreign');
            $table->dropForeign('class_studies_teacher_id_foreign');
        });
    }
};
