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
    <div class="container-fluid margin-bottom-100">
        <div class="card">
            <div class="card-header">
                Free Wallets
            </div>
            <div class="col-lg-12 margin-top-30">
                <div class="row">
                    <div class="col-sm-12">
                      <table id="total_history" class="table table-striped table-bordered" style="width:100%">
                          <thead>
                            <tr style="text-align: center;">
                                <th>No</th>
                                <th>Hash</th>
                                <th>Block</th>
                                <th>Created At</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Status</th>
                                <th>Result</th>
                                <th>Amount</th>
                                <th>Tokens</th>
                            </tr>
                          </thead>
                          <tbody>
                          <?php $i = 1; ?>

                          @if($history)
                            @foreach($history as $value)

                            <tr style="text-align: center;">
                              <td>{{ $i++ }}</td>
                              <td style="overflow-wrap:anywhere; max-width: 300px;">{{ $value->transactionHash }}</td> 
                              <td >{{ $value->block }}</td>
                                <?php $date = new DateTime(); $date->setTimestamp($value->timestamp/1000); ?>
                              <td >{{ $date->format('Y-m-d') }}</td>
                              <td style="overflow-wrap:anywhere; max-width: 300px;">{{ $value->transferFromAddress }}</td>
                              <td style="overflow-wrap:anywhere; max-width: 300px;">{{ $value->transferToAddress }}</td>
                              <td >{{ $value->confirmed }}</td> 
                              <td >{{ $value->contractRet }}</td>
                              <td style="overflow-wrap:anywhere; max-width: 300px;">{{ $value->amount }}</td>
                              <td>{{ $value->tokenInfo->tokenAbbr }}</td>
                            </tr>

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
            </div>
        </div>
          
    </div>
        
@endsection

@section('footer_scripts')
    <script src="{{ URL::asset('plugins/jquery/dist/jquery.min.js') }}"></script>

    <script src="{{ URL::asset('js/plugins/plugin_datatable.js') }}"></script>

    <script type="text/javascript">

    $(document).ready(function() {
          $('#total_history').DataTable();
    } );

</script> 
@endsection


