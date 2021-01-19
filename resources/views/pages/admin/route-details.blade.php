@extends('layouts.app')

@section('template_title')
	Routing Information
@endsection

@section('content')
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				@include('partials.form-status')

				<div class="card">
					<div class="card-header">
						Shopify Api Credentials
					</div>
					<div class="card-body">
						<form  class="form" method="post" action="{{ route('updateShopifyKey') }}">
				            @csrf
				            <div class="col-md-6 col-sm-6 col-xs-12 margin-center">

					                    <div class="row">
					                        <div class="padding-right-10 padding-top-20 ">
					                        	<h5 class="float-left">Domain*</h5>
					              
					                        </div>

					                        <div class="input-group">
	                                            <input id="domain" onchange = "checksubmit()" class="form-control" placeholder="" name="domain" type="text" value=" {{ $domain }}">
	                                        </div>
	                                         
	                                        Do not include http:// or https://

	                                         @if($errors->has('token'))
		                                        <span class="help-block">
		                                            <strong>{{ $errors->first('domain') }}</strong>
		                                        </span>
                                    		@endif

					                    </div>                       
					                
				                
				            </div>
				             <div class="col-md-6 col-sm-6 col-xs-12 margin-center">
				              
					                    <div class="row price margin-top-0 margin-bottom-10">
					                        <div class="padding-right-10 padding-top-20">
					                        	<h5 class="float-left">Token*</h5>
					                            
					                        </div>

					                        <div class="input-group">
	                                            <input id="token" class="form-control" onchange = "checksubmit()" placeholder="" name="token" type="text" value="{{ $token }}">
	                                        </div>
	                                        
	                                        This may be labeled as Password in the shopify private app console
	                                         @if($errors->has('token'))
		                                        <span class="help-block">
		                                            <strong>{{ $errors->first('token') }}</strong>
		                                        </span>
                                    		@endif

					                    </div>  
				                                        
				                
				            </div>
				             <div class="col-md-6 col-sm-6 col-xs-12 margin-center">

				                    <div class="row price margin-top-0 margin-bottom-10">
				                        <div class="padding-right-10 padding-top-20">
				                        	<h5 class="float-left">API key*</h5>
				                            
				                        </div>

				                        <div class="input-group">
                                            <input id="apikey" class="form-control" onchange = "checksubmit()" placeholder="" name="apikey" type="text" value="{{ $apikey }}">
                                            
                                        </div>

                                        @if($errors->has('apikey'))
	                                        <span class="help-block">
	                                            <strong>{{ $errors->first('apikey') }}</strong>
	                                        </span>
                                    	@endif
			                                         
				                </div>
				            </div>
				             <div class="col-md-6 col-sm-6 col-xs-12 margin-center">
				                			                
				                    <div class="row price margin-top-0 margin-bottom-10">
				                        <div class="padding-right-10 padding-top-20">
				                            <h5 class="float-left">Secret*</h5>
				                        </div>

				                        <div class="input-group">
                                            <input id="secret" onchange = "checksubmit()" class="form-control" placeholder="" name="secret" type="text" value="{{ $secret }}">
                                            
                                        </div>
                                         @if($errors->has('secret'))
	                                        <span class="help-block">
	                                            <strong>{{ $errors->first('secret') }}</strong>
	                                        </span>
                                    	@endif
                                       
				                    </div>                       
				                
				            </div>
				            <div class="row margin-center">
				                  <input type="submit" id="save_configuration" class="btn-custom btn-custom-main font-size-20 margin-top-30 margin-bottom-10 margin-left-per-36" value="Save Configuration">
				            </div>

				        </form>
					</div>
				</div>
			</div>
		</div>
	</div>

@endsection

@section('footer_scripts')
    <script type="text/javascript">
        
        function checksubmit() {
			
            var domain = $("#domain").val();
        	var token = $("#token").val();
        	var apikey = $("#apikey").val();
        	var secret = $("#secret").val();
        	var submitConfigure = $('#save_configuration');

        	if (domain == "" || token == "" || apikey == ""|| secret == ""){
        		alert("Please insert correct value");
        		submitConfigure.attr('disabled', true);
        	}
        	else
        		submitConfigure.attr('disabled', false);
        }
    </script>
@endsection
