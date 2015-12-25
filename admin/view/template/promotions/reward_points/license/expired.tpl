<?php echo $header; ?>
	<div id="content">
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
</div>
		<?php if ($warning_extended) { ?>
			<div class="warning"><?php echo $warning_extended; ?></div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
			<?php $session->data['success'] = ''?>
		<?php } ?>
		<div class="box">
<div class="heading">
    <h1><img src="view/image/setting.png" alt="" /> <?php echo $heading_title; ?></h1>
</div>
<div class="content">

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	<input name="earn_point_sort_order" type="hidden" value="<?php echo $earn_point_sort_order?>"/>
	<input name="redeem_point_sort_order" type="hidden" value="<?php echo $redeem_point_sort_order?>" />
	<input name="earn_point_status" type="hidden" value="<?php echo $earn_point_status?>"/>
	<input name="redeem_point_status" type="hidden" value="<?php echo $redeem_point_status?>" />
	<div id="tab-general">
	    <table class="form">
	        <tr>
	            <td colspan="2">
		            <?php if($day_remaining <=0 || $day_remaining <= 30){?>
			            <?php echo $error_warning?> Please
			            <a href="http://www.opcartstore.com/active" target="_blank" style="color: #E8710C">Active for Live</a>
			            <?php if(!empty($is_expired)){?>
				            or you can <a href="index.php?route=promotions/reward_points/extend&token=<?php echo $token?>" style="color: #E8710C">Extend trial</a> in 7 days
			            <?php }?>
		            <?php }else{?>
			            <?php echo $error_warning?>
		            <?php }?>
	            </td>
	        </tr>
	    </table>
	</div>
</form>
</div>
</div>
</div>

<script type="text/javascript">
<!--
//-->
</script>
<?php echo $footer; ?>