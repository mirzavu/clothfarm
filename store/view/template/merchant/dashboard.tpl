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
      <a href="<?= $quick_product?>"><button style="background-color: #2D902D;" type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa  fa-lg fa-bolt"></i>  QUICK ADD A PRODUCT</button></a>
     
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_install) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_install; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="row">
       <div class="col-lg-2"><?php echo $product; ?></div>	
      <div class="col-lg-2"><?php echo $order; ?></div>
      <div class="col-lg-2"><?php echo $sale; ?></div>     
      <div class="col-lg-2"><?php echo $customer; ?></div>
      <div class="col-lg-2"><?php echo $coupon; ?></div>
      <div class="col-lg-2"><?php echo $return; ?></div>   
				
    </div>
    <div class="row">
          <div class="col-lg-12"><?php echo $transaction; ?></div>
    </div>
    <div class="row">
      <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $statistics; ?></div>
      <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $map; ?></div>
    </div>
<div class="row">
      <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $recent; ?></div>
      <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $order_by_status; ?></div>
    </div>	
   
  </div>
</div>
<?php echo $footer; ?>
