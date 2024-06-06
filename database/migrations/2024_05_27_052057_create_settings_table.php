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
        Schema::create('teacher_settings', function (Blueprint $table) {
            $table->id();
            $table->string("phonenumber")->nullable();
            $table->string("whatsapp")->nullable();
            $table->longText("bio")->nullable();
            $table->string("avater");
            $table->string("facebook")->nullable();
            $table->string("youtube")->nullable();
            $table->string("instagram")->nullable();
            $table->string("tiktok")->nullable();
            $table->string("linkedin")->nullable();
            $table->string("telegram")->nullable();
            $table->string("subject")->nullable();
            $table->string("address")->nullable();
            $table->string("city")->nullable();
            $table->string("state")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('settings');
    }
};
