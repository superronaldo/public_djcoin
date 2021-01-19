<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFreeWalletsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('free_wallets', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('from_address')->nullable();
            $table->string('wallet_address')->nullable();
            $table->string('privatekey')->nullable();
            $table->string('txid')->nullable();
            $table->float('amount');
            $table->boolean('status')->default(false);
            $table->boolean('close')->default(false);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('free_wallets');
    }
}
