<div class="row">
  <div class="col-md-3">
    <ul class="nav nav-pills nav-stacked" id="preSaleTabs">
        <h4 style="line-height: 22px;"><span class="fa fa-minus"></span>&nbsp;Send SMS to customers</h4>
        <li><input id="Check_CustomerPlaceOrder" type="checkbox" class="optionsSmsBump" <?php echo (!empty($data['SMSBump']['CustomerPlaceOrder']['Enabled']) && $data['SMSBump']['CustomerPlaceOrder']['Enabled'] == 'yes') ? 'checked="checked"' : '' ?> /><a href="#customerOrder" data-toggle="tab"><span class="pillLink">On new order placed</span></a></li>
        <li><input id="Check_OrderStatusChange" type="checkbox" class="optionsSmsBump" <?php echo (!empty($data['SMSBump']['OrderStatusChange']['Enabled']) && $data['SMSBump']['OrderStatusChange']['Enabled'] == 'yes') ? 'checked="checked"' : '' ?> /><a href="#orderStatusChange" data-toggle="tab"><span class="pillLink">On order status change</span></a></li>
        <li><input id="Check_CustomerRegister" type="checkbox" class="optionsSmsBump" <?php echo (!empty($data['SMSBump']['CustomerRegister']['Enabled']) && $data['SMSBump']['CustomerRegister']['Enabled'] == 'yes') ? 'checked="checked"' : '' ?> /><a href="#customerRegister" data-toggle="tab"><span class="pillLink">On successful signup</span></a></li>
		<h4 style="line-height: 22px;"><span class="fa fa-minus"></span>&nbsp;Send SMS to store owner</h4>
        <li><input id="Check_AdminPlaceOrder" type="checkbox" class="optionsSmsBump" <?php echo (!empty($data['SMSBump']['AdminPlaceOrder']['Enabled']) && $data['SMSBump']['AdminPlaceOrder']['Enabled'] == 'yes') ? 'checked="checked"' : '' ?> /><a href="#customerOrderAdmin" data-toggle="tab"><span class="pillLink">On new order placed</span></a></li>
        <li><input id="Check_AdminRegister" type="checkbox" class="optionsSmsBump" <?php echo (!empty($data['SMSBump']['AdminRegister']['Enabled']) && $data['SMSBump']['AdminRegister']['Enabled'] == 'yes') ? 'checked="checked"' : '' ?> /><a href="#customerRegisterAdmin" data-toggle="tab"><span class="pillLink">On successful signup</span></a></li>
        <br /><br />
         <li><a href="#customEvent" data-toggle="tab"><span class="pillLink">Custom event</span></a></li>
    </ul>
  </div>
  <div class="col-md-9">
  <div class="tab-content">
    <div id="customerOrder" class="tab-pane fade">
        <table class="table">
            <tr>
                <td class="col-xs-2"><h5>Status:</h5></td>
                <td class="col-xs-10">
                    <div class="col-xs-3">
                        <select name="SMSBump[CustomerPlaceOrder][Enabled]" class="form-control">
                              <option value="yes" <?php echo (!empty($data['SMSBump']['CustomerPlaceOrder']['Enabled']) && $data['SMSBump']['CustomerPlaceOrder']['Enabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                              <option value="no"  <?php echo (empty($data['SMSBump']['CustomerPlaceOrder']['Enabled']) || $data['SMSBump']['CustomerPlaceOrder']['Enabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="col-xs-2"><h5>Message:</h5><span class="help">Short-codes:<br/>{SiteName} - Store name<br/>{OrderID} - Order ID<br/>{CartTotal} - Cart Total</span></td>
                <td class="col-xs-10">
                    <div class="col-xs-12">
                        <ul class="nav nav-tabs">
                          <?php $class="active";  foreach ($languages as $language) { ?>
                              <li class="<?php echo $class; ?>"><a href="#tabOrder-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>"/> <?php echo $language['name']; ?></a></li>
                          <?php  $class="";}?>
                        </ul>
                        
                        <div class="tab-content">
                            <?php $class=" active"; foreach ($languages as $language) { ?>
                              <div id="tabOrder-<?php echo $language['language_id']; ?>" language-id="<?php echo $language['language_id']; ?>" class="row-fluid tab-pane<?php echo $class; ?> language">
                                    <br /><textarea rows="3" class="form-control" name="SMSBump[CustomerPlaceOrderText][<?php echo $language['language_id']; ?>]"><?php if(!empty($data['SMSBump']['CustomerPlaceOrderText'][$language['language_id']])) echo $data['SMSBump']['CustomerPlaceOrderText'][$language['language_id']]; else echo 'Thank you for ordering from {SiteName}. Your order ID is: {OrderID}.'; ?></textarea>
                              </div>
                            <?php $class="";} ?>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    
    <div id="orderStatusChange" class="tab-pane fade">
        <table class="table">
            <tr>
                <td class="col-xs-2"><h5>Status:</h5></td>
                <td class="col-xs-10">
                    <div class="col-xs-3">
                        <select name="SMSBump[OrderStatusChange][Enabled]" class="form-control">
                              <option value="yes" <?php echo (!empty($data['SMSBump']['OrderStatusChange']['Enabled']) && $data['SMSBump']['OrderStatusChange']['Enabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                              <option value="no"  <?php echo (empty($data['SMSBump']['OrderStatusChange']['Enabled']) || $data['SMSBump']['OrderStatusChange']['Enabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="col-xs-2">
                  <h5>Order status:</h5>
                  <span class="help">Choose on which order status changes you want the customer to be notified via SMS</span>
                </td>
                <td class="col-xs-10">
                    <div class="col-xs-3">
                        <?php foreach ($order_statuses as $order_statuses) { ?>
                        <div class="orderStatuses checkbox">
                          <label><input type="checkbox" <?php if(!empty($data['SMSBump']['OrderStatusChange']['OrderStatus']) && in_array($order_statuses['order_status_id'], $data['SMSBump']['OrderStatusChange']['OrderStatus'])) echo "checked=checked" ?> name="SMSBump[OrderStatusChange][OrderStatus][]" value="<?php echo $order_statuses['order_status_id']; ?>"><?php echo $order_statuses['name']; ?></label>
                        </div> <?php } ?>
                        <a id="selectall" href="#">Select All</a> | <a id="deselectall" href="#">Deselect All</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="col-xs-2"><h5>Message:</h5><span class="help">Short-codes:<br/>{Status1} - First Order Status<br/>{Status2} - Second Order Status<br/>{SiteName} - Store name<br/>{OrderID} - Order ID</span></td>
                <td class="col-xs-10">
					<div class="col-xs-12">
                        <ul class="nav nav-tabs">
                          <?php $class="active";  foreach ($languages as $language) { ?>
                              <li class="<?php echo $class; ?>"><a href="#tabOrderChange-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>"/> <?php echo $language['name']; ?></a></li>
                          <?php  $class="";}?>
                        </ul>
                        
                        <div class="tab-content">
                            <?php $class=" active"; foreach ($languages as $language) { ?>
                              <div id="tabOrderChange-<?php echo $language['language_id']; ?>" language-id="<?php echo $language['language_id']; ?>" class="row-fluid tab-pane<?php echo $class; ?> language">
                                    <br /><textarea rows="3" class="form-control" name="SMSBump[OrderStatusChangeText][<?php echo $language['language_id']; ?>]"><?php if(!empty($data['SMSBump']['OrderStatusChangeText'][$language['language_id']])) echo $data['SMSBump']['OrderStatusChangeText'][$language['language_id']]; else echo 'Your order ({OrderID}) at {SiteName} has been updated to the following status: {Status}.'; ?></textarea>
                              </div>
                            <?php $class="";} ?>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    
    <div id="customerRegister" class="tab-pane fade">
        <table class="table">
            <tr>
                <td class="col-xs-2"><h5>Status:</h5></td>
                <td class="col-xs-10">
                    <div class="col-xs-3">
                        <select name="SMSBump[CustomerRegister][Enabled]" class="form-control">
                              <option value="yes" <?php echo (!empty($data['SMSBump']['CustomerRegister']['Enabled']) && $data['SMSBump']['CustomerRegister']['Enabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                              <option value="no"  <?php echo (empty($data['SMSBump']['CustomerRegister']['Enabled']) || $data['SMSBump']['CustomerRegister']['Enabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="col-xs-2"><h5>Message:</h5><span class="help">Short-codes:<br/>{SiteName} - Store name<br/>{CustomerName} - Customer name</span></td>
                <td class="col-xs-10">
                    <div class="col-xs-12">
                        <ul class="nav nav-tabs mainMenuTabs">
                          <?php $class="active";  foreach ($languages as $language) { ?>
                              <li class="<?php echo $class; ?>"><a href="#tabSignup-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>"/> <?php echo $language['name']; ?></a></li>
                          <?php  $class="";}?>
                        </ul>
                        
                        <div class="tab-content">
                            <?php $class=" active"; foreach ($languages as $language) { ?>
                              <div id="tabSignup-<?php echo $language['language_id']; ?>" language-id="<?php echo $language['language_id']; ?>" class="row-fluid tab-pane<?php echo $class; ?> language">
                                    <br /><textarea rows="3" class="form-control" name="SMSBump[CustomerRegisterText][<?php echo $language['language_id']; ?>]"><?php if(!empty($data['SMSBump']['CustomerRegisterText'][$language['language_id']])) echo $data['SMSBump']['CustomerRegisterText'][$language['language_id']]; else echo 'Hello, {CustomerName}! Thank you for registering at {StoreName}. Enjoy our store!'; ?></textarea>
                              </div>
                            <?php $class="";} ?>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    
    <div id="customerOrderAdmin" class="tab-pane fade">
        <table class="table">
            <tr>
                <td class="col-xs-2"><h5>Status:</h5></td>
                <td class="col-xs-10">
                    <div class="col-xs-3">
                        <select name="SMSBump[AdminPlaceOrder][Enabled]" class="form-control">
                              <option value="yes" <?php echo (!empty($data['SMSBump']['AdminPlaceOrder']['Enabled']) && $data['SMSBump']['AdminPlaceOrder']['Enabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                              <option value="no"  <?php echo (empty($data['SMSBump']['AdminPlaceOrder']['Enabled']) || $data['SMSBump']['AdminPlaceOrder']['Enabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="col-xs-2"><h5>Message:</h5><span class="help">Short-codes:<br/>{SiteName} - Store name<br/>{OrderID} - Order ID<br/>{CartTotal} - Cart Total</span></td>
                <td class="col-xs-10">
                    <div class="col-xs-12">
                        <br /><textarea rows="3" class="form-control" name="SMSBump[AdminPlaceOrderText]"><?php if(!empty($data['SMSBump']['AdminPlaceOrderText'])) echo $data['SMSBump']['AdminPlaceOrderText']; else echo 'Someone ordered something from your store. The order ID is: {OrderID}.'; ?></textarea>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    
    <div id="customerRegisterAdmin" class="tab-pane fade">
        <table class="table">
            <tr>
                <td class="col-xs-2"><h5>Status:</h5></td>
                <td class="col-xs-10">
                    <div class="col-xs-3">
                        <select name="SMSBump[AdminRegister][Enabled]" class="form-control">
                              <option value="yes" <?php echo (!empty($data['SMSBump']['AdminRegister']['Enabled']) && $data['SMSBump']['AdminRegister']['Enabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                              <option value="no"  <?php echo (empty($data['SMSBump']['AdminRegister']['Enabled']) || $data['SMSBump']['AdminRegister']['Enabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="col-xs-2"><h5>Message:</h5><span class="help">Short-codes:<br/>{SiteName} - Store name<br/>{CustomerName} - Customer name</span></td>
                <td class="col-xs-10">
                    <div class="col-xs-12">
                        <br /><textarea rows="3" class="form-control" name="SMSBump[AdminRegisterText]"><?php if(!empty($data['SMSBump']['AdminRegisterText'])) echo $data['SMSBump']['AdminRegisterText']; else echo 'Hello, admin! The customer {CustomerName} registered at your store!'; ?></textarea>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    
    <div id="customEvent" class="tab-pane fade">
     	<div class="col-xs-9">
            <h4> Add this code in the event handler where you want the SMS to be sent:</h4><br />

<pre>&lt;?php
$this<span style="color:#00f">-></span>load<span style="color:#00f">-></span>model(<span style="color:#093">'module/smsbump'</span>); <span style="color:#06f;font-style:italic">// Load the model for SMSBump </span>
$SMSBump <span style="color:#00f">=</span> $this<span style="color:#00f">-></span>model_module_smsbump<span style="color:#00f">-></span>getSetting(<span style="color:#093">'SMSBump'</span>, $this<span style="color:#00f">-></span>config<span style="color:#00f">-></span>get(<span style="color:#093">'store_id'</span>)); <span style="color:#06f;font-style:italic">// Load the settings for SMSBump</span>
$this<span style="color:#00f">-></span>load<span style="color:#00f">-></span>library(<span style="color:#093">'SmsBump'</span>); <span style="color:#06f;font-style:italic">// Load the library for the SMSBump API</span>

<span style="color:#33f;font-weight:700">SmsBump</span><span style="color:#00f">::</span>sendMessage(<span style="color:#33f;font-weight:700">array</span>(
    <span style="color:#093">'APIKey'</span> <span style="color:#00f">=></span> $SMSBump[<span style="color:#093">'SMSBump'</span>][<span style="color:#093">'APIKey'</span>], <span style="color:#06f;font-style:italic">// SMSBump API</span>
    <span style="color:#093">'to'</span> <span style="color:#00f">=></span> <span style="color:#093">'Selected_Phone_Number'</span>, <span style="color:#06f;font-style:italic">// The phone number which will receive the SMS</span>
    <span style="color:#093">'from'</span> <span style="color:#00f">=></span> $SMSBump[<span style="color:#093">'SMSBump'</span>][<span style="color:#093">'From'</span>], <span style="color:#06f;font-style:italic">// From who will be sent the SMS</span>
    <span style="color:#093">'message'</span> <span style="color:#00f">=></span> <span style="color:#093">'Your_Message'</span>, <span style="color:#06f;font-style:italic">// The message that will be received</span>
    <span style="color:#093">'callback'</span> <span style="color:#00f">=></span> <span style="color:#33f;font-weight:700">array</span>(<span style="color:#093">'ModelModuleSmsbump'</span>, <span style="color:#093">'SmsBumpCallback'</span>) <span style="color:#06f;font-style:italic">// Callback function</span>
));
?>
</pre>

        </div>
    </div>
    
   </div>
  </div>
</div>
<script>
$('#selectall').click(function(event) {  //on click 
    event.preventDefault();
    event.stopPropagation();

    $('.orderStatuses.checkbox input').each(function() {
        this.checked = true;          
    });
});

$('#deselectall').click(function(event) {  //on click 
    event.preventDefault();
    event.stopPropagation();
    
    $('.orderStatuses.checkbox input').each(function() {
        this.checked = false;          
    });
});

$( "input[id='Check_CustomerPlaceOrder']" ).change(function() {
  var isChecked = $(this).is(':checked');
  if (isChecked) {
	$('[name="SMSBump[CustomerPlaceOrder][Enabled]"] option[value="yes"]').prop('selected', 'selected');  
  } else {
	$('[name="SMSBump[CustomerPlaceOrder][Enabled]"] option[value="no"]').prop('selected', 'selected');   
  }
});

$( "input[id='Check_OrderStatusChange']" ).change(function() {
  var isChecked = $(this).is(':checked');
  if (isChecked) {
	$('[name="SMSBump[OrderStatusChange][Enabled]"] option[value="yes"]').prop('selected', 'selected');  
  } else {
	$('[name="SMSBump[OrderStatusChange][Enabled]"] option[value="no"]').prop('selected', 'selected');   
  }
});

$( "input[id='Check_CustomerRegister']" ).change(function() {
  var isChecked = $(this).is(':checked');
  if (isChecked) {
	$('[name="SMSBump[CustomerRegister][Enabled]"] option[value="yes"]').prop('selected', 'selected');  
  } else {
	$('[name="SMSBump[CustomerRegister][Enabled]"] option[value="no"]').prop('selected', 'selected');   
  }
});

$( "input[id='Check_AdminPlaceOrder']" ).change(function() {
  var isChecked = $(this).is(':checked');
  if (isChecked) {
	$('[name="SMSBump[AdminPlaceOrder][Enabled]"] option[value="yes"]').prop('selected', 'selected');  
  } else {
	$('[name="SMSBump[AdminPlaceOrder][Enabled]"] option[value="no"]').prop('selected', 'selected');   
  }
});

$( "input[id='Check_AdminRegister']" ).change(function() {
  var isChecked = $(this).is(':checked');
  if (isChecked) {
	$('[name="SMSBump[AdminRegister][Enabled]"] option[value="yes"]').prop('selected', 'selected');  
  } else {
	$('[name="SMSBump[AdminRegister][Enabled]"] option[value="no"]').prop('selected', 'selected');   
  }
});
</script>