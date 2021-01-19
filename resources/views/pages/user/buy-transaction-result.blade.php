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
                    <h3><span>{{ Auth::user()->first_name }}!  </span> You bought <span>{{ $data['amount'] }}</span> DJ Coins!</h3>
                    <div class="row padding-left-p-10 padding-top-5 margin-bottom-20 margin-top-20">
                        <div class="col-md-9">
                            <h5 class="float-left">Your wallet address</h5>
                            <input type="text" class="form-control" id="walletAddress" value="{{ $data['to_address'] }}" readonly/>
                        </div>
                        <div class="col-md-3 copy-button">
                            <button class="btnRegister" onclick="copyToClipboard('#walletAddress')">copy</button>    
                        </div>
                    </div>
                    <div class="row padding-left-p-10 padding-top-5 margin-bottom-20">
                        <div class="col-md-9">
                            <h5 class="float-left">Your private key</h5>
                            <input type="text" class="form-control" id="privateKey" value="{{ $data['to_privatekey'] }}" readonly/>
                        </div>
                        <div class="col-md-3 copy-button">
                            <button class="btnRegister" onclick="copyToClipboard('#privateKey')">copy</button>    
                        </div>
                    </div>
                    <div class="row padding-left-p-10 padding-top-5 margin-bottom-20">
                        <div class="col-md-9">
                            <h5 class="float-left">Transaction ID</h5>
                            <input type="text" class="form-control" id="transactionID" value="{{ $data['transactionID'] }}" readonly/>
                        </div>
                        <div class="col-md-3 copy-button">
                            <button class="btnRegister" onclick="copyToClipboard('#transactionID')">copy</button>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  </body>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="{{ URL::asset('plugins/jquery/dist/jquery.min.js') }}"></script>
  <script src="{{ URL::asset('plugins/bootstrap/dist/js/bootstrap.min.js') }}"></script>

  <script>
    function copyToClipboard(element) {
        $(element).select();
        document.execCommand("copy");
    }
  </script>
</html>
@endsection