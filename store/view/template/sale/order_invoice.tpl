<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>
<body>
<div class="container">
  <?php foreach ($orders as $order) { ?>
  <div style="page-break-after: always;">
    <h1><?php echo $text_invoice; ?> #<?php echo $order['order_id']; ?></h1>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td colspan="2"><?php echo $text_order_detail; ?></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="width: 50%;"><address>
            <strong><?php echo $order['store_name']; ?></strong><br />
            <?php echo $order['store_address']; ?>
            </address>
            <b><?php echo $text_telephone; ?></b> <?php echo $order['store_telephone']; ?><br />
            <?php if ($order['store_fax']) { ?>
            <b><?php echo $text_fax; ?></b> <?php echo $order['store_fax']; ?><br />
            <?php } ?>
            <b><?php echo $text_email; ?></b> <?php echo $order['store_email']; ?><br />
            <b><?php echo $text_website; ?></b> <a href="<?php echo $order['store_url']; ?>"><?php echo $order['store_url']; ?></a></td>
          <td style="width: 50%;"><b><?php echo $text_date_added; ?></b> <?php echo $order['date_added']; ?><br />
            <?php if ($order['invoice_no']) { ?>
            <b><?php echo $text_invoice_no; ?></b> <?php echo $order['invoice_no']; ?><br />
            <?php } ?>
            <b><?php echo $text_order_id; ?></b> <?php echo $order['order_id']; ?><br />
            <b><?php echo $text_payment_method; ?></b> <?php echo $order['payment_method']; ?><br />
            <?php if ($order['shipping_method']) { ?>
            <b><?php echo $text_shipping_method; ?></b> <?php echo $order['shipping_method']; ?><br />
            <?php } ?></td>
        </tr>
      </tbody>
    </table>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td style="width: 50%;"><b><?php echo $text_to; ?></b></td>
          <td style="width: 50%;"><b><?php echo $text_ship_to; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><address>
            <?php echo $order['payment_address']; ?>
            </address></td>
          <td><address>
            <?php echo $order['shipping_address']; ?>
            </address></td>
        </tr>
      </tbody>
    </table>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><b><?php echo $column_product; ?></b></td>
          <td><b><?php echo $column_model; ?></b></td>
          <td class="text-right"><b><?php echo $column_quantity; ?></b></td>
          <td class="text-right"><b><?php echo $column_price; ?></b></td>
	 <td class="text-right"><b><?php echo $column_shipping; ?></b></td>
          <td class="text-right"><b><?php echo $column_total; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <?php 
	$sumProduct = array();	
	$sumProductShipping = array(0);
	if(count($order['product'])>0){	
	foreach ($order['product_wise_shipping'] as $product_shipping) {  
			$sumProductShipping[] = $product_shipping['product_shipping'];
		}
	$total_shipping = array_sum($sumProductShipping); 
	foreach ($order['product'] as $product) {  
		$sumProduct[] = $product['new_total']; 
	?>
        <tr>
          <td><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <td><?php echo $product['model']; ?></td>
          <td class="text-right"><?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['price']; ?></td>
	<td class="text-right"><?php echo $product['shipping']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($order['voucher'] as $voucher) { ?>
        <tr>
          <td><?php echo $voucher['description']; ?></td>
          <td></td>
          <td class="text-right">1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
        </tr>
        <?php } ?>
	<?php 
		$modifiedsubtotal = array_sum($sumProduct);
		$sumTotal = array($modifiedsubtotal);			
		foreach ($order['total'] as $totall) { 
			if( ($totall['title'] != 'Sub-Total') && ($totall['title'] != 'Total') ) {
				$sumTotal[] = $totall['new_text'];			
			}
		 }
//echo "sum(a) = " . $totall['total_currency_left']. array_sum($sumTotal) . $totals['total_currency_right']. "\n";exit; ?>
        <?php foreach ($order['total'] as $totals) { ?>
        
	 <?php if( $totals['title'] == 'Sub-Total' ) {?>
				<tr>
				  <td colspan="5" class="text-right"><?php echo $totals['title']; ?>:</td>
			          <td class="text-right"><?php echo $product['new_currency_left']. array_sum($sumProduct) . $product['new_currency_right']; ?></td></tr>
			 <?php }elseif( $totals['title'] == 'Total' ) {

					foreach($order['product'] as $products_1){ if(isset($order['taxes_product'])){
					foreach ($order['taxes_product'] as $taxes_product_1) {					
					if($products_1['product_id'] == $taxes_product_1['product_id_1']) {
					$sumTotal[] = $taxes_product_1['new_text_1']; 
				?>
				<tr><td colspan="5" class="text-right"><?php echo $taxes_product_1['title_1']; ?>:</td>
				<td class="text-right"><?php echo $taxes_product_1['text_1']; ?></td></tr>
				<?php }}}} ?>
				<?php array_push($sumTotal,$total_shipping);?>
				 <tr><td colspan="5" class="text-right"><?php echo 'Shipping' ?>:</td>
			          <td class="text-right"><?php echo $totals['total_currency_left']. $total_shipping  . $totals['total_currency_right']; ?></td></tr>
				  <tr><td colspan="5" class="text-right"><?php echo $totals['title']; ?>:</td>
			          <td class="text-right"><?php echo $totals['total_currency_left']. array_sum($sumTotal) . $totals['total_currency_right']; ?></td></tr>
			<?php }elseif( $totals['code'] == 'tax' || $totals['code'] == 'coupon' ) {  
			 }else{ ?>
			<tr><td colspan="5" class="text-right"><?php //echo $totals['title']; ?>:</td>
		          <td class="text-right"><?php //echo $totals['text']; ?></td></tr>
			<?php } ?>



        <?php } }?>
      </tbody>
    </table>
    <?php if ($order['comment']) { ?>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><b><?php echo $column_comment; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><?php echo $order['comment']; ?></td>
        </tr>
      </tbody>
    </table>
    <?php } ?>
  </div>
  <?php } ?>
</div>
</body>
</html>
