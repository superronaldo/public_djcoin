<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use IEXBase\TronAPI\Tron;
use DB;
use Auth;

class PayTransactionController extends Controller
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

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function pay_transaction(Request $request)
    {
        $fullNode = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');
        $solidityNode = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');
        $eventServer = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');

        try {
            $tron = new \IEXBase\TronAPI\Tron($fullNode, $solidityNode, $eventServer);
        } catch (\IEXBase\TronAPI\Exception\TronException $e) {
            exit($e->getMessage());
        }

        $form_data = $request->input();
        $payAmount = $form_data['DjcPayAmount'];

        $user = Auth::user();
        $data = User::find($user->id);
        $amount = $data->amount;

        if($payAmount > $amount)
        {
            echo "
                <script>
                    alert('Please buy DJC more');
                </script>
            ";
            return view('pages.user.buy');
        }
        else
        {
            $from_address = $data->wallet_address;
            // $from_privatekey = base64_decode($data->privatekey);
            $from_privatekey = $data->privatekey;
            $tokenId = "1003515";
            $to_address = "TRtiiRxBVbA9vpajaSTDZdU1yq38ffjcwk";

            $tron->setAddress($from_address);
            $tron->setPrivateKey($from_privatekey);

            try 
            {
                $transfer = $tron->sendToken($to_address, $payAmount * 10000, $tokenId, $from_address); // transfer DJC
                return view('pages.user.pay-transaction-result');

            } catch (\IEXBase\TronAPI\Exception\TronException $e) {
                die($e->getMessage());
            }  
        }
    }
}