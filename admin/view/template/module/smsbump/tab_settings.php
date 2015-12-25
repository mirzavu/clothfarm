<table class="table">
    <tr>
        <td class="col-xs-3"><h5><strong><span class="required">* </span><?php echo $entry_code; ?></strong></h5></td>
        <td class="col-xs-9">
            <div class="col-xs-4">
                <select name="SMSBump[Enabled]" class="form-control">
                      <option value="yes" <?php echo (!empty($data['SMSBump']['Enabled']) && $data['SMSBump']['Enabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                      <option value="no"  <?php echo (empty($data['SMSBump']['Enabled']) || $data['SMSBump']['Enabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                </select>
            </div>
        </td>
    </tr>
    
    <tr>
        <td class="col-xs-3">
            <h5><strong><span class="required">* </span>API Key:</strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;Get your API key from http://smsbump.com.</span>
        </td>
        <td class="col-xs-9">
            <div class="col-xs-4">
                <div class="form-group" style="padding-top:10px;">
                    <input type="text" id="APIKey" class="form-control" name="SMSBump[APIKey]" value="<?php if(isset($data['SMSBump']['APIKey'])) { echo $data['SMSBump']['APIKey']; } else { echo ""; }?>" />
                </div>
            </div>
        </td>
    </tr>
    
	<tr>
		<td class="col-xs-3">
            <h5><strong>Add phone number prefix:</strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;This setting will add prefix to all phone numbers when the module sends a message. It will also remove the zeros (if any) in the beginning in the numbers.</span>
        </td>
        <td class="col-xs-9">
            <div class="col-xs-4">
                <select name="SMSBump[PhoneNumberPrefix]" id="Check" class="form-control">
                      <option value="yes" <?php echo (!empty($data['SMSBump']['PhoneNumberPrefix']) && $data['SMSBump']['PhoneNumberPrefix'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                      <option value="no"  <?php echo (empty($data['SMSBump']['PhoneNumberPrefix']) || $data['SMSBump']['PhoneNumberPrefix']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                </select>
                <div class="prefix">
                    <br />
                    <input type="text" class="form-control" name="SMSBump[NumberPrefix]" value="<?php if(isset($data['SMSBump']['NumberPrefix'])) { echo $data['SMSBump']['NumberPrefix']; } else { echo ""; }?>" />
                    <br />
                    <div class="row">
                        <div class="col-md-7">
                        	<strong>Remove the leading zeros from the beginning of the number:</strong>
                        </div>
                        <div class="col-md-5">
                            <select name="SMSBump[PhoneRemoveZeros]" class="form-control">
                              <option value="yes" <?php echo (!empty($data['SMSBump']['PhoneRemoveZeros']) && $data['SMSBump']['PhoneRemoveZeros'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                              <option value="no"  <?php echo (empty($data['SMSBump']['PhoneRemoveZeros']) || $data['SMSBump']['PhoneRemoveZeros']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    
	<tr>
        <td class="col-xs-3"><h5><strong>Send messages only to numbers starting with a prefix:</strong></h5></td>
        <td class="col-xs-9">
            <div class="col-xs-4">
                <select name="SMSBump[StrictPrefix]" id="CheckPrefix" class="form-control">
                  <option value="yes" <?php echo (!empty($data['SMSBump']['StrictPrefix']) && $data['SMSBump']['StrictPrefix'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                  <option value="no"  <?php echo (empty($data['SMSBump']['StrictPrefix']) || $data['SMSBump']['StrictPrefix']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                </select>
				<div class="strict-prefix">
                    <br />
                    <input type="text" class="form-control" name="SMSBump[StrictNumberPrefix]" value="<?php if(isset($data['SMSBump']['StrictNumberPrefix'])) { echo $data['SMSBump']['StrictNumberPrefix']; } else { echo ""; }?>" />
                </div>
            </div>
        </td>
    </tr>
    
    <tr>
        <td class="col-xs-3">
            <h5><strong>Store owner phone number:</strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;This phone number can be used for notifications.</span></td>
        <td class="col-xs-9">
            <div class="col-xs-4">
                <div class="form-group" style="padding-top:10px;">
                    <input type="text" class="form-control" name="SMSBump[StoreOwnerPhoneNumber]" value="<?php if(isset($data['SMSBump']['StoreOwnerPhoneNumber'])) { echo $data['SMSBump']['StoreOwnerPhoneNumber']; } else { echo ""; }?>" />
                </div>
            </div>
        </td>
    </tr>
    
    <tr>
        <td class="col-xs-3">
            <h5><strong>From:</strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;This field will be taken into account only if you are subscribed for the premium plan.<br><br>&gt; Latin characters are supported only.</span>
        </td>
        <td class="col-xs-9">
            <div class="col-xs-4">
                <div class="form-group" style="padding-top:10px;">
                    <input type="text" class="form-control" name="SMSBump[From]" value="<?php if(isset($data['SMSBump']['From'])) { echo $data['SMSBump']['From']; } else { echo "SMSBump"; }?>" />
                </div>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
// Display & Hide the settings
$(function() {
    var $typeSelector = $('#Check');
    var $toggleArea = $('.prefix');
	 if ($typeSelector.val() === 'yes') {
            $toggleArea.show(); 
        }
        else {
            $toggleArea.hide(); 
        }
    $typeSelector.change(function(){
        if ($typeSelector.val() === 'yes') {
            $toggleArea.show(300); 
        }
        else {
            $toggleArea.hide(300); 
        }
    });	
});
$(function() {
    var $typeSelector = $('#CheckPrefix');
    var $toggleArea = $('.strict-prefix');
	 if ($typeSelector.val() === 'yes') {
            $toggleArea.show(); 
        }
        else {
            $toggleArea.hide(); 
        }
    $typeSelector.change(function(){
        if ($typeSelector.val() === 'yes') {
            $toggleArea.show(300); 
        }
        else {
            $toggleArea.hide(300); 
        }
    });	
});
</script>