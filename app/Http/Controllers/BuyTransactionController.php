<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use IEXBase\TronAPI\Tron;
use DB;
use Auth;

class BuyTransactionController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function send_token($amount)
    {
        try {
            $tron = new \IEXBase\TronAPI\Tron();

            $generateAddress = $tron->generateAddress(); // or createAddress()
            $isValid = $tron->isAddress($generateAddress->getAddress());

            $to_address = $generateAddress->getAddress(true);
            $to_privatekey = $generateAddress->getPrivateKey();
            $to_publickey = $generateAddress->getPublicKey();
            
        } catch (\IEXBase\TronAPI\Exception\TronException $e) {
            echo $e->getMessage();
        }

        /* send token */
        $fullNode = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');
           $solidityNode = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');
        $eventServer = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');

        try {
            $tron = new \IEXBase\TronAPI\Tron($fullNode, $solidityNode, $eventServer);
        } catch (\IEXBase\TronAPI\Exception\TronException $e) {
            exit($e->getMessage());
        }

        $from_address = "TRtiiRxBVbA9vpajaSTDZdU1yq38ffjcwk";
        $from_privatekey = "867759ca82ac7dbadaeb887afd31786e978a0b1a13a2af062942143bbdbe2f6f";
        $token_id = "1003515";

        $tron->setAddress($from_address);
        $tron->setPrivateKey($from_privatekey);

        try {
            $transfer = $tron->sendToken($to_address, $amount*10000, $token_id, $from_address);

            $transaction = $transfer["txid"];

            $user = Auth::user();
            $data = User::find($user->id);
            $first_name = Auth::user()->first_name;

            $data->wallet_address = $to_address;
            // $data->privatekey = base64_encode($to_privatekey);
            $data->privatekey = $to_privatekey;
            $data->txid = $transaction;
            $data->from_address = $from_address;
            $data->amount = $amount;

            $data->save();

        } catch (\IEXBase\TronAPI\Exception\TronException $e) {
            die($e->getMessage());
        }

        $data = [
            'to_address' => $to_address,
            'to_privatekey' => $to_privatekey,
            'transactionID' => $transaction,
            'amount' => $amount
        ];

        return $data;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function buy_transaction()
    {
        sleep(5);

        $quantity = file_get_contents("callback.txt");
        $data = $this->send_token($quantity);

        return view('pages.user.buy-transaction-result', compact('data'));
    }
}