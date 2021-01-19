<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
| Middleware options can be located in `app/Http/Kernel.php`
|
*/

Route::group(['middleware' => ['web', 'checkblocked']], function () {
    Route::get('/', 'WelcomeController@welcome')->name('welcome');
    Route::get('/whitepapaer', 'App\Http\Controllers\WhitePaperController@whitepaper')->name('whitepaper');
    Route::get('/blog', 'App\Http\Controllers\BlogController@blog')->name('blog');
    Route::get('/totalhistory', 'App\Http\Controllers\TotalTransactionHistoryController@index')->name('totalhistory');
    Route::get('/knowledgebase', 'App\Http\Controllers\KnowledgeBaseController@knowledgebase')->name('knowledgebase');
});

// Homepage Route
Route::group(['middleware' => ['web', 'checkblocked']], function () {
    Route::get('/', 'App\Http\Controllers\WelcomeController@welcome')->name('welcome');
    Route::get('/terms', 'App\Http\Controllers\TermsController@terms')->name('terms');
});

// Authentication Routes
Auth::routes();

// Public Routes
Route::group(['middleware' => ['web', 'activity', 'checkblocked']], function () {

    // Activation Routes
    Route::get('/activate', ['as' => 'activate', 'uses' => 'App\Http\Controllers\Auth\ActivateController@initial']);

    Route::get('/activate/{token}', ['as' => 'authenticated.activate', 'uses' => 'App\Http\Controllers\Auth\ActivateController@activate']);
    Route::get('/activation', ['as' => 'authenticated.activation-resend', 'uses' => 'App\Http\Controllers\Auth\ActivateController@resend']);
    Route::get('/exceeded', ['as' => 'exceeded', 'uses' => 'App\Http\Controllers\Auth\ActivateController@exceeded']);

    // Socialite Register Routes
    Route::get('/social/redirect/{provider}', ['as' => 'social.redirect', 'uses' => 'App\Http\Controllers\Auth\SocialController@getSocialRedirect']);
    Route::get('/social/handle/{provider}', ['as' => 'social.handle', 'uses' => 'App\Http\Controllers\Auth\SocialController@getSocialHandle']);

    // Route to for user to reactivate their user deleted account.
    Route::get('/re-activate/{token}', ['as' => 'user.reactivate', 'uses' => 'App\Http\Controllers\RestoreUserController@userReActivate']);
});

// Registered and Activated User Routes
Route::group(['middleware' => ['auth', 'activated', 'activity', 'checkblocked']], function () {

    // Activation Routes
    Route::get('/activation-required', ['uses' => 'App\Http\Controllers\Auth\ActivateController@activationRequired'])->name('activation-required');
    Route::get('/logout', ['uses' => 'App\Http\Controllers\Auth\LoginController@logout'])->name('logout');
});

// Registered and Activated User Routes
Route::group(['middleware' => ['auth', 'activated', 'activity', 'twostep', 'checkblocked']], function () {

    //  Homepage Route - Redirect based on user role is in controller.
    Route::get('/home', ['as' => 'public.home',   'uses' => 'App\Http\Controllers\UserController@index']);

    // Show users profile - viewable by other users.
    Route::get('profile/{username}', [
        'as'   => '{username}',
        'uses' => 'App\Http\Controllers\ProfilesController@show',
    ]);
});

// Registered, activated, and is current user routes.
Route::group(['middleware' => ['auth', 'activated', 'currentUser', 'activity', 'twostep', 'checkblocked']], function () {

    // User Profile and Account Routes
    Route::resource(
        'profile',
        \App\Http\Controllers\ProfilesController::class,
        [
            'only' => [
                'show',
                'edit',
                'update',
                'create',
            ],
        ]
    );
    Route::put('profile/{username}/updateUserAccount', [
        'as'   => '{username}',
        'uses' => 'App\Http\Controllers\ProfilesController@updateUserAccount',
    ]);
    Route::put('profile/{username}/updateUserPassword', [
        'as'   => '{username}',
        'uses' => 'App\Http\Controllers\ProfilesController@updateUserPassword',
    ]);
    Route::delete('profile/{username}/deleteUserAccount', [
        'as'   => '{username}',
        'uses' => 'App\Http\Controllers\ProfilesController@deleteUserAccount',
    ]);

    // Route to show user avatar
    Route::get('images/profile/{id}/avatar/{image}', [
        'uses' => 'App\Http\Controllers\ProfilesController@userProfileAvatar',
    ]);

    // Route to upload user avatar.
    Route::post('avatar/upload', ['as' => 'avatar.upload', 'uses' => 'App\Http\Controllers\ProfilesController@upload']);
});

// Registered, activated, and is admin routes.
Route::group(['middleware' => ['auth', 'activated', 'role:admin', 'activity', 'twostep', 'checkblocked']], function () {
    Route::resource('/users/deleted', \App\Http\Controllers\SoftDeletesController::class, [
        'only' => [
            'index', 'show', 'update', 'destroy',
        ],
    ]);

    Route::resource('users', \App\Http\Controllers\UsersManagementController::class, [
        'names' => [
            'index'   => 'users',
            'destroy' => 'user.destroy',
        ],
        'except' => [
            'deleted',
        ],
    ]);
    Route::post('search-users', 'App\Http\Controllers\UsersManagementController@search')->name('search-users');

    Route::resource('themes', \App\Http\Controllers\ThemesManagementController::class, [
        'names' => [
            'index'   => 'themes',
            'destroy' => 'themes.destroy',
        ],
    ]);

    Route::get('logs', '\Rap2hpoutre\LaravelLogViewer\LogViewerController@index');
    Route::get('credentials', 'App\Http\Controllers\AdminDetailsController@listRoutes');
    Route::post('updateshopifykey', 'App\Http\Controllers\AdminDetailsController@updateShopifyKey')->name('updateShopifyKey');
    // update priceRule
    Route::post('updatePriceRule', 'App\Http\Controllers\SetPricingRuleController@store')->name('updatePriceRule')->middleware(['auth.shopify']);;
    Route::post('createscript', 'App\Http\Controllers\SetPricingRuleController@storeScriptTag')->name('createScriptTag')->middleware(['auth.shopify']);;
    Route::delete('deletescript/{scriptid}','App\Http\Controllers\SetPricingRuleController@destroy')->name('deleteScript');

    Route::get('config', 'App\Http\Controllers\AdminDetailsController@activeUsers')->name('shopify_config');

    Route::get('wallets', 'App\Http\Controllers\AdminDetailsController@getWallets')->name('free_wallets');

    Route::get('setting', 'App\Http\Controllers\AdminDetailsController@showWalletSetting')->name('show_wallet_setting');
    Route::post('set_wallet_setting', 'App\Http\Controllers\AdminDetailsController@setWalletSetting')->name('set_wallet_setting');
});

Route::group(['middleware' => ['auth', 'activated', 'role:user', 'activity', 'twostep', 'checkblocked']], function () {
    Route::get('pay', 'App\Http\Controllers\PayController@pay')->name('pay');
    Route::get('buy', 'App\Http\Controllers\BuyController@buy')->name('buy');
    Route::get('buy_transaction', 'App\Http\Controllers\BuyTransactionController@buy_transaction')->name('buy_transaction');
    Route::get('pay_transaction', 'App\Http\Controllers\PayTransactionController@pay_transaction')->name('pay_transaction');
    Route::get('success', 'App\Http\Controllers\SuccessController@success')->name('success');
    Route::get('history', 'App\Http\Controllers\TransactionHistoryController@index')->name('history');
});

//for get active pricing rule publicly
Route::get('activepricerule', 'App\Http\Controllers\SetPricingRuleController@activePriceRule')->name('activePriceRule')->middleware('App\Http\Middleware\OriginCheck');
Route::get('getscript', 'App\Http\Controllers\SetPricingRuleController@getScrips')->name('getScripts');



Route::redirect('/php', '/phpinfo', 301);


Route::get('/shopify', function () {
    return view('shopify_login');
})->name('home');

Route::get('/shop', function () {
    return view('welcome_shopify');
})->middleware(['auth.shopify'])->name('shop');
