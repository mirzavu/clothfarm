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
      <div class="pull-right">
      </div>
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
	<div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
               	<label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
               
              </div>
             
            </div>
            <div class="col-sm-6">
              
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








        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-debits">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>                 
                  <td class="text-left"><?php echo $column_debit; ?></td>
                  <td class="text-left"><?php echo $column_dispute; ?></td>
                  <td class="text-left"><?php echo $column_name; ?></td>
		  <td class="text-left"><?php echo $column_email; ?></td>
		  <td class="text-left"><?php echo $column_reason; ?></td>
		  <td class="text-left"><?php echo $column_date_added; ?></td>	
		   <td class="text-left"><?php echo $column_reflects; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($debits) { ?>
                <?php foreach ($debits as $debit) { ?>
                <tr>                  
                  <td class="text-left"><?php echo $debit['debit']; ?></td>
                  <td class="text-left"><?php echo $debit['dispute']; ?></td>
		  <td class="text-left"><?php echo $debit['store']; ?></td>
		 <td class="text-left"><?php echo $debit['email']; ?></td>	
		   <td class="text-left"><?php echo $debit['reason']; ?></td> 
		  <td class="text-left"><?php echo $debit['date_added']; ?></td>
		  <td class="text-left"><?php echo $debit['type']; ?></td>		 	
                 
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
 <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=funds/vendor_payment/debits&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}	

	var filter_store = $('select[name=\'filter_store\']').val();

	if (filter_store != '*') {
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
//--></script>


</div>
<?php echo $footer; ?>
