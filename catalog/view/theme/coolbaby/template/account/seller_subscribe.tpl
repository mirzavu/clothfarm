<?php echo $header; ?>
<div class="container">
<form action="https://sandbox.paypal.com/cgi-bin/webscr" id="aweberform" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="<?php echo $merchant_paypal; ?>">
<input type="hidden" name="lc" value="US">
<input type="hidden" name="item_name" value="<?php echo $plan_name; ?>">
<input type="hidden" name="custom" value="<?php echo $custom; ?>">
<input type="hidden" name="amount" value="<?php echo $plan_amount; ?>">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="button_subtype" value="services">
<input type="hidden" name="no_note" value="0">
<input type="hidden" name="cn" value="Add special instructions to the seller:">
<input type="hidden" name="no_shipping" value="2">
<input type="hidden" name="rm" value="1">
<input type="hidden" name="return" value="<?php echo $return_url; ?>">
<input type="hidden" name="cancel_return"     value="">
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
<input type="hidden" name="notify_url" value="<?php echo $notify_url; ?>">
<input type="image" src="http://one/fayas/image/724.gif"     border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">

</form>
</div>


<?php echo $footer; ?>
<script>
$(function(){


$('#aweberform').submit();

});
</script>