<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        {{-- CSRF Token --}}
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>@hasSection('template_title')@yield('template_title') | @endif {{ config('app.name', Lang::get('titles.app')) }}</title>
        <meta name="description" content="">
        <meta name="author" content="Jeremy Kenedy">
        <link rel="shortcut icon" href="{{ URL::asset('favicon.ico') }}">
        
        <link rel="stylesheet" href="{{ URL::asset('plugins/themefisher-font.v-2/style.css') }}">
        <!-- bootstrap.min css -->
        <link rel="stylesheet" href="{{ URL::asset('plugins/bootstrap/dist/css/bootstrap.min.css') }}">
        <!-- Slick Carousel -->
        <link rel="stylesheet" href="{{ URL::asset('plugins/slick-carousel/slick/slick.css') }}">
        <link rel="stylesheet" href="{{ URL::asset('plugins/slick-carousel/slick/slick-theme.css') }}">
        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="{{ URL::asset('css/style.css') }}">
        <link rel="stylesheet" href="{{ URL::asset('css/margin.css') }}">
        <link rel="stylesheet" href="{{ URL::asset('css/padding.css') }}">
        <link rel="stylesheet" href="{{ URL::asset('css/style.css') }}">
        <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        {{-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries --}}
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        {{-- Fonts --}}
        @yield('template_linked_fonts')

        {{-- Styles --}}
        <link href="{{ URL::asset('/css/app.css') }}" rel="stylesheet">

        @yield('template_linked_css')

        <style type="text/css">
            @yield('template_fastload_css')

            @if (Auth::User() && (Auth::User()->profile) && (Auth::User()->profile->avatar_status == 0))
                .user-avatar-nav {
                    background: url({{ Gravatar::get(Auth::user()->email) }}) 50% 50% no-repeat;
                    background-size: auto 100%;
                }
            @endif

        </style>

        {{-- Scripts --}}
        <script>
            window.Laravel = {!! json_encode([
                'csrfToken' => csrf_token(),
            ]) !!};
        </script>

        @if (Auth::User() && (Auth::User()->profile) && $theme->link != null && $theme->link != 'null')
            <link rel="stylesheet" type="text/css" href="{{ $theme->link }}">
        @endif

        @yield('head')
        @include('scripts.ga-analytics')
    </head>
    <body>
        <div id="app">

            @include('partials.nav')

            <div class="min-height-calc">
                <main>

                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                @include('partials.form-status')
                            </div>
                        </div>
                    </div>

                    @yield('content')

                </main>
            </div>

        </div>

        {{-- Scripts --}}
        <script src="{{ URL::asset('/js/app.js') }}"></script>

        <footer id="footer" class="bg-one">
            <div class="footer-bottom">
                <h5>Copyright 2020. All rights reserved.</h5>
                <h6>Design and Developed by <a href="">Anton</a></h6>
            </div>
        </footer>

        @yield('footer_scripts')

    </body>
</html>
