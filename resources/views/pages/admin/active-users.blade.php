@extends('layouts.app')

@section('template_title')
    {{ trans('titles.activeUsers') }}
@endsection

@section('content')

    <users-count :registered={{ $users }} ></users-count>
    <div class="container">
        <div class="card">
            <div class="card-header">
                Shopify Discount
            </div>
            <form id="updateprice" method="post" action="{{ route('updatePriceRule') }}">
                @csrf
                <div class="col-md-6 col-sm-6 col-xs-12 margin-center">
                    <div class="pricing-item">

                        <div class="text-align-center margin-top-30">
                            <p class="font-size-20 font-weight-normal font-color-black overflow-wrap-anywhere">Enter percentage discount as a decimal.</p>
                        </div>

                        <div class="row price margin-top-40 margin-bottom-40">

                            <div class="col-md-4 padding-right-10 padding-top-20">
                                <p class="font-size-20 font-weight-normal font-color-black overflow-wrap-anywhere float-left">
                                    Shopify Discount</p>
                            </div>

                            <div class="col-md-8 padding-left-0 padding-top-20">
                                <input type="number" class="form-control" min="0" max="1" step="0.05" name="value_rate" id="value_rate">
                            </div>

                            <div class="row col-md-12 margin-top-40">
                                <input type="submit" id="update" class="btn-custom btn-custom-main font-size-20 margin-top-10 margin-bottom-10 margin-left-per-36 border-radius-20" value="UPDATE">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{{--    <form id="createscript" method="post" action="{{ route('createScriptTag') }}">--}}
{{--        @csrf--}}
{{--        <div class="col-md-3 ">--}}
{{--            <input type="submit" id="update"--}}
{{--                   class="btn-custom btn-custom-main font-size-20 margin-top-10 margin-bottom-10 margin-left-per-36 border-radius-20"--}}
{{--                   value="Add Script">--}}
{{--        </div>--}}
{{--    </form>--}}
    {{--Delete Script Tag--}}
{{--    <form id="createscript" method="post" action="{{ route('deleteScript','160406339776') }}">--}}
{{--        @method('DELETE');--}}
{{--        @csrf--}}
{{--        <div class="col-md-3 form-group">--}}
{{--            <input type="text" name="id" value="" placeholder="Enter Script Id" class="form-control">--}}
{{--            <input type="submit" id="update"--}}
{{--                   class="btn-custom btn-custom-main font-size-20 margin-top-10 margin-bottom-10 margin-left-per-36 border-radius-20"--}}
{{--                   value="Delete Script">--}}
{{--        </div>--}}
{{--    </form>--}}
@endsection
@section('footer_scripts')
    <script src="{{ asset('js/ajaxcall.js') }}"></script>
@endsection
