<?php

namespace App\Http\Controllers;

use App\Models\User;


class KnowledgeBaseController extends Controller
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
    public function knowledgebase()
    {
        return view('pages.user.knowledgebase');
    }
}
