<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCronScheduleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cron_schedule', function (Blueprint $table) {
            $table->id();
            $table->integer('wallet_create')->default(0);
            $table->integer('djc_bought')->default(0);
            $table->integer('djc_transfer')->default(0);
            $table->integer('djc_return')->default(0);
            $table->integer('wallet_close')->default(0);
            $table->timestamp('created_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cron_schedule');
    }
}
