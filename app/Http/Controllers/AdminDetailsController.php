<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Credentials;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

use Osiset\BasicShopifyAPI\BasicShopifyAPI;
use Osiset\BasicShopifyAPI\Options;
use Osiset\BasicShopifyAPI\Session;

use DB;
use Validator;
use Shopify;

use Carbon\Carbon;

class AdminDetailsController extends Controller
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
    public function listRoutes()
    {

        $key = Credentials::find(1);

        // $routes = Route::getRoutes();
        if ($key != null)
            $data = [
                'domain' => $key->domain,
                'token' => $key->token,
                'apikey' => $key->apikey,
                'secret' => $key->secret,
            ];
        else
            $data = [
                'domain' => '',
                'token' => '',
                'apikey' => '',
                'secret' => '',
            ];


        return view('pages.admin.route-details', $data);
    }

    /**
     * Display free wallet setting values of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function freeWalletSetting()
    {
        $data = DB::table('cron_schedule')->get()->last();

        if ($data != null)
            $result = [
                'wallet_create' => $data->wallet_create,
                'djc_bought'    => $data->djc_bought,
                'djc_transfer'  => $data->djc_transfer,
                'djc_return'    => $data->djc_return,
                'wallet_close'  => $data->wallet_close,
            ];
        else
            $result = [
                'wallet_create' => '',
                'djc_bought'    => '',
                'djc_transfer'  => '',
                'djc_return'    => '',
                'wallet_close'  => '',
            ];

        return $result;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function updateShopifyKey(Request $request)
    {

        $validator = Validator::make(
            $request->all(),
            [
                'domain' => 'required',
                'token' => 'required',
                'apikey' => 'required',
                'secret' => 'required',
            ]

        );

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $db = DB::connection('mysql');

        $key = Credentials::find(1);

        if ($key == NULL) {

            $shopify = array(
                'domain' => strip_tags($request->input('domain')),
                'token' => strip_tags($request->input('token')),
                'apikey' => strip_tags($request->input('apikey')),
                'secret' => strip_tags($request->input('secret')),
            );

            $response = $db->table('shopifykey')->insert($shopify);

        } else {
            $shopify = array(
                'domain' => strip_tags($request->input('domain')),
                'token' => strip_tags($request->input('token')),
                'apikey' => strip_tags($request->input('apikey')),
                'secret' => strip_tags($request->input('secret')),

            );

            $response = $db->table('shopifykey')->update($shopify);

        }

        $key = Credentials::find(1);

        $data = [
            'domain' => $key->domain,
            'token' => $key->token,
            'apikey' => $key->apikey,
            'secret' => $key->secret,
        ];

        return view('pages.admin.route-details', $data);
    }

    /**
     * Display active users page.
     *
     * @return \Illuminate\Http\Response
     */
    public function activeUsers()
    {

        // Create options for the API
        $options = new Options();

        $options->setVersion('2021-01');


// Create the client and session
        $api = new BasicShopifyAPI($options);
        $api->setSession(new Session("dj-mag-test.myshopify.com", "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"));


// Now run your requests...

        $price_rule="";
        $users = User::count();
        $shop = User::where('email', 'shop@dj-mag-test.myshopify.com')->first();
        $price = $api->rest('GET', '/admin/api/2021-01/price_rules.json')['body']->container;
        if (isset($price['price_rules'][0])){
            $price_rule = $price['price_rules'][0];
        }


        
        return view('pages.admin.active-users', ['users' => $users, 'price_rule' => $price_rule]);
    }

    /**
     * Display active users page.
     *
     * @return \Illuminate\Http\Response
     */
    public function getWallets()
    {
        // $wallet = DB::table('user_history')->where('user_id', $user->id)->get(); 
        $wallet = DB::table('free_wallets')->get();

        return view('pages.admin.wallets', compact('wallet'));
    }

    /**
     * Display active users page.
     *
     * @return \Illuminate\Http\Response
     */
    public function setWalletSetting(Request $request)
    {
        $wallet_create = $request->input('wallet-create');
        $djc_bought = $request->input('djc-bought');
        $djc_transfer = $request->input('djc-transfer');
        $djc_return = $request->input('djc-return');
        $wallet_close = $request->input('wallet-close');

        $date = Carbon::now();
        $created_at = $date->toDateTimeString();

        DB::table('cron_schedule')->insert([
            'wallet_create' => $wallet_create,
            'djc_bought' => $djc_bought,
            'djc_transfer' => $djc_transfer,
            'djc_return' => $djc_return,
            'wallet_close' => $wallet_close,
            'created_at' => $created_at
        ]);

        return redirect()->route('show_wallet_setting')->with('success', 'DJC Cron setting is updated successfully!');;
    }


    /**
     * Display active users page.
     *
     * @return \Illuminate\Http\Response
     */
    public function showWalletSetting()
    {
        $data = $this->freeWalletSetting();

        return view('pages.admin.wallet-config', $data);
    }
}
