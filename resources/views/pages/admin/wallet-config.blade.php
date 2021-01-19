@extends('layouts.app')

@section('template_title')
	Routing Information
@endsection

@section('content')
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="card">
					<div class="card-header">
						Free Wallet Setting
					</div>
					<div class="card-body">
						<form  class="form" method="post" action="{{ route('set_wallet_setting') }}">
				            @csrf
				            <div class="col-md-6 col-sm-6 col-xs-12 margin-center">
			                    <div class="row">
			                        <div class="padding-right-10 padding-top-20 ">
			                        	<h5 class="float-left">Number of wallets a day</h5>
			                        </div>

			                        <div class="input-group">
                                        <input type="number" class="form-control" min="1" max="100" step="1" name="wallet-create" id="wallet-create" value="{{ $wallet_create }}" required>
                                    </div>

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
			                        	<h5 class="float-left">Amount of DJC to be bought every day</h5>        
			                        </div>

			                        <div class="input-group">
                                       <input type="number" class="form-control" min="1" max="" step="1" name="djc-bought" id="djc-bought" value="{{ $djc_bought }}" required>
                                    </div>
                                    
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
			                        	<h5 class="float-left">Amount of DJC to be transferred between free wallets a day</h5>
			                        </div>

			                        <div class="input-group">
                                       <input type="number" class="form-control" min="1" max="" step="1" name="djc-transfer" id="djc-transfer" value="{{ $djc_transfer }}" required>
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
			                            <h5 class="float-left">Amount of DJC to be returned to master wallet a day</h5>
			                        </div>

			                        <div class="input-group">
                                       <input type="number" class="form-control" min="1" max="" step="1" name="djc-return" id="djc-return" value="{{ $djc_return }}" required>        
                                    </div>

                                    @if($errors->has('secret'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('secret') }}</strong>
                                        </span>
                                	@endif
			                    </div>                       
				            </div>

				            <div class="col-md-6 col-sm-6 col-xs-12 margin-center">
			                    <div class="row price margin-top-0 margin-bottom-10">
			                        <div class="padding-right-10 padding-top-20">
			                            <h5 class="float-left">Amount of free wallets to be closed a day</h5>
			                        </div>

			                        <div class="input-group">
                                        <input type="number" class="form-control" min="1" max="100" step="1" name="wallet-close" id="wallet-close" value="{{ $wallet_close }}" required>        
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
<script>
	$(document).ready(function(){

		$('#djc-transfer').change(function(){

			var boughtVal = $('#djc-bought').val();

			if(!boughtVal)
				alert("Please insert the amount of DJC to be bought every day first!");

			var trasnferVal = $('#djc-transfer').val();

			if(trasnferVal >= boughtVal)
				$('#djc-transfer').attr({
					"max" : boughtVal
				});
		});

		$('#djc-return').change(function(){

			var boughtVal = $('#djc-bought').val();

			if(!boughtVal)
				alert("Please insert the amount of DJC to be bought every day first!");

			var returnVal = $('#djc-return').val();

			if(returnVal >= boughtVal)
				$('#djc-return').attr({
					"max" : boughtVal
				});
		});

		$('#wallet-close').change(function(){

			var walletCreate = $('#wallet-create').val();

			if(!walletCreate)
				alert("Please insert the number of wallets a day first!");

			var walletClose = $('#wallet-close').val();

			if(walletClose >= walletCreate)
				$('#wallet-close').attr({
					"max" : walletCreate
				});
		});
	});
</script>
@endsection