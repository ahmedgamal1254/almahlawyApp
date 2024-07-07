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
        Schema::create('payments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->double('value', 8, 2)->nullable();
            $table->string('image_url')->nullable();
            $table->unsignedBigInteger('user_id')->index('payments_user_id_foreign');
            $table->unsignedBigInteger('teacher_id')->nullable();
            $table->tinyInteger('status')->nullable()->comment('status:0 error,status:1 done');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
