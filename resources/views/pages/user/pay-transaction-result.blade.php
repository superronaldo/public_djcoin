@extends('layouts.app')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
<html>
    <body id="body">

    <section class="pricing-table section" id="pricing">
        <div class="container">
            <div class="col-md-8 col-sm-8 col-xs-12 margin-center">
                <div class="pricing-item">
                    <div>
                        <i class="check-mark font-size-180 font-weight-bold">✓</i>
                    </div>
                    <h1>Success</h1> 
                    <p>Your payment is succeeded!</p>
                    <a type="button" class="btn-custom btn-custom-main margin-bottom-20 font-size-25 margin-top-50 border-radius-50" href="{{ url('/buy') }}">Go Home</a>
                </div>
            </div>
        </div>
    </section>
  </body>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="{{ URL::asset('plugins/jquery/dist/jquery.min.js') }}"></script>
  <script src="{{ URL::asset('plugins/bootstrap/dist/js/bootstrap.min.js') }}"></script>
</html>
@endsection