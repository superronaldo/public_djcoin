<?php

namespace App\Http\Controllers;

use App\Models\User;
use DB;

class TotalTransactionHistoryController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        // $tokenID = "1003515";
        $tokenID = "1003656";

        /* get list of transactions of specific token using token ID */
        $url = "https://apilist.tronscan.org/api/transfer?sort=-timestamp&count=true&limit=10000&start=0&token=".$tokenID;
            
        $session = curl_init();
        
        $headers = [];
        $headers = array("Content-Type: application/json; charset=utf-8", 'Expect:');

        curl_setopt($session, CURLOPT_URL, $url);
        curl_setopt($session, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($session, CURLOPT_RETURNTRANSFER, true);

        $response = curl_exec($session);
        $json = json_decode($response);

        $history = $json->data;

        curl_close($session);

        return view('pages.user.total-history', compact('history'));
    }
}