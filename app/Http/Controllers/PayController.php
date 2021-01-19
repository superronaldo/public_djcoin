<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use IEXBase\TronAPI\Tron;
use DB;
use Auth;

class PayController extends Controller
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

    public function get_balance($wallet_address, $tokenID)
    {
        $fullNode = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');
        $solidityNode = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');
        $eventServer = new \IEXBase\TronAPI\Provider\HttpProvider('https://api.trongrid.io');

        try {
            $tron = new \IEXBase\TronAPI\Tron($fullNode, $solidityNode, $eventServer);
        } catch (\IEXBase\TronAPI\Exception\TronException $e) {
            exit($e->getMessage());
        }

        $TRX_Balance = $tron->getBalance($wallet_address, true);
        $DJC_Balance = $tron->getTokenBalance($tokenID, $wallet_address, true) * 100;

        $result = [
            "wallet_address" => $wallet_address,
            "Trx" => $TRX_Balance,
            "Djc" => $DJC_Balance
        ];

        return $result;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function pay()
    {
        $user = Auth::user();
        $data = User::find($user->id);
        $walletAddress = $data->wallet_address;
        $DJC_token = "1003515";

        if(!isset($walletAddress))
        {
            echo "
                <script>
                    alert('Please buy DJC first');
                </script>
            ";
            return view('pages.user.buy');
        }
        else
        {
            $balance = $this->get_balance($walletAddress, $DJC_token);    
            return view('pages.user.pay', compact('balance'));
        }
    }
}