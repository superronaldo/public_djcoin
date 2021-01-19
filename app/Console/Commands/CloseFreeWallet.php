<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use IEXBase\TronAPI\Tron;
use DB;
use Carbon\Carbon;

class CloseFreeWallet extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'close:free';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Close some amount of free wallets.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * declare the tron object to call tron functions.
     **/
    public function tron_object_create()
    {
        $fullNode = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');
        $solidityNode = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');
        $eventServer = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');

        try {
            $tron = new \IEXBase\TronAPI\Tron($fullNode, $solidityNode, $eventServer);
        } catch (\IEXBase\TronAPI\Exception\TronException $e) {
            exit($e->getMessage());
        }

        return $tron;
    }

    /**
     * send DJC token to the specific address.
     **/
    public function send_token($from, $to, $priv, $amount)
    {
        // $token_id = "1003515";
        $token_id = "1003656";
        
        $tron = $this->tron_object_create();

        $tron->setAddress($from);
        $tron->setPrivateKey($priv);

        $transfer = $tron->sendToken($to, $amount * 10000, $token_id, $from);

        return $transfer;
    }

    /**
     * return tokens to the master wallet.
     **/
    public function close_free_Wallet($close_num)
    {
        $master_address = "TRtiiRxBVbA9vpajaSTDZdU1yq38ffjcwk";

        $free_wallet_list = DB::table('free_wallets')->get();
        $num = count($free_wallet_list);

        while($close_num > 0)
        {
            $free_wallet_list = DB::table('free_wallets')->get();

            $i = mt_rand(0, $num - 1);

            $close_flag = $free_wallet_list[$i]->close;
            $wallet_address = $free_wallet_list[$i]->wallet_address;
            $private_key = $free_wallet_list[$i]->privatekey;
            $amount = $free_wallet_list[$i]->amount;

            if($close_flag || $amount == 0)
                continue;

            $transfer = $this->send_token($wallet_address, $master_address, $private_key, $amount);
            $date = Carbon::now();
            $deleted_at = $date->toDateTimeString();

            DB::table('free_wallets')
                ->where('wallet_address', $wallet_address)
                ->update([
                    'amount'      => 0,
                    'close'       => 1,
                    'deleted_at'  => $deleted_at
                ]);

            $close_num--;
        }
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $data = DB::table("free_wallets")->get();
        $close_num = DB::table("cron_schedule")->get()->last()->wallet_close;
        $count = 0;

        for($i = 0; $i < count($data); $i++)
        {
            $amount = $data[$i]->amount;
            $wallet_address = $data[$i]->wallet_address;
            
            if($amount == 0)
            {
                DB::table("free_wallets")
                    ->where('wallet_address', $wallet_address)
                    ->update(['close' => 1]);

                $count++;

                if($count == $close_num)
                    break;
            }
        }

        if($count < $close_num)
            $this->close_free_Wallet($close_num - $count);
    }
}
