<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use IEXBase\TronAPI\Tron;
use DB;
use Carbon\Carbon;

class SendToFree extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'send:free';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send some amount of DJC tokens between free wallets per day';

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
     * send tokens between free wallets.
     **/
    public function send_token_between_free_Wallet($transfer_amount)
    {
        $free_wallet_list = DB::table('free_wallets')->get();
        $num = count($free_wallet_list);

        while($transfer_amount > 0)
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

            $random = mt_rand(0, $num - 1);
            $to_address = $free_wallet_list[$random]->wallet_address;
            $to_amount = $free_wallet_list[$random]->amount;

            echo "from = ".$i."\n";
            echo "to = ".$random."\n";
            echo "send_amount ".$send_amount."\n";
            echo "before calc transfer_amount ".$transfer_amount."\n";

            if($send_amount <= $transfer_amount && $to_address != $wallet_address)
            {
                $transfer = $this->send_token($wallet_address, $to_address, $private_key, $send_amount);

                $transfer_amount -= $send_amount;
                $date = Carbon::now();
                $updated_at = $date->toDateTimeString();

                DB::table('free_wallets')
                    ->where('wallet_address', $wallet_address)
                    ->update([
                        'amount' => ($amount - $send_amount),
                        'updated_at' => $updated_at
                    ]);

                DB::table('free_wallets')
                    ->where('wallet_address', $to_address)
                    ->update([
                        'amount'     => ($to_amount + $send_amount),
                        'updated_at' => $updated_at 
                    ]);
            }
            else if($send_amount >= $transfer_amount && $to_address != $wallet_address)
            {
                $transfer = $this->send_token($wallet_address, $to_address, $private_key, $transfer_amount);

                $date = Carbon::now();
                $updated_at = $date->toDateTimeString();

                DB::table('free_wallets')
                    ->where('wallet_address', $wallet_address)
                    ->update([
                        'amount'     => ($amount - $transfer_amount),
                        'updated_at' => $updated_at
                    ]);

                DB::table('free_wallets')
                    ->where('wallet_address', $to_address)
                    ->update([
                        'amount'     => ($to_amount + $transfer_amount),
                        'updated_at' => $updated_at
                    ]);

                $transfer_amount = 0;
            }

            echo "after calc transfer_amount ".$transfer_amount."\n\n";
        }
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $cron_data = DB::table('cron_schedule')->get()->last();
        $djc_transfer = $cron_data->djc_transfer;

        $this->send_token_between_free_wallet($djc_transfer);
    }
}
