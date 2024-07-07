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
        Schema::table('book_view', function (Blueprint $table) {
            $table->foreign(['book_id'])->references(['id'])->on('media')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('book_view', function (Blueprint $table) {
            $table->dropForeign('book_view_book_id_foreign');
        });
    }
};
