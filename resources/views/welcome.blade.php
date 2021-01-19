@extends('layouts.app')

@section('head')
@endsection

@section('content')
    <body id="body">
        <section class="hero-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 align-self-center mb-4 mb-lg-0">
                        <div class="video-player">
                            <img class="img-fluid rounded" src="{{ URL::asset('images/slider/slider-bg-2.jpg') }}" alt="">
                            <a class="play-icon">
                                <i class="tf-ion-ios-play" data-video="https://www.youtube.com/embed/g3-VxLQO7do?autoplay=1"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="block">
                            <h2>DJCoin (DJC) is a crypto-currency for the EDM industry.</h2>
                            <p>DJC is backed by <a href="https://djmag.com">DJ Mag</a> a leading brand in EDM. It offers an affordable entry into the crypto-currency market.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>  
    <!--
        <section class="counter section-sm">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-3">
                        <div class="counters-item">
                            <span>$50B+</span>
                            <p>DJcoin Served</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-3">
                        <div class="counters-item">
                            <span>10M+</span>
                            <p>Server Build</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-3">
                        <div class="counters-item">
                            <span>68</span>
                            <p>Countries Supported</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-3">
                        <div class="counters-item kill-border">
                            <span>10B</span>
                            <p>Active Treades</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    -->
        <section class="about-2 section bg-gray" id="about">
            <div class="container text-align-center">
                <div class="col-12 col-md-12 align-self-center mb-4 mb-md-0">
                    <div class="align-self-center">
                        <h2>What is DJCoin?</h2>
                        <p><a href="https://tronscan.org/#/token/1003515" target="_blank">DJCoin (DJC)</a> is a crypto-currency specifically created for the Electronic Dance Music industry. It was established in November 2020 on the <a href="https://tronscan.org" target="_blank">Tron blockchain</a>. Its price is controlled by a Smart Contract, called <a href="https://tronscan.org/#/contract/TM3AhvncLtw25137EhQCJ9S2AYc6yW9tYc/code" target="_blank">"DJCoinPrice"</a> which is also committed to the blockchain. This gives DJC stability and certainty.</p>
                        <a href="/knowledgebase" class="btn btn-main margin-top-20">Learn More</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- How It Works Section -->

        <section class="service-2 section bg-gray padding-top-0">
          <div class="container">
            <div class="row">
              <div class="col">
                <div class="title text-center">
                  <h4>DJCoin flow</h4>
                  <h2>How It Works</h2>
                  <span class="border width-240"></span>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum reiciendis quasi itaque, obcaecati atque sit!</p>
                </div>
              </div>
            </div>

            <!-- Start Call To Action -->
            <section class="call-to-action section-sm background-color-black padding-bottom-30">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h2>Create a new account for free and start business with DJCoins now!</h2>
                            <p>Proin gravida nibh vel velit auctor aliquet. Aenean sollicudin bibendum auctor, <br> nisi elit consequat ipsum, nesagittis sem nid elit. Duis sed odio sitain elit.</p>
                            <a href="{{ route('register') }}" class="btn btn-main">Get Started</a>
                        </div>
                    </div>
                </div>
            </section>

            <div class="row">
              <div class="col-md-4 p-0">
                <div class="service-item text-center">
                    <span class="count">1</span>
                    <h4>Register</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae risus nec dui venenatis.</p>
                </div>
              </div>
              <div class="col-md-4 p-0">
                <div class="service-item text-center">
                  <span class="count">2</span>
                  <h4>Buy DJCoin</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae risus nec dui venenatis.</p>
                </div>
              </div>
              <div class="col-md-4 p-0">
                <div class="service-item text-center">
                  <span class="count">3</span>
                  <h4>Pay DJCoin</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae risus nec dui venenatis.</p>
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- Start Testimonial -->

        <section class="testimonial section background-color-black" id="testimonial">
            <div class="container">
                <div class="row">               
                    <div class="col-lg-12">
                        <div class="testimonial-slider">
                            <div class="item">
                                <div class="block">
                                    <div class="client-details">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et dicta eius, nesciunt laboriosam cumque odio veritatis hic quibusdam, impedit corporis libero tenetur blanditiis rem maiores mollitia, vero officiis nulla molestias.</p>
                                    </div>
                                    <div class="media client-meta">
                                      <img class="mr-3 client-thumb" src="{{ URL::asset('images/client-logo/clients-1.jpg') }}" alt="Generic placeholder image">
                                      <div class="media-body">
                                        <h4 class="mt-0">Matt Cutts</h4>
                                        <p>CEO, Themefisher</p>
                                      </div>
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="block">
                                    <div class="client-details">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et dicta eius, nesciunt laboriosam cumque odio veritatis hic quibusdam, impedit corporis libero tenetur blanditiis rem maiores mollitia, vero officiis nulla molestias.</p>
                                    </div>
                                    <div class="media client-meta">
                                      <img class="mr-3 client-thumb" src="{{ URL::asset('images/client-logo/clients-1.jpg') }}" alt="Generic placeholder image') }}">
                                      <div class="media-body">
                                        <h4 class="mt-0">Matt Cutts</h4>
                                        <p>CEO, Themefisher</p>
                                      </div>
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="block">
                                    <div class="client-details">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et dicta eius, nesciunt laboriosam cumque odio veritatis hic quibusdam, impedit corporis libero tenetur blanditiis rem maiores mollitia, vero officiis nulla molestias.</p>
                                    </div>
                                    <div class="media client-meta">
                                      <img class="mr-3 client-thumb" src="{{ URL::asset('images/client-logo/clients-1.jpg') }}" alt="Generic placeholder image') }}">
                                      <div class="media-body">
                                        <h4 class="mt-0">Matt Cutts</h4>
                                        <p>CEO, Themefisher</p>
                                      </div>
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="block">
                                    <div class="client-details">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et dicta eius, nesciunt laboriosam cumque odio veritatis hic quibusdam, impedit corporis libero tenetur blanditiis rem maiores mollitia, vero officiis nulla molestias.</p>
                                    </div>
                                    <div class="media client-meta">
                                      <img class="mr-3 client-thumb" src="{{ URL::asset('images/client-logo/clients-1.jpg') }}" alt="Generic placeholder image') }}">
                                      <div class="media-body">
                                        <h4 class="mt-0">Matt Cutts</h4>
                                        <p>CEO, Themefisher</p>
                                      </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Start Blog Section -->
        <section class="blog section" id="blog">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="title text-center">
                            <h4>Our untold story</h4>
                            <h2>DJCoin Knowledge Base.</h2>
                            <span class="border width-440"></span>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum reiciendis quasi itaque, obcaecati atque sit!</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- single blog post -->
                    <article class="col-12 col-md-6" >
                        <div class="post-item margin-bottom-0">
                            <div class="post-thumb">
                                <img class="img-fluid shadow rounded" src="{{ URL::asset('images/blog/post-1.jpg') }}" alt="Generic placeholder image') }}">
                            </div>
                            <div class="post-title">
                                <h3 class="mt-0"><a href="">Ten things about Business</a></h3>
                            </div>
                            <div class="post-meta">
                                <span>By</span> <a href="" class="">Jonathon Ive</a>
                            </div>
                            <div class="post-content">
                                <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est voluptatem accusantium dolorum, maxime eos blanditiis sint enim necessitatibus placeat dolor.</p>
                            </div>
                            <a class="btn btn-main" href="#">Read more</a>
                        </div>
                    </article>
                    <!-- /single blog post -->
                    
                    <!-- single blog post -->
                    <article class="col-12 col-md-6" >
                        <div class="post-item margin-bottom-0">
                            <div class="post-thumb">
                                <img class="img-fluid shadow rounded" src="{{ URL::asset('images/blog/post-2.jpg') }}" alt="Generic placeholder image">
                            </div>
                            <div class="post-title">
                                <h3 class="mt-0"><a href="">Something I need to tell you</a></h3>
                            </div>
                            <div class="post-meta">
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <span>By</span> <a href="" class="">Jonathon Ive</a>        
                                    </li>
                                    <li class="list-inline-item">
                                        <span>By</span> <span> 15th December 2017</span>        
                                    </li>
                                </ul>
                            </div>
                            <div class="post-content">
                                <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est voluptatem accusantium dolorum, maxime eos blanditiis sint enim necessitatibus placeat dolor.</p>
                            </div>
                            <a class="btn btn-main" href="#">Read more</a>
                        </div>
                    </article>
                    <!-- end single blog post -->
                    
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
