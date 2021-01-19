@extends('layouts.app')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
    <section class="pricing-table section" id="pricing">
        <div class="container">
            <div class="col-md-8 col-sm-8 col-xs-12 margin-center">
                <div class="pricing-item">
                    <h3>Buy DJC</h3>
                    <div class="row price margin-bottom-0">
                    <div class="col-md-9 padding-top-20" id='product-component-1606487067126'></div>  
                    </div>
                    <div class="row col-md-12 display-inline-table">
                        <a href="{{ route('buy_transaction') }}" id="show-wallet" class="btn-custom btn-custom-main font-size-15 margin-bottom-20 margin-left-per-36 display-none" >Show Wallet</a>
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
/*<![CDATA[*/
(function () {
  var scriptURL = 'https://sdks.shopifycdn.com/buy-button/latest/buy-button-storefront.min.js';
  // var scriptURL = 'js/buy-button-storefront.js';
  if (window.ShopifyBuy) {
    if (window.ShopifyBuy.UI) {
      ShopifyBuyInit();
    } else {
      loadScript();
    }
  } else {
    loadScript();
  }
  function loadScript() {
    var script = document.createElement('script');
    script.async = true;
    script.src = scriptURL;
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(script);
    script.onload = ShopifyBuyInit;
  }
  function ShopifyBuyInit() {
    var client = ShopifyBuy.buildClient({
      domain: 'dj-mag-test.myshopify.com',
      storefrontAccessToken: '007e0527fb64dcc218d0a2fa9a0ed53b',
    });
    ShopifyBuy.UI.onReady(client).then(function (ui) {
      ui.createComponent('product', {
        id: '6084572545216',
        node: document.getElementById('product-component-1606487067126'),
        moneyFormat: '%C2%A3%7B%7Bamount%7D%7D',
        options: {
          "product": {
            "styles": {
              "product": {
                "@media (min-width: 601px)": {
                  "max-width": "100%",
                  "margin-left": "0",
                  "margin-bottom": "50px"
                },
                "text-align": "left"
              },
              "title": {
                "font-size": "26px"
              },
              "price": {
                "font-size": "19px"
              },
              "compareAt": {
                "font-size": "16.15px"
              },
              "unitPrice": {
                "font-size": "16.15px"
              }
            },
            "buttonDestination": "checkout",
            "layout": "horizontal",
            "contents": {
              "img": false,
              "imgWithCarousel": true,
              "button": false,
              "buttonWithQuantity": true,
              "description": true
            },
            "width": "100%",
            "text": {
              "button": "Buy now"
            }
          },
          "productSet": {
            "styles": {
              "products": {
                "@media (min-width: 601px)": {
                  "margin-left": "-20px"
                }
              }
            }
          },
          "modalProduct": {
            "contents": {
              "img": false,
              "imgWithCarousel": true,
              "button": false,
              "buttonWithQuantity": true
            },
            "styles": {
              "product": {
                "@media (min-width: 601px)": {
                  "max-width": "100%",
                  "margin-left": "0px",
                  "margin-bottom": "0px"
                }
              }
            },
            "text": {
              "button": "Add to cart"
            }
          },
          "cart": {
            "text": {
              "total": "Subtotal",
              "button": "Checkout"
            },
            "popup": true
          }
        },
      });
    });
  }
})();
/*]]>*/
</script>
</html>
@endsection