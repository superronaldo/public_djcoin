<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use IEXBase\TronAPI\Tron;
use DB;
use Carbon\Carbon;

class CreateFreeWallet extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'create:free';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create some amount of free wallets per day.';

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
     * create random free wallet and send DJC token to them.
     **/
    public function create_free_wallet($amount)
    {
        $master_address = "TRtiiRxBVbA9vpajaSTDZdU1yq38ffjcwk";
        $master_privatekey = "867759ca82ac7dbadaeb887afd31786e978a0b1a13a2af062942143bbdbe2f6f";
        $tron = $this->tron_object_create();

        $generateAddress = $tron->generateAddress(); // or createAddress()
        $isValid = $tron->isAddress($generateAddress->getAddress());

        $to_address = $generateAddress->getAddress(true);
        $to_privatekey = $generateAddress->getPrivateKey();
        $to_publickey = $generateAddress->getPublicKey();

        try {
            $transfer = $this->send_token($master_address, $to_address, $master_privatekey, $amount);

            $transaction = $transfer["txid"];
            $status = 0;
            $date = Carbon::now();
            $created_at = $date->toDateTimeString();

            DB::table('free_wallets')->insert([
                'from_address'     => $master_address,
                'wallet_address'   => $to_address,
                'privatekey'       => $to_privatekey,
                'txid'             => $transaction,
                'amount'           => $amount,
                'status'           => $status,
                'created_at'       => $created_at
            ]);

        } catch (\IEXBase\TronAPI\Exception\TronException $e) {
            die($e->getMessage());
        }
    }

    /**
     * get random djc transfer amount has sum as $DJCAmount.
     **/
    private function get_random_djc_transfer_amount($walletNum, $DJCAmount)
    {
        $numbers = [];

        $loose_pcc = $DJCAmount / $walletNum;

        for($i = 1; $i < $walletNum; $i++) {
            // Random number +/- 10%
            $ten_pcc = $loose_pcc * 0.5;
            $rand_num = mt_rand( ($loose_pcc - $ten_pcc) * 100, ($loose_pcc + $ten_pcc) * 100) / 100;

            $numbers[] = $rand_num;
        }

        // $numbers now contains 1 less number than it should do, sum 
        // all the numbers and use the difference as final number.
        $numbers_total = array_sum($numbers);

        $numbers[] = $DJCAmount - $numbers_total;

        return $numbers;
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $cron_data = DB::table('cron_schedule')->get()->last();
        
        $wallet_create = $cron_data->wallet_create;
        $djc_bought = $cron_data->djc_bought;
        $djc_transfer = $cron_data->djc_transfer;
        $djc_return = $cron_data->djc_return;
        $wallet_close = $cron_data->wallet_close;

        $array = $this->get_random_djc_transfer_amount($wallet_create, $djc_bought);

        $num = count($array);

        /**
         * create free wallets and send random amount of tokens to them.
         **/
        for($i = 1; $i <= $num; $i++)
        {
            $djcAmount = $array[$i-1];

            if($djcAmount < 0)
                continue;

            $this->create_free_wallet($djcAmount);
        }
    }
}
