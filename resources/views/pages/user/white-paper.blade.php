@extends('layouts.app')

@section('head')
@endsection

@section('content')
    <body id="body">
        <section class="page-wrapper section min-height-calc">
            <div class="container">
                <div class="row whitepaper">
                    <div class="col-md-4">
                        <h2>DJCoin White Paper</h2>
                        <p>DJCoin (DJC) is a crypto currency for the electronic dance music community. It was created on 22nd November 2020 using the Tron blockchain. Details of the coin can be found on Tronscan.</p>
                        <a class="overflow-wrap-anywhere" href="https://tronscan.org/#/token/1003515">https://tronscan.org/#/token/1003515</a>

                        <p>DJC is limited 210,000,000 coins and its price is regulated by the number of coins in circulation. The price is controlled by a smart contract (DJCoinPrice) which is committed to the blockchain and cannot be changed.</p>
                        <a class="overflow-wrap-anywhere" href="https://tronscan.org/#/contract/TM3AhvncLtw25137EhQCJ9S2AYc6yW9tYc/code">https://tronscan.org/#/contract/TM3AhvncLtw25137EhQCJ9S2AYc6yW9tYc/code</a><br>

                        <p>The first 20,000,000 DJC are priced at £1. Thereafter, the price rises exponentially to a limit of £1,003,467.87 for the last coin.</p>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-7">
                        <h3>Phase 1</h3>
                        <p>DJC will initially be used for voting in DJ Mag’s polls and to buy discounted products from the DJ Mag shop (djmagshop.com).</p>

                        <h5>Voting</h5>
                        <p>DJ Mag’s Top 100 DJs and Top 100 Clubs attract millions of votes a year from around the world. The use of DJC for voting is to ensure accuracy and validity of the votes. The blockchain is an ideal process for this as it offers transparency and immutability. Voting will be set at 0.1DJC per vote – making this a minimal amount for the voter.</p>

                        <h5>DJ Mag Shop</h5>
                        <p>All products in djmagshop.com will initially be discounted by a minimum of 15%.</p>

                        <h3>Phase 2</h3>
                        <p>After the initial 20,000,000 coins have been sold, the price of DJC will rise (based on DJCoinPrice). This will offer an opportunity for owners of DJC to sell their coins on a DJCoin.com exchange.</p>

                        <h3>Phase 3</h3>
                        <p>Roll out to 3rd-party ticketing sites, streaming services and nightclubs.</p>

                        <h3>Conclusion</h3>
                        <p>DJCoin is a utility coin which will be used in DJ Mag voting. Value can also be released immediately by buying discounted products from the DJ Mag shop. However, as the circulation increases so does the price. This will offer initial buyers an opportunity to make a profit on their coin through our exchange. The more popular DJCoin becomes the more it transitions from a utility coin to a store of value.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main jQuery -->
        <script src="{{ URL::asset('plugins/jquery/dist/jquery.min.js') }}"></script>
        <!-- Bootstrap -->
        <script src="{{ URL::asset('plugins/bootstrap/dist/js/popper.min.js') }}"></script>
        <script src="{{ URL::asset('plugins/bootstrap/dist/js/bootstrap.min.js') }}"></script>
        <!-- Owl Carousel -->
        <script src="{{ URL::asset('plugins/slick-carousel/slick/slick.min.js') }}"></script>
        <script src="{{ URL::asset('https://cdn.plot.ly/plotly-latest.min.js') }}"></script>
        <!-- Smooth Scroll js -->
        <script src="{{ URL::asset('plugins/smooth-scroll/dist/js/smooth-scroll.min.js') }}"></script>
        
        <!-- Custom js -->
        <script src="{{ URL::asset('js/script.js') }}"></script>
    </body>
</html>
@endsection
