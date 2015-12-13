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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
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
              <div class="form-group">
                <label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_vendor; ?></label>
                <select name="filter_store" id="input-order-status" class="form-control">
                  <option value="*"></option>                 
                  <?php foreach ($stores as $stores_1) { ?>
                  <?php if ($stores_1['store_id'] == $filter_store) { ?>
                  <option value="<?php echo $stores_1['store_id']; ?>" selected="selected"><?php echo ucfirst($stores_1['name']); ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $stores_1['store_id']; ?>"><?php echo ucfirst($stores_1['name']); ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
	      <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_condition; ?></label>
                <select name="filter_purchase_condition"  class="form-control">
                  <option value="1" <?php if($filter_purchase_condition == 1){ echo 'selected';}?> ><?php echo $entry_purchased_date; ?></option>
                  <option value="2" <?php if($filter_purchase_condition == 2){ echo 'selected';}?> ><?php echo $entry_created_date; ?></option>		 
                </select>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
 <?php if ($products) { ?>
	<div class="row">
		<div class="col-sm-6 text-left"><h4><?php echo $text_show; ?>
			<?php foreach ($stores as $stores_2) { 
				if ($stores_2['store_id'] == $filter_store) { 
					echo ucfirst($stores_2['name']); 
				} 
			} ?></h4>
		</div>
	</div>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_model; ?></td>
		<td class="text-left"><?php echo $column_available; ?></td>
		<td class="text-left"><?php echo $column_views; ?></td>
		<td class="text-left"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_quantity; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($products) { ?>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-left"><?php echo $product['name']; ?></td>
                <td class="text-left"><?php echo $product['model']; ?></td>
		<td class="text-left"><?php echo $product['stock']; ?></td>		
		<td class="text-left"><?php echo $product['viewed']; ?></td>
		<td class="text-left"><?php echo $product['price']; ?></td>
                <td class="text-right"><?php if(isset($product['quantity'])){ echo $product['quantity']; }else{ echo '0';} ?></td>
                <td class="text-right"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
<?php }else{?>
	<div class="col-sm-6 text-right"><?php echo $text_no_list; ?></div>
<?php } ?>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=report/vendorwise_product&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
	
	var filter_purchase_condition = $('select[name=\'filter_purchase_condition\']').val();
	
	if (filter_purchase_condition != 0) {
		url += '&filter_purchase_condition=' + encodeURIComponent(filter_purchase_condition);
	}

	var filter_store = $('select[name=\'filter_store\']').val();

	if (filter_store != '*') {
		url += '&filter_store=' + encodeURIComponent(filter_store);
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
