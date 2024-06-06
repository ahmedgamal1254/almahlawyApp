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
            $table->id();
            $table->string("name");
            $table->string("photo")->nullable();
            $table->string("link");
            $table->longText("description")->nullable();
            $table->string("serviceName")->comment("zoom,google meet")->nullable();
            $table->json("creds")->nullable()->comment("public key,secret key");
            $table->bigInteger("teacher_id")->unsigned();
            $table->bigInteger("unit_id")->unsigned();
            $table->bigInteger("school_grade_id")->unsigned();
            $table->enum("active",[0,1])->comment("0 ==> in active  , 1 ==> active")->default(1);
            $table->timestamps();
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
