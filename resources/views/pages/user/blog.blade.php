@extends('layouts.app')

@section('head')
@endsection

@section('content')
       <section class="blog section min-height-calc" id="blog">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="title text-center">
                            <h4>Our untold story</h4>
                            <h2>DJCoin News Stories</h2>
                            <span class="border width-340"></span>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum reiciendis quasi itaque, obcaecati atque sit!</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <article class="col-12 col-md-6" >
                        <div class="post-item">
                            <div class="post-thumb">
                                <img class="img-fluid shadow rounded" src="{{ URL::asset('images/blog/post-1.jpg') }}" alt="Generic placeholder image">
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
                    
                    <article class="col-12 col-md-6" >
                        <div class="post-item">
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