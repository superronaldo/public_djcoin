<?php

namespace App\Http\Controllers;

use App\Models\User;


class WhitePaperController extends Controller
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
    public function whitepaper()
    {
        return view('pages.user.white-paper');
    }
}