<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Auth;
use DB;
use reportDatabase;

class WebHookController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
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

            $data = [
                'wallet_address' => $to_address,
                'privatekey' => $to_privatekey,
                'txid' => $transaction,
                'amount' => $amount
            ];

            file_put_contents("callback.txt", serialize($data));
            $array = unserialize(file_get_contents("callback.txt"));

            var_dump("aaaaaaaa");

            // $user = Auth::user();
            // var_dump("bbbbbbb", $user->id);
            // $data = User::find($user->id);
            // var_dump("ccccccc");
            // $first_name = Auth::user()->first_name;
            // var_dump("ddddddd");

            // $data->wallet_address = $to_address;
            // // $data->privatekey = base64_encode($to_privatekey);
            // $data->privatekey = $to_privatekey;
            // $data->txid = $transaction;
            // $data->from_address = $from_address;
            // $data->amount = $amount;

            // var_dump($to_address);
            // var_dump($to_privatekey);
            // var_dump($amount);

            // $data->save();

        } catch (\IEXBase\TronAPI\Exception\TronException $e) {
            die($e->getMessage());
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function webhook()
    {
        var_dump("1111");
        $data = file_get_contents('php://input');
        $object = json_decode($data);
        $quantity = $object->line_items[0]->quantity;

        // expecting valid json
        if (json_last_error() !== JSON_ERROR_NONE) {
            die(header('HTTP/1.0 415 Unsupported Media Type'));
        }

        file_put_contents("callback.txt", print_r($object, true));
        //$this->send_token($quantity);
        // $this->send_token(0.001);

        // app('App\Http\Controllers\BuyController')->saveDatabase(); // send data from one controller to another controller
    }
}