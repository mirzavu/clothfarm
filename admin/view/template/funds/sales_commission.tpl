<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="breadcrumbox">
	<ul class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } ?>
	 </ul>	
    </div>
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      
    </div>
  </div>
  <div class="container-fluid">
 <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-store"><?php echo $entry_store; ?></label>
                <input type="text" name="filter_store" value="<?php echo $filter_store; ?>" placeholder="<?php echo $entry_store; ?>" id="input-store" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
               	<label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
               
              </div>
              <div class="form-group">
                	<label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
               
                <td class="text-left"><?php echo $column_vendor; ?></td>
                              
                <td class="text-left"><?php echo $column_status; ?></td>
		<td class="text-left"><?php echo $column_commission; ?></td>
		 <td class="text-left"><?php echo $column_orders; ?></td>		
                <td class="text-right"><?php echo $column_total; ?></td>
		<td class="text-right"><?php echo $column_refund; ?></td>
		 <td class="text-right"><?php echo $column_dispute; ?></td>
		 <td class="text-right"><?php echo $column_site_earnings; ?></td>
		<td class="text-right"><?php echo $column_vendor_earnings; ?></td>
		 <td class="text-right"><?php echo $column_paid; ?></td>
		 <td class="text-right"><?php echo $column_balance; ?></td>
		 <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($site_commissions) { ?>
              <?php foreach ($site_commissions as $site_commission) { ?>
              <tr>

                <td class="text-left"><?php echo $site_commission['store']; ?></br><?php echo $site_commission['email']; ?></br><?php echo $site_commission['vendor']; ?></td>
                <td class="text-left"><?php echo $site_commission['status']; ?></td>
		<td class="text-left"><?php echo $site_commission['commission']."%"; ?></td>
		<td class="text-left"><?php echo $site_commission['orders']; ?></td>
                <td class="text-right"><?php echo $site_commission['total']; ?></td>
		<td class="text-right"><?php echo $site_commission['refund']; ?></td>	
		<td class="text-right"><?php echo $site_commission['dispute']; ?></td>
		<td class="text-right"><?php echo $site_commission['site_earnings']; ?></td>
		<td class="text-right"><?php echo $site_commission['vendor_earnings']; ?></td>
		<td class="text-right"><?php echo $site_commission['paid']; ?></td>
		<td class="text-right" style="color:<?php echo $site_commission['color']; ?>"><?php echo $site_commission['balance']; ?></td>
		<td class="text-right">
		<?php if ($site_commission['is_balance']){ ?>
			<a href="<?php echo $site_commission['href'];?>" ><button id="button-pay" class="btn btn-primary pull-right" type="button">Pay Now</button></a>
		<?php } ?>
		</td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="14"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=funds/sales_commission&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}	

	var filter_store = $('input[name=\'filter_store\']').val();
	
	if (filter_store) {
		url += '&filter_store=' + encodeURIComponent(filter_store);
	}
	
	var filter_email = $('input[name=\'filter_email\']').val();
	
	if (filter_email) {
		url += '&filter_email=' + encodeURIComponent(filter_email);
	}		

	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>
<?php echo $footer; ?>