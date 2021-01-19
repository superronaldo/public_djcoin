<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use IEXBase\TronAPI\Tron;
use DB;
use Carbon\Carbon;

class ReturnToMaster extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'return:master';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Return DJC to the master wallet!';

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
    public function return_token_to_master_Wallet($return_amount)
    {
        $master_address = "TRtiiRxBVbA9vpajaSTDZdU1yq38ffjcwk";

        $free_wallet_list = DB::table('free_wallets')->get();
        $num = count($free_wallet_list);

        while($return_amount > 0)
        {
            $free_wallet_list = DB::table('free_wallets')->get();

            $i = mt_rand(0, $num - 1);

            $close_flag = $free_wallet_list[$i]->close;
            $wallet_address = $free_wallet_list[$i]->wallet_address;
            $private_key = $free_wallet_list[$i]->privatekey;
            $amount = $free_wallet_list[$i]->amount;

            if($close_flag || $amount == 0)
                continue;

            $send_amount = mt_rand(0.01 * 100, $amount * 100) / 100;

            echo "from = ".$i."\n";
            echo "send_amount ".$send_amount."\n";
            echo "before calc return_amount ".$return_amount."\n";

            if($send_amount <= $return_amount)
            {
                $transfer = $this->send_token($wallet_address, $master_address, $private_key, $send_amount);

                $return_amount -= $send_amount;
                $date = Carbon::now();
                $updated_at = $date->toDateTimeString();

                DB::table('free_wallets')
                    ->where('wallet_address', $wallet_address)
                    ->update([
                        'amount'     => ($amount - $send_amount),
                        'updated_at' => $updated_at
                    ]);
            }
            else if($send_amount >= $return_amount)
            {
                $transfer = $this->send_token($wallet_address, $master_address, $private_key, $return_amount);

                $date = Carbon::now();
                $updated_at = $date->toDateTimeString();

                DB::table('free_wallets')
                    ->where('wallet_address', $wallet_address)
                    ->update([
                        'amount'     => ($amount - $return_amount),
                        'updated_at' => $updated_at
                    ]);

                $return_amount = 0;
            }

            echo "after calc return_amount ".$return_amount."\n\n";
        }
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $return_amount = DB::table("cron_schedule")->get()->last()->djc_return;

        $this->return_token_to_master_Wallet($return_amount);
    }
}
