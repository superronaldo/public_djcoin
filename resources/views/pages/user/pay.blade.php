@extends('layouts.app')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')   
    <section class="pricing-table section" id="pricing">
        <div class="container">
            <div class="col margin-bottom-20">
                <div class="title text-center">
                    <h3 class="font-color-special color-black">Wallet Address</h3>
                    <h3 class="color-red">{{ $balance['wallet_address'] }}</h3>
                </div>
            </div>
            <form id="paymentForm" method="get" action="{{ route('pay_transaction') }}">
                @csrf
                <div class="col-md-6 col-sm-6 col-xs-12 margin-center">
                    <div class="pricing-item">
                        <h3>Make a Payment</h3>
                        <div class="row price margin-top-20">
                            <div class="col-md-2 padding-right-0">
                                <p class="font-size-20 font-weight-normal font-color-black overflow-wrap-anywhere padding-top-50 padding-left-30 float-right">DJC</p>
                            </div>
                            <div class="col-md-10 padding-left-0 padding-top-20">
                                <input type="number" class="font-size-30 width-per-85 input-price" id="DjcBalance" value="{{ $balance['Djc'] }}" readonly>
                            </div>
                        </div>
                        <div class="row price">
                            <div class="col-md-2 padding-right-0">
                                <p class="font-size-20 font-weight-normal font-color-black overflow-wrap-anywhere padding-top-50 padding-left-30 float-right">PAY</p>
                            </div>
                            <div class="col-md-10 padding-left-0 padding-top-20">
                                <input type="number" class="font-size-30 input-price width-per-85" min="1" step="1" id="DjcPayAmount" name="DjcPayAmount" required>
                            </div>
                        </div>
                        <div class="row col-md-12 display-inline-table margin-top-20">
                            <input type="submit" id="confirm" class="btn-custom btn-custom-main font-size-25 margin-top-10 margin-bottom-10 margin-left-per-36" value="Confirm">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <!-- Main jQuery -->
    <script src="{{ URL::asset('plugins/jquery/dist/jquery.min.js') }}"></script>
    <!-- Bootstrap -->
    <script src="{{ URL::asset('plugins/bootstrap/dist/js/popper.min.js') }}"></script>
    <script src="{{ URL::asset('plugins/bootstrap/dist/js/bootstrap.min.js') }}"></script>
    <!-- Owl Carousel -->
    <script src="{{ URL::asset('plugins/slick-carousel/slick/slick.min.js') }}"></script>
    <!-- Smooth Scroll js -->
    <script src="{{ URL::asset('plugins/smooth-scroll/dist/js/smooth-scroll.min.js') }}"></script>
    
    <!-- Custom js -->
    <script src="{{ URL::asset('js/script.js') }}"></script>

    <script>
        $(document).ready(function(){
            var balance = $("#DjcBalance").val();
            var payAmount = $("#DjcPayAmount").val();

            if(payAmount == 0)
                $("#confirm").prop('disabled', 'disabled');

            $("#DjcPayAmount").keypress(function(){
                if(payAmount > balance)
                    $("#confirm").prop('disabled', 'disabled');
                else
                    $("#confirm").removeAttr('disabled');
            });
        });
    </script>
    </body>
</html>
@endsection