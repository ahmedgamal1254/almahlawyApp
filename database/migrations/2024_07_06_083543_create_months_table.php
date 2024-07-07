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
        Schema::create('months', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('month_date')->unique('month_date')->comment('09-2023');
            $table->mediumInteger('year')->nullable();
            $table->tinyInteger('month')->nullable();
            $table->string('month_name', 25)->nullable();
            $table->tinyInteger('status')->nullable()->comment('status:(0 ==> show,1 ==> hide)');
            $table->timestamps();
            $table->unsignedBigInteger('teacher_id')->nullable();
            $table->string('month_name_ar')->nullable();
            $table->text('month_description')->nullable();
            $table->double('cost', 8, 2)->nullable();
            $table->tinyInteger('orderValue')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('months');
    }
};
