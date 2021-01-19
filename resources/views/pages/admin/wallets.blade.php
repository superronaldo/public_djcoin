@extends('layouts.app')

@section('template_title')
    {!! trans('usersmanagement.showing-all-users') !!}
@endsection

@section('template_linked_css')
    @if(config('usersmanagement.enabledDatatablesJs'))
        <link rel="stylesheet" type="text/css" href="{{ config('usersmanagement.datatablesCssCDN') }}">
    @endif
    
    
    <style type="text/css" media="screen">
        .users-table {
            border: 0;
        }
        .users-table tr td:first-child {
            padding-left: 15px;
        }
        .users-table tr td:last-child {
            padding-right: 15px;
        }
        .users-table.table-responsive,
        .users-table.table-responsive table {
            margin-bottom: 0;
        }
    </style>
@endsection

@section('content')
<link rel="stylesheet" href="{{ URL::asset('css/plugins/datatables/datatables.bundle.css') }}">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                Free Wallets
            </div>
            <div class="col-lg-12 margin-top-30">
                <div class="row">
                    <div class="col-sm-12">
                      <table id="free_wallet" class="table table-striped table-bordered" style="width:100%">
                          <thead>
                              <tr style="text-align: center;">
                                  <th>No</th>
                                  <th>Wallet Address</th>
                                  <th>DJC Amount</th>    
                                  <th>Txid</th>    
                                  <th>Wallet Type</th>    
                                  <th>Created At</th>
                              </tr>
                          </thead>
                          <tbody>
                            <?php $i = 1; ?>

                            @if($wallet)
                              @foreach($wallet as $value)
                                <tr style="text-align: center;">
                                  <td>{{ $i++ }}</td>
                                  <td style="overflow-wrap:anywhere; max-width: 300px;">{{$value->wallet_address}}</td>
                                  
                                  <td style="overflow-wrap:anywhere; max-width: 300px;">{{$value->amount}}</td>
                                  <td style="overflow-wrap:anywhere; max-width: 300px;">{{$value->txid}}</td>
                                  <td>
                                        @if ($value->status == 0)
                                            <?php $badgeClass = 'primary'; 
                                                    $text = 'Free';
                                            ?>
        
                                        @elseif ($value->status == 1)
                                            <?php $badgeClass = 'warning'; 
                                                    $text = 'Paid';
                                            ?>
                                            
                                        @endif
                                        <span class="badge badge-{{$badgeClass}}">{{ $text }}</span>
                                    
                                </td>
                                  
                                <td >{{$value->created_at}}</td>
                                

                              @endforeach
                            @endif
                                
                          </tbody>
                          <!-- <tfoot>
                                <tr>
                                    <th>Record</th>
                                    <th>Contents</th>
                                    <th>Date</th>
                                </tr>
                          </tfoot> -->
                      </table>
                    </div>
                </div>
                <div class="row">
                  <div class="col-md-3"></div>
                  <div class="row col-md-8 margin-bottom-40 padding-left-90">
                    <p class=" padding-right-15 margin-bottom-0">Total Amount</p>
                    <input type="number" id="total_amount" class="width-per-10" disabled>
                  </div>
                </div>
            </div>
        </div>
          
    </div>
        
@endsection

@section('footer_scripts')
    <script src="{{ URL::asset('plugins/jquery/dist/jquery.min.js') }}"></script>

    <script src="{{ URL::asset('js/plugins/plugin_datatable.js') }}"></script>

    <script type="text/javascript">

    $(document).ready(function() {
      var table = $('#free_wallet').DataTable({
        "footerCallback": function (row, data, start, end, display) {                

          var totalAmount = 0;
          for (var i = 0; i < data.length; i++) {
              totalAmount += parseFloat(data[i][2]);
          }
          
          $('#total_amount').val(totalAmount.toFixed(2));
        }
      });
    });

</script> 
@endsection



