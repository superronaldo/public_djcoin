<?php

namespace Database\Seeders;

use App\Models\Shopify;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class ShopifyKeyTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $key = new Shopify();
        
        if ($key === null) {
            $key = Key::create([
                'domain'                           => 'dev.djcoin.com',
                'token'                            => '5d5fbb5d1c2471e1a876b17757c3b761',
                'apikey'                           => '5d5fbb5d1c2471e1a876b17757c3b761',
                'secrect'                          => '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',
        
            ]);

            $key->save();
        }

    }
}
