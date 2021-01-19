@extends('layouts.app')

@section('head')
@endsection

@section('content')
    <body id="body">
    <section class="page-wrapper section min-height-calc">
        <div class="container">
            <div class="row">
                <h2>Knowledge Base</h2>
            </div>

            <div class="row knowledgebase-row">
                <div class="col-lg-6 align-self-center mb-4 mb-lg-0">
                    <p><h3>What is DJCoin?</h3></p>
                    <p>DJCoin (DJC) is a crypto-currency for the Electronic Dance Music industry. It was established in November 2020 on the Tron blockchain. DJC is limited to 210,000,000 coins (Bitcoin is limited to 20,000,000 coins). This is unlike US dollars, or Euros, or any money which is controlled by a government (or central bank). These currencies, called Fiat, can be watered down by printing more money, and ultimately, are controlled by governments.</p>
                </div>
                <div class="col-lg-6 align-self-center mb-4 mb-lg-0">
                    <img class="img-fluid rounded" src="{{ URL::asset('images/djcoin.png') }}" alt="">
                </div>
            </div>

            <div class="row knowledgebase-row">
                <div class="col-lg-12 align-self-center mb-4 mb-lg-0">
                    <p><h3>What is Crypto Currency?</h3></p>
                    <p><a href="https://en.wikipedia.org/wiki/Cryptocurrency" target="_blank">Crypto currency</a> is a form of money which uses cryptographic keys to register it on a blockchain ledger using a decentralised process to validate all transactions. This means that validation of transactions is not controlled by a single person or organisation, but by a host of computers (nodes) around the world. Blockchains (like Bitcoin and Ethereum) have tens of thousands of nodes processing the transactions, for which they are rewarded.</p>
                </div>
            </div>

            <div class="row knowledgebase-row">
                <div class="col-lg-6 align-self-center mb-4 mb-lg-0">
                    <img class="img-fluid rounded" src="{{ URL::asset('images/blockchain.jpg') }}" alt="">
                </div>
                <div class="col-lg-6 align-self-center mb-4 mb-lg-0">
                    <p><h3>What is blockchain?</h3></p>
                    <p><a href="https://en.wikipedia.org/wiki/Blockchain" target="_blank">Blockchain</a> is an immutable (can’t be changed) stack of blocks containing information about coins, transactions, wallets and Smart Contracts (more about these later). DJCoin is committed to the Tron blockchain. Tron is cheap to use (unlike Ethereum), versatile (uses Smart Contracts), fast-growing and is Asia Pacific orientated.</p>
                </div>
            </div>

            <div class="row knowledgebase-row">
                <div class="col-lg-12 align-self-center mb-4 mb-lg-0 knowledgebase">
                    <p><h3>What are the properties of blockchain?</h3></p>
                    <ol>
                        <li><b>Immutability:</b> Once blocks are added to the blockchain they can’t be changed. It represents a “set-in-stone” register of your money at that particular point in time. When you make a transfer or buy more DJC that will be added to the register by adding to the blockchain.</li>
                        <li><b>Transparency:</b> Everyone can look at the blockchain. It is not hidden. All you will see is a list of long letter and numbers (hashes) which represent transactions. If you dig deeper you will be able to see a buyer’s public key, but unless you tell someone your public key – you cannot be identified.</li>
                        <li><b>Decentralized:</b> The blockchain is not owned or controlled. It is a public resource which is hosted by tens of thousands of computers.</li>
                    </ol>
                </div>
            </div>

            <div class="row knowledgebase-row">
                <div class="col-lg-6 align-self-center mb-4 mb-lg-0 knowledgebase">
                    <p><h3>What are the properties of DJC?</h3></p>
                    <ol>
                        <li><b>Finite Amount:</b> There will only ever be 210,000,000 DJC. This is guaranteed. See <a href="https://tronscan.org/#/token/1003515" target="_blank">DJC</a> on Tron</li>
                        <li><b>Fixed Price:</b> DJC’s price is fixed by a Smart Contract called <a href="https://tronscan.org/#/contract/TM3AhvncLtw25137EhQCJ9S2AYc6yW9tYc/code" target="_blank">“DJCoinPrice”</a>. This guarantees a set price in GBP for each DJC. To our knowledge this is the only crypto-currency to do this. DJC offers stability and predictability.</li>
                        <li><b>Utility:</b> Unlike Bitcoin when it was first launched DJC offers an immediate route to redemption. DJC is used for voting in the Top 100 Polls and on djmagshop.com where every purchase using DJC will receive an initial 15% discount. In the third phase (outlined in our whitepaper) you will be able to trade DJC.</li>
                        <li><b>Store of Value:</b> As the price of DJC rises it will become a store of value, as well as a utility coin.</li>
                        <li><b>Early Adopter:</b> We have engineered an initial period into the price of DJC where the price of 1 DJC will always be equal to £1 (one Great British Pound). This price is set for the first 20,000,000 coins and is designed to attract and reward early investors.</li>
                        <li><b>DJ Mag backed:</b> DJC is backed by one of EDM’s best-known and well-respected brands – <a href="https://en.wikipedia.org/wiki/DJ_Mag" target="_blank">DJ Mag</a>. Established in 1991 DJ Mag has been providing balanced, independent news and information about dance music and the nightclub scene. We have offices and websites around the world. With millions of users and social media followers, as well as, established market contacts DJ Mag’s market penetration is second to none.</li>
                        <li><b>Affordable:</b> Unlike Bitcoin, DJC is affordable and can be bought by anyone for as little as £1. We are giving discounts for bulk purchases. These can be found on djmagshop.com.</li>
                        <li><b>Gifts:</b> As a special thank you for becoming part of the DJC community we are giving unique gifts to all our purchasers of DJCoin. These gifts can’t be found anywhere else and are for purchasers of DJC only.</li>
                    </ol>
                </div>
                <div class="col-lg-6 align-self-center mb-4 mb-lg-0">
                    <p>
                        <img class="img-fluid rounded" src="{{ URL::asset('images/10_djcoins_black.png') }}" alt="">
                        <figcaption>Free poker chip with each DJC10 purchase.</figcaption>
                    </p>
                    <p>
                        <img class="img-fluid rounded" src="{{ URL::asset('images/CushionPhoto.png') }}" alt="">
                        <figcaption>Free designer cushion with DJC1000 purchase.</figcaption>
                    </p>

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
