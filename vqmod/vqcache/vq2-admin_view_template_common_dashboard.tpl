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

				<?php if ($json) { ?>
				<div class="alert alert-info">
					<ul style="margin:0px; padding: 0px;">
					<?php foreach ($json as $value) { ?>
						<li style="margin: 0px 20px;"><?php echo $value['title']; ?></li>
					<?php }	?>
					</ul>
				</div>
				<?php } ?>
			
    <?php if ($error_install) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_install; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="row">
      <div class="col-lg-2"><?php echo $product; ?></div>
      <div class="col-lg-2"><?php echo $vendor; ?></div>			
      <div class="col-lg-2"><?php echo $order; ?></div>
      <div class="col-lg-2"><?php echo $sale; ?></div>
      <div class="col-lg-2"><?php echo $debit; ?></div>
      <div class="col-lg-2"><?php echo $commission; ?></div>	      	
      <div class="col-lg-2"><?php echo $customer; ?></div>
      <div class="col-lg-2"><?php echo $coupon; ?></div>
      <div class="col-lg-2"><?php echo $return; ?></div> 
       <div class="col-lg-2"><?php echo $brand; ?></div>
      <div class="col-lg-2"><?php echo $online; ?></div>                      
      <div class="col-lg-2"><?php echo $tickets; ?></div>
      						
    </div>
	<div class="row">
     	 <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php  echo $order_by_status; ?></div>
      	<div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $chart; ?></div>
    	</div>
    <div class="row">
          <div class="col-lg-12"><?php echo $transaction; ?></div>
    </div>

	<div class="row">      
      <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $map; ?></div>
      <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $rate; ?></div>	
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-12 col-sm-12 col-sx-12"><?php echo $activity; ?></div>
      <div class="col-lg-8 col-md-12 col-sm-12 col-sx-12"> <?php echo $recent; ?> </div>
    </div>
	<div class="row">
         <div class="col-lg-4 col-md-12 col-sm-12 col-sx-12"><?php echo $best_seller; ?></div>
         <div class="col-lg-4 col-md-12 col-sm-12 col-sx-12"><?php echo $most_purchased; ?></div>
	<div class="col-lg-4 col-md-12 col-sm-12 col-sx-12"><?php echo $most_viewed; ?></div>
    </div>
  </div>
</div>

<?php echo $footer; ?>
