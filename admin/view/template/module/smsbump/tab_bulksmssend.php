<table id="mail" class="table">
  <tr>
    <td class="col-xs-3">
    	<h5><strong>Account Balance:</strong></h5>
    </td>
    <td class="col-xs-9">
		<div class="col-xs-4">
        	<!--h5 id="balance">Insufficient funds on balance. Please recharge.</h5>
        	<button type="button" class="btn btn-success balance-plus dropdown-toggle" data-toggle="dropdown" aria-expanded="false" id="addFundsDropdown">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            </button-->
            <div class="btn-group">
              <button type="button" class="btn btn-success text"><span id="balance">0.00 USD</span></button>
              <button type="button" class="btn btn-success balance-plus dropdown-toggle" data-toggle="dropdown" aria-expanded="false" id="addFundsDropdown">
                    <span class="fa fa-plus" aria-hidden="true"></span>
              </button>
              <ul class="dropdown-menu" role="menu" aria-labelledby="addFundsDropdown">
                <li role="amount"><a role="menuitem" tabindex="-1" onClick="addFunds('20.00');">$ 20.00</a></li>
                <li role="amount"><a role="menuitem" tabindex="-1" onClick="addFunds('50.00');">$ 50.00</a></li>
                <li role="amount"><a role="menuitem" tabindex="-1" onClick="addFunds('100.00');">$ 100.00</a></li>
                <li role="amount"><a role="menuitem" tabindex="-1" onClick="addFunds('200.00');">$ 200.00</a></li>
                <li role="amount"><a role="menuitem" tabindex="-1" onClick="addFunds('500.00');">$ 500.00</a></li>
                <li role="amount"><a role="menuitem" tabindex="-1" onClick="addFunds('1000.00');">$ 1000.00</a></li>
              </ul>
            </div>
        </div>
    </td>
  </tr>
  <tr>
    <td class="col-xs-3">
    	<h5><strong>Type:</strong></h5>
    	<span class="help">SMS - Simple text message<br />MMS - Text message with multimedia<br />USSD - Send message like USSD code<br />Voice - Using text-to-speech software</span>
    </td>
	<td class="col-xs-9">
        <div class="col-xs-4">
          <select name="type" id="type" class="form-control">
            <option value="sms">SMS</option>
            <option value="mms">MMS</option>
            <option value="ussd">USSD</option>
            <option value="vms">Voice message</option>
          </select>
        </div>
  </td>
  </tr>
  <tr id="mms-media">
    <td class="col-xs-3">
    	<h5><strong>Media file:</strong></h5>
    	<span class="help"><i class="fa fa-info-circle"></i>&nbsp;From here you can upload a picture to your mesage.</span>
    </td>
	<td class="col-xs-9">
       <div class="image col-xs-4">
       		<img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />
			<input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
			<a onclick="image_upload('image', 'thumb');">Browse</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');">Clear</a>
		</div>
    </td>
  </tr>
  <tr>
    <td class="col-xs-3">
      <h5>From:</h5>
      <span class="help"><i class="fa fa-info-circle"></i>&nbsp;This field will be taken into account only if you are subscribed for the premium plan.<br /><br />- Latin characters are supported only.</span>
    </td>
    <td class="col-xs-9">
    <div class="col-xs-4">
          <input type="text" name="from" value="" class="form-control" />
        </div>
  </td>
  </tr>
  <tr>
    <td class="col-xs-3">
    	<h5><strong>To:</strong></h5>
    	<span class="help"><i class="fa fa-info-circle"></i>&nbsp;Choose the customers that you would like to receive your message.</span>
    </td>
	<td class="col-xs-9">
        <div class="col-xs-4">
          <select name="to" class="form-control">
            <option value="customer_all">All customers</option>
            <option value="customer">Specific customers</option>
            <option value="telephones">Specific phone numbers</option>
            <option value="product">Customer who ordered specific products</option>
			<option value="customer_group">Customer groups</option>
			<option value="newsletter">All newsletter subscribers</option>
			<option value="affiliate_all">All affiliates</option>
            <option value="affiliate">Specific affiliates</option>
          </select>
        </div>
  </td>
  </tr>
  <tbody id="to-customer-group" class="to">
    <tr>
      <td class="col-xs-3"><h5><strong>Customer Group:</strong></h5></td>
      <td class="col-xs-9">
      		<div class="col-xs-4">
            	<select class="form-control" name="customer_group_id">
          			<?php foreach ($customer_groups as $customer_group) { ?>
          			<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
         			 <?php } ?>
        		</select>
      		</div>
      </td>
    </tr>
  </tbody>
  <tbody id="to-telephones" class="to">
    <tr>
      <td class="col-xs-3"><h5><strong>Number:</strong></h5></td>
      <td class="col-xs-9">
        <div class="col-xs-4">
            <div class="input-group">
                <input type="text" name="telephones" value="" class="form-control" />
                <span class="input-group-btn">
                    <a class="btn btn-primary" onclick="addTelephone()">Add</a>
                </span>
            </div><!-- /input-group -->
        </div>
      </td>
    </tr>
    <tr>
      <td class="col-xs-3">&nbsp;</td>
      <td class="col-xs-9">
     	 <div class="col-xs-4">
      		<div id="telephone" class="scrollbox form-control" style="height:100px;"></div>
      	 </div>
      </td>
    </tr>
  </tbody>
  <tbody id="to-customer" class="to">
    <tr>
      <td class="col-xs-3">
      	<h5><strong>Customer:</strong></h5>
      	<span class="help"><i class="fa fa-info-circle"></i>&nbsp;Autocomplete</span>
      </td>
      <td class="col-xs-9">
      		<div class="col-xs-4">
            	<input type="text" name="customers" value="" class="form-control" />
            </div>
      </td>
    </tr>
    <tr>
      <td class="col-xs-3">&nbsp;</td>
      <td class="col-xs-9">
     	 <div class="col-xs-4">
      		<div id="customer" class="scrollbox form-control" style="height:100px;"></div>
      	 </div>
      </td>
    </tr>
  </tbody>
  <tbody id="to-affiliate" class="to">
    <tr>
      <td class="col-xs-3">
      	<h5><strong>Affiliate:</strong></h5>
      	<span class="help"><i class="fa fa-info-circle"></i>&nbsp;Autocomplete</span>
      </td>
      <td class="col-xs-9">
      	<div class="col-xs-4">
            <input type="text" name="affiliates" value="" class="form-control" />
        </div>
      </td>
    </tr>
    <tr>
      <td class="col-xs-3">&nbsp;</td>
      <td class="col-xs-9">
     	 <div class="col-xs-4">
      		<div id="affiliate" class="scrollbox form-control" style="height:100px;"></div>
      	 </div>
      </td>
    </tr>
  </tbody>
  <tbody id="to-product" class="to">
    <tr>
	  <td class="col-xs-3">
		  <h5><strong>Products:</strong></h5>
		  <span class="help"><i class="fa fa-info-circle"></i>&nbsp;Send only to customers who have ordered products in the list. (Autocomplete)</span></h5>
	  </td>
      <td class="col-xs-9">
      	<div class="col-xs-4">
            <input type="text" name="products" value="" class="form-control" />
        </div>
      </td>
    </tr>
    <tr>
      <td class="col-xs-3">&nbsp;</td>
	  <td class="col-xs-9">
     	 <div class="col-xs-4">
      		<div id="product" class="scrollbox form-control" style="height:100px;"></div>
      	 </div>
      </td>
    </tr>
  </tbody>  
  <tr>
    <td class="col-xs-3">
    	<h5><strong><span class="required">*</span> Message:</strong></h5>
    	<span class="help"><i class="fa fa-info-circle"></i>&nbsp;Usually one text is 160 characters. If your message contains more than 160 characters, your message will be divided in more than one SMSs. For example, if your message contains 1600 characters, a given customer will receive 10 SMSs (10*160).<br /><br />- Non-latin characters <strong>are</strong> supported.</span>
    </td>
    <td class="col-xs-9">
		<div class="col-xs-4">
      		<textarea name="message" id="count_me" class="form-control" rows="4"></textarea>
      	</div>
    </td>
  </tr>
  <tr>
    <td class="col-xs-3"></td>
    <td class="col-xs-9">
		<div class="col-xs-4">
      		<div class="buttons">
				<a id="button-send" onclick="send('index.php?route=module/smsbump/send&token=<?php echo $token; ?>');"  class="btn btn-success btn-lg">Send the message</a>
			</div>
      	</div>
        
        <div style="clear:both;"></div><br />
        
    </td>
  </tr>
</table>

<div id="myModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Sending messages</h4>
      </div>
      <div class="modal-body">
      	<div id="modal-message"><h4>Do not close this window until the script finishes. Otherwise the messages will not be sent to all customers.</h4></div><br />
        <div id="progressbar-parent" class="progress progress-striped active">
  			<div class="progress-bar" id="progressbar" role="progressbar" style="width:0%"></div>
		</div>
        <div id="modal-message-sent"><h5>Last sent to: <span id="modal-telephone"> </span></h5></div>
        <div id="modal-message-senttotal"><h5>Sent messages: <span id="modal-telephone-total">0</span></h5></div>
        <div id="modal-message-errors"><h5>Errors: <span id="modal-telephone-errors">0</span></h5></div>
        <div id="modal-message-errorsAll" style="max-height: 150px;overflow: scroll;overflow-x: hidden; overflow-y: hidden; overflow: auto;"></div>
      </div>
	 <div class="modal-footer">
        <button type="button" class="btn btn-default" id="myModalClose" data-dismiss="modal">Close</button>
	 </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript"><!--
<?php if ( !isset($data['SMSBump']['APIKey']) || (empty($data['SMSBump']['APIKey'])) ) {
} else { ?>
$.ajax({
  url: '//api.smsbump.com/balance/<?php echo $data['SMSBump']['APIKey'] ?>.json',
  type: "GET",
  async: true,
  success: function(result) {   
  	if (result.data)
      $('#balance').html(parseFloat(result.data.balance).toFixed(2) + ' <span style="text-transform:uppercase;">' + result.data.currency + '</span>');
  }
});
<?php } ?>
	$("#count_me").characterCounter({
		counterFormat: '%1 written characters.'
	});
	
	$('select[name=\'to\']').bind('change', function() {
		$('#mail .to').hide();
		$('#mail #to-' + $(this).children('option:selected').attr('value').replace('_', '-')).show();
	});

	$('select[name=\'to\']').trigger('change');

	$('input[name=\'customers\']').autocomplete({
		delay: 500,
		source: function(request, response) {
			$.ajax({
				url: '<?php echo $customer_autocomplete_url ?>&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {	

					response($.map(json, function(item) {
						return {
							category: item.customer_group,
							label: item.name,
							value: item.customer_id
						}
					}));
				}
			});
			
		}, 
		select: function(event, ui) {
			$('#to-customer #customer' + ui.item.value).remove();
			
			$('#to-customer #customer').append('<div id="customer' + ui.item.value + '">' + '<i class="fa fa-minus-circle"></i> ' + ui.item.label + '<input type="hidden" name="customer[]" value="' + ui.item.value + '" /></div>');
	
			$('#to-customer #customer div:odd').attr('class', 'odd');
			$('#to-customer #customer div:even').attr('class', 'even');
					
			return false;
		},
		focus: function(event, ui) {
			return false;
		}
	});

	$('#to-customer #customer').delegate('.fa-minus-circle', 'click', function() {
	  	$(this).parent().remove();

	  	$('#to-customer #customer div:odd').attr('class', 'odd');
		$('#to-customer #customer div:even').attr('class', 'even');	
	});

	
	$('input[name=\'affiliates\']').autocomplete({
		delay: 500,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=marketing/affiliate/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {		
					response($.map(json, function(item) {
						return {
							label: item.name,
							value: item.affiliate_id
						}
					}));
				}
			});
			
		}, 
		select: function(event, ui) {
			$('#affiliate' + ui.item.value).remove();
			
			$('#affiliate').append('<div id="affiliate' + ui.item.value + '"><i class="fa fa-minus-circle"></i> ' + ui.item.label + '<input type="hidden" name="affiliate[]" value="' + ui.item.value + '" /></div>');
	
			$('#affiliate div:odd').attr('class', 'odd');
			$('#affiliate div:even').attr('class', 'even');
					
			return false;
		},
		focus: function(event, ui) {
			return false;
		}
	});

	$('#affiliate').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
		
		$('#affiliate div:odd').attr('class', 'odd');
		$('#affiliate div:even').attr('class', 'even');	
	});

	$('input[name=\'products\']').autocomplete({
		delay: 500,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {		
					response($.map(json, function(item) {
						return {
							label: item.name,
							value: item.product_id
						}
					}));
				}
			});
		}, 
		select: function(event, ui) {
			$('#product' + ui.item.value).remove();
			
			$('#product').append('<div id="product' + ui.item.value + '"><i class="fa fa-minus-circle"></i> ' + ui.item.label + '<input type="hidden" name="product[]" value="' + ui.item.value + '" /></div>');
	
			$('#product div:odd').attr('class', 'odd');
			$('#product div:even').attr('class', 'even');
					
			return false;
		},
		focus: function(event, ui) {
			return false;
		}
	});

	$('#product').delegate('.fa-minus-circle', 'click', function() {
	  $(this).parent().remove();

	  $('#product div:odd').attr('class', 'odd');
	  $('#product div:even').attr('class', 'even');	
	});

	 $(function() {
		var $typeSelector = $('#type');
		var $toggleArea = $('#mms-media');
		$toggleArea.hide();
			$typeSelector.change(function(){
			if ($typeSelector.val() === 'mms') {
				$toggleArea.show(400); 
			} else {
				$toggleArea.hide(400); 
			}
			});
		});
		
	var number = 0;
	function addTelephone() { 
		if ($('input[name=\'telephones\']').val()) {
			$('#telephone').append('<div id="telephone' + number + '">' + '<i class="fa fa-minus-circle"></i> ' + $('input[name=\'telephones\']').val() + '<input type="hidden" name="phones[]" value="' + $('input[name=\'telephones\']').val() + '" /></div>');
			number++;
			$('#telephone div:odd').attr('class', 'odd');
			$('#telephone div:even').attr('class', 'even');
	
			$('input[name=\'telephones\']').val('');
		}
	}

	$('#telephone').delegate('.fa-minus-circle', 'click', function() {
	  	$(this).parent().remove();

	  	$('#telephone div:odd').attr('class', 'odd');
		$('#telephone div:even').attr('class', 'even');	
	});
	
	function send(url) { 
		$('textarea[name="message"]').val();
		$('#modal-message-errorsAll').html("");
		$('#modal-telephone-errors').html("0");
		
		$.ajax({
			url: url,
			type: 'post',
			data: $('select, input, textarea'),		
			dataType: 'json',
			beforeSend: function() {
				$('#button-send').attr('disabled', true);
			},
			complete: function() {
				$('#button-send').attr('disabled', false);
			},				
			success: function(json) {
				$('.success, .warning, .error').remove();
				
				if (json['error']) {
					if (json['error']['warning']) {
						$('.box').before('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
						$('.warning').fadeIn('slow');
					}
					
					if (json['error']['message']) {
						$('textarea[name=\'message\']').parent().append('<span class="error">' + json['error']['message'] + '</span>');
					}									
				}				
				
				if (!json['error'] && !json['success']) {
					alert("There are no customers with phone numbers in the current config.");
				}

				if (json['success']) {
					$('#myModal').modal({
					  backdrop: false,
					  keyboard: false
					});
					$('#myModalClose').attr('disabled', true);
					$('#myModal').modal('show');
					var total = 0;
					var errors = 0;
					var catalogURL = '<?php echo $catalogURL; ?>image/';
					$.smsbump({
						apikey: '<?php echo (isset($data['SMSBump']['APIKey'])) ? $data['SMSBump']['APIKey'] : 'test'; ?>',
						to: json['telephones'],
						type: $("#type option:selected").val(),
						from: $('input[name="from"]').val(),
						media: catalogURL + $('#image').val(),
						message: $('textarea[name="message"]').val(),
						success: function(resp) {
							total++;
							$('#progressbar').css('width', (total/json['telephones'].length)*100 + '%');
							$('#progressbar').html((total/json['telephones'].length)*100 + '%');
							$('#modal-telephone').html(resp['data']['to']);
							$('#modal-telephone-total').html(total);
							if (total==json['telephones'].length) {
								$('#progressbar-parent').removeClass('active');
								$('#myModalClose').attr('disabled', false);
								$('#modal-message').html('<h4>Great! The messages were sent successfully. You can now close the popup.</h4>');
							}
						},
						error: function(resp) {
							total++;
							errors++;
							$('#progressbar').css('width', (total/json['telephones'].length)*100 + '%');
							$('#progressbar').html((total/json['telephones'].length)*100 + '%');
							$('#progressbar').val(total);
							$('#modal-telephone-errors').html(errors);
							$('#modal-message-errorsAll').append(resp['to'] + ": " + resp['message'] + "<br />");
							if (total==json['telephones'].length) {
								$('#progressbar-parent').removeClass('active');
								$('#myModalClose').attr('disabled', false);
								$('#modal-message').html('<h4>The operation completed successfully. However, some of the messages were not sent.</h4>');
							}
							
						}
					});
				}
									
			}
		});
	}
//--></script> 
<script type="text/javascript"><!--
	function image_upload(field, thumb) {
		$('#dialog').remove();
		
		$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
		
		$('#dialog').dialog({
			title: 'Image manager',
			close: function (event, ui) {
				if ($('#' + field).attr('value')) {
					$.ajax({
						url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
						dataType: 'text',
						success: function(text) {
							$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
						}
					});
				}
			},	
			bgiframe: false,
			width: 800,
			height: 400,
			resizable: false,
			modal: false
		});
	};

	function addFunds(amount) {
		var parentUrl = (window.location != window.parent.location)
					? document.referrer
					: document.location;
				
		$.ajax({
			url: 'https://api.smsbump.com/recharge/<?php echo $data["SMSBump"]["APIKey"] ?>.json',
			type: "GET",
			data: {
					amount: amount,
					returnurl: parentUrl.href
			},
			success: function(json) {
				if(json.status=='success') {
					window.open(json.data.payment_link,"_top","",true);
				} else {
					alert("You need to register your API key in the administration before adding balance!");
				}					
			}
		});
	};
//--></script>