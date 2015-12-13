<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">

<?php 
foreach($plans as $plan){ ?>
<p><?php echo 'Plan Name : '.$plan['plan_name']; ?></p>
<p><?php echo 'Plan Amount : '.$plan['plan_amount']; ?></p>

<?php } ?>



<form action="https://sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="oskrishnamurthy-facilitator@gmail.com">
<input type="hidden" name="lc" value="US">
<input type="hidden" name="item_name" value="<?php echo $plan_name; ?>">
<input type="hidden" name="custom" value="<?php echo $plan_merchant_id; ?>">
<input type="hidden" name="amount" value="<?php echo $plan_amount; ?>">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="button_subtype" value="services">
<input type="hidden" name="no_note" value="0">
<input type="hidden" name="cn" value="Add special instructions to the seller:">
<input type="hidden" name="no_shipping" value="2">
<input type="hidden" name="rm" value="1">
<input type="hidden" name="return" value="<?php echo $return_method; ?>">
<input type="hidden" name="cancel_return"     value="<?php echo $cancel_return; ?>">
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
<input type="hidden" name="notify_url" value="http://deydi.100myspacelayouts.com/index.php?route=account/login/ipn">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif"     border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">

</form>

</div><!--#content-->

<?php echo $footer; ?> 




