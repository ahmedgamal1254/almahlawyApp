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
        Schema::table('month_student', function (Blueprint $table) {
            $table->foreign(['month_id'])->references(['id'])->on('months')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('month_student', function (Blueprint $table) {
            $table->dropForeign('month_student_month_id_foreign');
        });
    }
};
