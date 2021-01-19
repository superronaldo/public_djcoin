<!-- <nav class="navbar navbar-expand-md navbar-light navbar-laravel"> -->
<section class="header navigation">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar navbar-expand-lg">
                    <div class="container">
                        <a class="navbar-brand" href="{{ url('/') }}">
                            <img src="{{ URL::asset('images/logo.png') }}" alt="logo">
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                            <span class="sr-only">{!! trans('titles.toggleNav') !!}</span>
                        </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                {{-- Left Side Of Navbar --}}
                                <ul class="navbar-nav ml-auto">
                                @role('admin')
                                    <div class="dropdown-divider"></div>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item font-color-white {{ Request::is('home', 'users', 'users/' . Auth::user()->id, 'users/' . Auth::user()->id . '/edit') ? 'active' : null }}" href="{{ url('/users') }}">
                                            UserList
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <li class="nav-item dropdown">
                                        <a id="navbarDropdown" class="nav-link dropdown-toggle margin-top-2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                            {!! trans('titles.config') !!}
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="{{ url('/credentials') }}">
                                            {!! trans('titles.credentials') !!}
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="{{ url('/config') }}">
                                                {!! trans('titles.config_shopify') !!}
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="{{ url('/setting') }}">
                                                {!! trans('titles.config_free_wallet') !!}
                                            </a>
                                        </div>
                                    </li>
                                    <div class="dropdown-divider"></div>
                                    
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item font-color-white {{ Request::is('wallets') ? 'active' : null }}" href="{{ url('/wallets') }}">
                                           Wallets
                                    </a>
                                    <div class="dropdown-divider"></div>

                                @endrole    
                                @role('user')
                                    <a class="dropdown-item font-color-white" href="{{ url('/buy') }}">{{ trans('titles.buy') }}</a>
                                    <a class="dropdown-item font-color-white" href="{{ url('/pay') }}">{{ trans('titles.pay') }}</a>
                                    <a class="dropdown-item font-color-white" href="{{ url('/history') }}">{{ trans('titles.history') }}</a>
                                @endrole
                                </ul>
                            </div>
                             @guest
                            <div class="collapse navbar-collapse margin-top-15" id="navbarSupportedContent">
                                <ul class="navbar-nav ml-auto margin-right-50">
                                    <li>
                                        <a class="nav-link montserrat-font" href="{{ route('whitepaper') }}">{{ trans('titles.whitepaper') }}</a>
                                    </li>
                                    <li>
                                        <a class="nav-link montserrat-font" href="{{ route('blog') }}">{{ trans('titles.blog') }}</a>
                                    </li>
                                    <li>
                                        <a class="nav-link montserrat-font" href="{{ route('totalhistory') }}">{{ trans('titles.totalhistory') }}</a>
                                    </li>
                                    <li>
                                        <a class="nav-link montserrat-font" href="{{ route('knowledgebase') }}">{{ trans('titles.knowledgebase') }}</a>
                                    </li>
                                </ul>
                            </div>
                            @endguest
                            {{-- Right Side Of Navbar --}}
                            <ul class="navbar-nav ml-auto margin-top-15">
                                {{-- Authentication Links --}}
                                @guest
                                    <i class="fa fa-user font-size-25 color-white"></i>
                                    <li class="padding-right-0"><a class="nav-link" href="{{ route('login') }}">{{ trans('titles.signin') }}</a></li>
                                    <li class="padding-right-0"><span class="color-white font-size-18">/</span></li>
                                    @if (Route::has('register'))
                                        <li><a class="nav-link" href="{{ route('register') }}">{{ trans('titles.register') }}</a></li>
                                    @endif
                                @else
                                    <li class="nav-item dropdown">
                                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                            @if ((Auth::User()->profile) && Auth::user()->profile->avatar_status == 1)
                                                <img src="{{ Auth::user()->profile->avatar }}" alt="{{ Auth::user()->name }}" class="user-avatar-nav">
                                            @else
                                                <div class="user-avatar-nav"></div>
                                            @endif
                                            {{ Auth::user()->name }} <span class="caret"></span>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item {{ Request::is('profile/'.Auth::user()->name, 'profile/'.Auth::user()->name . '/edit') ? 'active' : null }}" href="{{ url('/profile/'.Auth::user()->name) }}">
                                                {!! trans('titles.profile') !!}
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="{{ route('logout') }}"
                                               onclick="event.preventDefault();
                                                             document.getElementById('logout-form').submit();">
                                                {{ __('Logout') }}
                                            </a>
                                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                @csrf
                                            </form>
                                        </div>
                                    </li>
                                @endguest
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</section>