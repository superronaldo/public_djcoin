<?php

namespace App\Http\Controllers;

use App\Models\User;
use Auth;
use DB;

class TransactionHistoryController extends Controller
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
    public function index()
    {
        $history = DB::table('transaction_history')->get(); 

        return view('pages.user.history', compact('history'));
    }
}