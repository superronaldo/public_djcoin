<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Osiset\BasicShopifyAPI\BasicShopifyAPI;
use Osiset\BasicShopifyAPI\Options;
use Osiset\BasicShopifyAPI\Session;

class SetPricingRuleController extends Controller
{

    private $api;

    public function __construct()
    {
        // Create options for the API
        $options = new Options();
        $options->setVersion('2021-01');

       // Create the client and session
        $api = new BasicShopifyAPI($options);
        $api->setSession(new Session("dj-mag-test.myshopify.com", "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"));

       // Now run your requests...
        $this->api = $api;
    }


    public function store(Request $request)
    {


        $price = $this->api->rest('GET', '/admin/api/2021-01/price_rules/count.json')['body']->container;


        if ($price['count'] == 0) {
            $new = $this->api->rest('POST', '/admin/api/2021-01/price_rules.json', ['price_rule' => array(
                'title' => 'DJCDISCOUNT',
                'target_type' => 'line_item',
                'target_selection' => 'all',
                'allocation_method' => 'across',
                'once_per_customer' => 'false',
                'value_type' => 'percentage',
                'value' => -$request->value_rate,
                'customer_selection' => 'all',
                'starts_at' => date("c", strtotime(date('Y-m-d')))
            )]);

        } else {
            $price = $this->api->rest('GET', '/admin/api/2021-01/price_rules.json')['body']->container;

            $price_rule = $price['price_rules'][0];
            $id = $price_rule['id'];

            $update = $this->api->rest('PUT', '/admin/api/2021-01/price_rules/' . $id . '.json', ['price_rule' => array(
                'id' => $id,
                'once_per_customer' => 'false',
                'value' => -$request->value_rate
            )]);


        }
        return redirect()->route('shopify_config')->with('success', 'Discount Update Successfully');
    }

    public function destroy($id)
    {
        echo $id;
        $new = $this->api->rest('DELETE', '/admin/api/2021-01/script_tags/' . $id . '.json');
        dd($new);
    }

    public function activePriceRule()
    {

        //$shop=User::where('email','shop@dj-mag-test.myshopify.com')->first();
        $price = $this->api->rest('GET', '/admin/api/2021-01/price_rules.json')['body']->container;
        // return  response()->json($price);
        echo abs($price['price_rules'][0]['value']);
        die();
    }

    public function storeScriptTag()
    {

        $new = $this->api->rest('POST', '/admin/api/2021-01/script_tags.json', ['script_tag' => array(
            'event' => 'onload',
            'src' => url('js/ajaxcall.js'),
        )]);
        dd($new);
    }

    public function getScrips()
    {

        $scripts = $this->api->rest('GET', '/admin/api/2021-01/script_tags.json')['body']->container;
        return response()->json($scripts);
        exit();
    }
}
