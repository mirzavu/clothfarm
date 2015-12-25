<?php
    global $config, $loader, $registry;
    $lang = $config->get('config_language_id');
    $store_id = $config->get('config_store_id');

    $customisation_general = $config->get('customisation_general_store');

?>
<!-- Subscribe -->
<div class="subscribe_wrapper">
    <?php if (!isset($customisation_general["newsletter_status"][$store_id]) || $customisation_general["newsletter_status"][$store_id] != 0) : ?>
    <section class="content container">
        <div class="subscribe">
            <div class="row collapsed-block">
                <?php
            $your_apikey = $customisation_general["apikey"][$store_id];
            $my_list_unique_id = $customisation_general["list_unique_id"][$store_id];

            if (isset($customisation_general["apikey"][$store_id]) && isset($customisation_general["list_unique_id"][$store_id]) && $customisation_general["apikey"][$store_id] != '' && $customisation_general["list_unique_id"][$store_id] != '') {
        ?>

                <?php if (!isset($customisation_general[$lang]["newsletter_title"][$store_id])) { ?>
                <div class="col-sm-12 col-md-3 col-lg-3">
                    <h3>NEWSLETTER SIGNUP <a class="expander visible-sm visible-xs" href="#TabBlock-1">+</a></h3>
                </div>
                <?php } else { ?>
                <?php if ($customisation_general[$lang]["newsletter_title"][$store_id] != ''): ?>
                <div class="col-sm-12 col-md-3 col-lg-3">
                    <h3><?php echo $customisation_general[$lang]["newsletter_title"][$store_id]; ?> <a class="expander visible-sm visible-xs" href="#TabBlock-1">+</a></h3>
                </div>
                <?php endif; ?>
                <?php } ?>

                <div class="col-sm-12 col-md-9 col-lg-9 tabBlock" id="TabBlock-1">
                    <?php $newsletter_placeholder = (isset($customisation_general[$lang]["newsletter_placeholder"][$store_id]) ? $customisation_general[$lang]["newsletter_placeholder"][$store_id] : 'Your E-mail...'); ?>

                    <form class="form-inline" id="signup" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get">
                        <div class="row">
                            <div class="col-sm-5 col-md-5">
                                <input name="email" id="email" type="text" class="form-control pull-right"
                                       value="<?php echo $newsletter_placeholder; ?>"
                                       onblur="if (this.value == '') {this.value = '<?php echo $newsletter_placeholder; ?>';}"
                                       onfocus="if(this.value == '<?php echo $newsletter_placeholder; ?>') {this.value = '';}">
                                <input name="apikey" id="apikey" type="hidden" class="form-control" value="<?php echo $your_apikey; ?>" >
                                <input name="listid" id="listid" type="hidden" class="form-control" value="<?php echo $my_list_unique_id; ?>" >
                                <span id="response"></span>
                                <div class="divider divider-sm visible-xs"></div>
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <button name="submit" type="submit" class="button btn-cool"><span class="icon flaticon-new78"></span>
                                    <?php echo (isset($customisation_general[$lang]["newsletter_button"][$store_id]) ? $customisation_general[$lang]["newsletter_button"][$store_id] : 'subscribe'); ?>
                                </button>
                                <div class="divider divider-sm visible-xs"></div>
                            </div>
                            <div class="col-sm-5  col-md-4">
                                <?php if (!isset($customisation_general[$lang]["newsletter_promo"][$store_id])) { ?>
                                <p>Enter your email and we'll send you a coupon with 10% off your next order.</p>
                                <?php } else { ?>
                                <?php if ($customisation_general[$lang]["newsletter_promo"][$store_id] != ''): ?>
                                <p><?php echo $customisation_general[$lang]["newsletter_promo"][$store_id]; ?></p>
                                <?php endif; ?>
                                <?php } ?>
                            </div>
                        </div>
                    </form>



                </div>
                <?php } else { ?>
                <h3 class="mailchimp_error">Enter API key and List ID for your Mailchimp account!</h3>
                <?php } ?>
            </div>
        </div>
    </section>
<?php endif; ?>
</div>

<!-- //end Subscribe -->


<!-- Footer -->
<footer>
    <div id="footer-collapsed" class="<?php echo (isset($customisation_general["footer_type"][$store_id]) && $customisation_general["footer_type"][$store_id] == 2 ? 'no-popup' : 'yes-popup'); ?>">

        <?php if (!isset($customisation_general["footerpopup"][$store_id]) || $customisation_general["footerpopup"][$store_id] != 0) : ?>
        <div class="footer-navbar">
                    <div class="container">
                        <div class="arrow link hidden-xs hidden-sm"><i class="icon flaticon-down14"></i></div>
                        <?php if ($informations) : ?>
                        <div class="collapsed-block">
                            <div class="inside">
                                <h3><span class="link"><?php echo $text_information; ?></span><a class="expander visible-sm visible-xs" href="#TabBlock-2">+</a></h3>
                                <div class="tabBlock" id="TabBlock-2">
                                    <ul class="menu">
                                        <?php foreach ($informations as $information) : ?>
                                            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                                        <?php endforeach; ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>

                        <div class="collapsed-block">
                            <div class="inside">
                                <h3><span class="link"><?php echo $text_service; ?></span><a class="expander visible-sm visible-xs" href="#TabBlock-3">+</a></h3>
                                <div class="tabBlock" id="TabBlock-3">
                                    <ul class="menu">
                                        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                                        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                                        <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                                        <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>

				<?php if(isset($simple_blog_found)) { ?>
					<li><a href="<?php echo $simple_blog; ?>" target="_blank"><?php echo $simple_blog_footer_heading; ?></a></li>
				<?php } ?>
			

                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="collapsed-block">
                            <div class="inside">
                                <h3><span class="link"><?php echo $text_account; ?></span><a class="expander visible-sm visible-xs" href="#TabBlock-4">+</a></h3>
                                <div class="tabBlock" id="TabBlock-4">
                                    <ul class="menu">
                                        <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                                        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
					<li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
			
					<li><a href="<?php echo $seller; ?>"><?php echo $text_seller; ?></a></li>
					<?php if ($customerLogged == 2) { ?>

					<li><a href="<?php echo $seller_signup; ?>"><?php echo $text_seller_signup; ?></a></li>		

					<?php } ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <?php if (isset($customisation_general["socials_status"][$store_id]) && $customisation_general["socials_status"][$store_id] != 0) : ?>
                        <div class="collapsed-block">
                            <div class="inside">
                                <?php if (isset($customisation_general[$lang]["footer_socials_title"][$store_id]) && $customisation_general[$lang]["footer_socials_title"][$store_id] != '') : ?>
                                <h3><span class="link"><?php echo $customisation_general[$lang]["footer_socials_title"][$store_id]; ?></span><a class="expander visible-sm visible-xs" href="#TabBlock-5">+</a></h3>
                                <?php endif; ?>
                                <div class="tabBlock" id="TabBlock-5">
                                    <ul class="socials socials-lg">
                                        <?php echo (isset($customisation_general["socials"][$store_id]) && is_string($customisation_general["socials"][$store_id]) ? html_entity_decode($customisation_general["socials"][$store_id], ENT_QUOTES, 'UTF-8') : ''); ?>
                                    </ul>
                                    <div class="divider divider-sm visible-xs visible-sm"></div>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>

                        <?php if (isset($customisation_general["customblock_status"][$store_id]) && $customisation_general["customblock_status"][$store_id] != 0 && isset($customisation_general[$lang]["customblock_html"][$store_id]) && $customisation_general[$lang]["customblock_html"][$store_id] != '') : ?>
                        <div class="collapsed-block">
                            <div class="inside">
                                <?php if (isset($customisation_general[$lang]["custom_html_title"][$store_id]) && $customisation_general[$lang]["custom_html_title"][$store_id] != '') : ?>
                                <h3>
                                    <span class="link">
                                        <?php echo $customisation_general[$lang]["custom_html_title"][$store_id]; ?>
                                    </span>
                                    <a class="expander visible-sm visible-xs" href="#TabBlock-6">+</a>
                                </h3>
                                <?php endif; ?>

                                <div class="tabBlock" id="TabBlock-6">
                                     <?php echo (isset($customisation_general[$lang]["customblock_html"][$store_id]) && is_string($customisation_general[$lang]["customblock_html"][$store_id]) ? html_entity_decode($customisation_general[$lang]["customblock_html"][$store_id], ENT_QUOTES, 'UTF-8') : ''); ?>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>

                    </div>
                </div>
        <?php endif; ?>
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 copyright">
                        <?php echo (isset($customisation_general["footercopyright"][$store_id]) && is_string($customisation_general["footercopyright"][$store_id]) ? html_entity_decode($customisation_general["footercopyright"][$store_id], ENT_QUOTES, 'UTF-8') : $powered); ?>
                    </div>
                    <?php if (isset($customisation_general["footerpayment_status"][$store_id]) && $customisation_general["footerpayment_status"][$store_id] != 0) : ?>
                        <div class="col-md-4">
                            <ul class="payment-list pull-right">
                                <?php
                                    if (isset($customisation_general["footerpayment"][$store_id]) && $customisation_general["footerpayment"][$store_id] != '' && is_string($customisation_general["footerpayment"][$store_id])) {
                                        echo html_entity_decode($customisation_general["footerpayment"][$store_id], ENT_QUOTES, 'UTF-8');
                                    }
                                ?>
                            </ul>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</footer>
<div id="outer-overlay"></div>
<!-- //end Footer -->
</div>


</div>
<!--end common wrappers-->



			<script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>
	
			<?php 
if ($hideadl==0) {
$_SESSION['advurl']="http" . (($_SERVER['SERVER_PORT']==443) ? "s://" : "://") . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];

echo $customcss;


			}	?>
<?php if ($hideadl==1) { ?>

<?php $zone_id=0; if ((isset($_SESSION['fieldrequired'])) && (count($_SESSION['fieldrequired'])>=1)) { ?>





<link href="catalog/view/javascript/jquery/fancybox/bootstrap-combined.min.css" rel="stylesheet">

<script src="catalog/view/javascript/jquery/fancybox/bootstrafp.min.js"></script>
<div id="thanks"><a id="subscribepopup" href="#form-content"  style="display:none"></a></div>
	<!-- model content -->	
	
	<div id="form-contentb" class="modal fade in" data-keyboard="false" data-backdrop="static" style="bottom: auto !important; display: none; ">
	        <div class="modal-header">
	              
	              <b><?php echo $popupheading; ?></b>
	              
	        </div>
		<div>
		<form id="address_field" class="contact">
			
			<fieldset>
			<div id="thanks2"></div>
		         <div class="modal-body">
		        	 <ul class="nav nav-list">
					 <?php foreach ($_SESSION['fieldrequired'] as $field) { ?>
					  <?php if ($field=='firstname') { ?>
				<li class="nav-header">*<?php echo $entry_firstname; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
                
                 <?php if ($field=='lastname') { ?>
				<li class="nav-header">*<?php echo $entry_lastname; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
					  <?php if ($field=='fax') { ?>
				<li class="nav-header"><?php echo $entry_fax; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
						  <?php if ($field=='telephone') { ?>
				<li class="nav-header">*<?php echo $entry_telephone; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
						  <?php if ($field=='company') { ?>
				<li class="nav-header"><?php echo $entry_company; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
				
				
				
				
						  <?php if ($field=='postcode') { ?>
				<li class="nav-header"><?php echo $entry_postcode; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				
				<?php if ($error_postcode) { ?>
            <span id="postcode-required" class="error"><?php echo $error_postcode; ?></span>
            <?php } ?>
			<?php } ?>
				
						  <?php if ($field=='city') { ?>
				<li class="nav-header">*<?php echo $entry_city; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
					 
					  <?php if ($field=='address_1') { ?>
				<li class="nav-header">*<?php echo $entry_address_1; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
				 <?php if ($field=='address_2') { ?>
				 
				<li class="nav-header"><?php echo $entry_address_2; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
					 
					 <?php if ($field=='country_id') { ?>
					 <?php $usecountry='1'; ?>
					 <li class="nav-header">*<?php echo $entry_country; ?></li>
					 <li>
					 <select name="country_id" id="country_id" >
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
             
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
             
            </select>
            <?php if ($error_country) { ?>
            <span id ="country-required"  class="error"><?php echo $error_country; ?></span>
            <?php } ?>					
					 </li>
					  <?php } ?>  <?php if ($field=='zone_id') { ?>
					 
					 
					 <li class="nav-header">*<?php echo $entry_zone; ?></li>
					 <li>
					<select name="zone_id" id="zone_id">
            </select>
            <?php if ($error_zone) { ?>
            <span id ="zone-required" class="error"><?php echo $error_zone; ?></span>
            <?php } ?>
					 </li>
					 <?php } ?> 
					
				
				
				<?php } ?>
				 

				</ul> 
		        </div>
			</fieldset>
			</form>
		</div>
	     <div class="modal-footer">
	         <button class="btn btn-success" id="submit">submit</button>
	        
  		</div>
	</div>

    <script>
 $(function() {
//twitter bootstrap script
	$("button#submit").click(function(){
	        $.ajax({
    		type: "POST",
		url: "index.php?route=module/advancedlogin/address",
		data: $("#address_field").serialize(),
	
        	success: function(msg){
			  $('#thanks2').before('<div class="alert ' + msg.type + '">' + msg.message + '</div>');
 	                
 		       	$("."+msg.type).delay(5000).slideUp(400, function(){if($(this).hasClass('alert-success')){ $("#form-contentb").hide();	}});
 		        },
		error: function(){
			alert("failure");
			}
      		});
	});
});
</script>
<script type="text/javascript">jQuery(document).ready(function() {

    setTimeout( function() {$("#subscribepopup").trigger('click'); $( "#form-contentb" ).show(); },0);
	
   }
   );  
   </script>
   	<?php if ($usecountry=='1') { ?>
   <script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			
			} else {
				$('#postcode-required').hide();
			
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone']) {
			$('#country-required').show();
			
			$('#zone-required').show();
			
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
					
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
						$('#zone-required').hide();
						
	    			}
					
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
					
					
						
				}
			} else {
			
				$('#zone-required').show();
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
		
			$('select[name=\'zone_id\']').html(html);
			
		
			$('#country-required').hide();
			$('#zone-required').hide();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
  <?php } ?> 
   <?php } ?>
      <?php } ?>
			
			
</body>
</html>
