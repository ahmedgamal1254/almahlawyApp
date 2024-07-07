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
        Schema::create('sessionslive', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->unique('name');
            $table->string('photo')->nullable();
            $table->string('link');
            $table->longText('description')->nullable();
            $table->string('serviceName')->nullable()->comment('zoom,google meet');
            $table->json('creds')->nullable()->comment('public key,secret key');
            $table->unsignedBigInteger('teacher_id');
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->unsignedBigInteger('school_grade_id');
            $table->enum('active', ['0', '1'])->default('1')->comment('0 ==> in active  , 1 ==> active');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sessionslive');
    }
};
