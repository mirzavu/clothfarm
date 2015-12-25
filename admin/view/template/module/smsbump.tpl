<?php echo $header;?>
<?php echo $column_left;?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
          <h1><i class="fa fa-mobile"></i>&nbsp;<?php echo $heading_title; ?></h1>
          <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
          </ul>


        </div>
    </div>
    <div class="container-fluid">
    	<?php if ($error_warning) { ?>
            <div class="alert alert-danger autoSlideUp"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
             <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <?php if ($success) { ?>
            <div class="alert alert-success autoSlideUp"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <script>$('.autoSlideUp').delay(3000).fadeOut(600, function(){ $(this).show().css({'visibility':'hidden'}); }).slideUp(600);</script>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"> <img src="view/template/module/smsbump/smsbumplogosmall.png" /> <span style="vertical-align:middle;font-weight:bold;"><?php echo $heading_title; ?></span></h3>
                <div class="storeSwitcherWidget">
                	<div class="form-group">
                    	<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"><?php echo $store['name']; if($store['store_id'] == 0) echo $text_default; ?>&nbsp;<span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button>
                    	<ul class="dropdown-menu" role="menu">
                        	<?php foreach ($stores  as $st) { ?>
                        		<li><a href="index.php?route=module/smsbump&store_id=<?php echo $st['store_id'];?>&token=<?php echo $token; ?>"><?php echo $st['name']; ?></a></li>
                        	<?php } ?> 
                    	</ul>
                	</div>
                </div>
            </div>
            <div class="panel-body">
                <?php if(!empty($data['SMSBump']['APIKey']) ) { ?>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form"> 
                        <input type="hidden" name="store_id" value="<?php echo $store['store_id']; ?>" />
                        <div class="tabbable">
                            <div class="tab-navigation form-inline">
                                <ul class="nav nav-tabs mainMenuTabs" id="mainTabs">
                                    <li><a href="#bulksmssend" data-toggle="tab"><i class="fa fa-file-text-o"></i>&nbsp;&nbsp;Messaging</a></li>
                                    <li><a href="#actions" data-toggle="tab"><span class="fa fa-mobile"></span>&nbsp;&nbsp;Transactional SMS</a></li>
        	                        <li><a href="#main_settings" data-toggle="tab"><i class="fa fa-cogs"></i>&nbsp;&nbsp;Settings</a></li>
                                    <li><a href="#support" data-toggle="tab"><i class="fa fa-ticket"></i>&nbsp;&nbsp;Support</a></li>
                                </ul>
                                <div class="tab-buttons">
                                    <button type="submit" class="btn btn-success save-changes"><i class="fa fa-check"></i>&nbsp;<?php echo $save_changes?></button>
                                    <a onclick="location = '<?php echo $cancel; ?>'" class="btn btn-warning"><i class="fa fa-times"></i>&nbsp;<?php echo $button_cancel?></a>
                                </div> 
                            </div><!-- /.tab-navigation --> 
                            <div class="tab-content">
                                <div id="bulksmssend" class="tab-pane fade"><?php require_once(DIR_APPLICATION.'view/template/module/smsbump/tab_bulksmssend.php'); ?></div>
                                <div id="actions" class="tab-pane fade"><?php require_once(DIR_APPLICATION.'view/template/module/smsbump/tab_actions.php'); ?></div>
                          	    <div id="main_settings" class="tab-pane fade"><?php require_once(DIR_APPLICATION.'view/template/module/smsbump/tab_settings.php'); ?></div>
                                <div id="support" class="tab-pane fade"><?php require_once(DIR_APPLICATION.'view/template/module/smsbump/tab_support.php'); ?></div>
                            </div> <!-- /.tab-content --> 
                        </div><!-- /.tabbable -->
                    </form>
                <?php } else { ?>
                    <form class="form-default" id="login-form" method="post">
                        <div class="login_form">
                            <h3>Welcome</h3>
                            <h2>Enter email address and phone number to start using SMSBump</h2>
                            <input name="login_email" type="email" class="form-control" placeholder="Email address">
                            <input name="login_phone" type="text" class="form-control" placeholder="Phone number (e.g. +1234567890)">
                            <div class="e-submit">
                                <button type="submit" class="btn btn-primary" id="login-form-submit" value="Log in">Proceed</button>
                            </div>
                            <input type="hidden" name="store_id" value="<?php echo $store['store_id']; ?>" />
                        </div>
                    </form>
                    <form class="form-default" id="confirm-form" method="post" style="display:none;">
                        <div class="login_form">
                            <h3>Confirm</h3>
                            <h2>Enter email address and phone number to start using SMSBump</h2>
                            <input name="confirm_code" type="text" class="form-control" placeholder="Verification code"/>
                            <div class="e e-submit">
                                <button type="submit" class="btn btn-primary" id="confirm-form-submit" value="Confirm">Confirm</button>
                            </div>
                        </div>
                        <input name="store_id" type="hidden" class="form-control" value="<?php echo(!empty($store_id) ? $store_id : 0) ?>">
                        <input name="login_email" type="hidden" class="form-control" value="<?php echo(!empty($email) ? $email : '') ?>">
                        <input name="login_phone" type="hidden" class="form-control" value="<?php echo(!empty($phone) ? $phone : '') ?>">
                    </form>
                    <script>
                        function validateLogin() {
                            var error = "";
                            if($('[name="login_email"]').val().length < 1 || $('[name="login_phone"]').val().length < 1) {
                                error = "All fields must be filled!";
                                return error;
                            } 

                            return error;
                        }

                       $('#login-form-submit').on('click', function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            var validate = validateLogin();
                            if(validate.length < 1) {
                                $.ajax({
                                    url: '<?php echo htmlspecialchars_decode("https://api.smsbump.com/userlogon/1f8DSYextlR1.json") ?>',
                                    type: 'GET',
                                    data: { email: $('[name="login_email"]').val(), 
                                            phone: $('[name="login_phone"]').val()
                                          },
                                    success: function (response) {
                                        if(response.status == "success" && !response.data.user) {
                                           $('#confirm-form h2').html(response.data.message);
                                           $('#login-form').slideUp();
                                           $('#confirm-form').slideDown();
                                           $('#confirm-form-submit').on('click', function (event) {
                                                event.preventDefault();
                                                event.stopPropagation();
                                                $.ajax({
                                                    url: '<?php echo htmlspecialchars_decode("https://api.smsbump.com/userlogon/1f8DSYextlR1.json") ?>',
                                                    type: 'GET',
                                                    data: { //store_id: $('[name="store_id"]').val(), 
                                                            email: $('[name="login_email"]').val(), 
                                                            phone: $('[name="login_phone"]').val(),
                                                            code:  $('[name="confirm_code"]').val()
                                                          },
                                                    success: function(result) {
                                                        if(result.status == "success" && result.data.user.apps[0].apikey) {
                                                            $.ajax({
                                                                url: '<?php echo htmlspecialchars_decode($saveApiKey) ?>',
                                                                type: 'GET',
                                                                data: { store_id: $('[name="store_id"]').val(), 
                                                                        api_key:  result.data.user.apps[0].apikey
                                                                },
                                                                dataType: "json",
                                                                success: function (addResult) {
                                                                    if(addResult.status == "success")
                                                                        location.reload(addResult.redirect_url);
                                                                    else 
                                                                        alert("Unknown error!");
                                                                }
                                                            });
                                                        } else if(result.status == "error") {
                                                            alert(result.data.message);
                                                        }  
                                                    }
                                                });
                                           });
                                        } else if(response.status == "success" && response.data.user.apps[0].apikey) {
                                            $.ajax({
                                                url: '<?php echo htmlspecialchars_decode($saveApiKey) ?>',
                                                type: 'GET',
                                                data: { store_id: $('[name="store_id"]').val(), 
                                                        api_key:  response.data.user.apps[0].apikey
                                                },
                                                dataType: "json",
                                                success: function (addResult) {
                                                    if(addResult.status == "success")
                                                        location.reload(addResult.redirect_url);
                                                    else 
                                                        alert("Unknown error!");
                                                }
                                            });
                                        } else if(response.status == "error") {
                                            alert(response.data.message);
                                        }
                                    }
                                });
                            } else {
                                alert(validate);
                            }
                        });
                    </script>
                <?php } ?>
    			<div class="box-heading" style="text-align:center">
                    <h5>This service is provided by <a href="http://smsbump.com" target="_blank"><img src="view/template/module/smsbump/smsbumplogo.png" style="max-height:19px;" /></a></h5>
                </div>

            </div> 
        </div>
    </div>
</div>
<script type="text/javascript">
$(function() {
    $('#mainTabs a:first').tab('show'); // Select first tab
    $('#preSaleTabs a:first').tab('show'); // Select first tab

    if (window.localStorage && window.localStorage['currentTab']) {
        $('.mainMenuTabs a[href="'+window.localStorage['currentTab']+'"]').tab('show');
    }
    if (window.localStorage && window.localStorage['currentSubTab']) {
        $('a[href="'+window.localStorage['currentSubTab']+'"]').tab('show');
    }
    $('.fadeInOnLoad').css('visibility','visible');
    $('.mainMenuTabs a[data-toggle="tab"]').click(function() {
        if (window.localStorage) {
            window.localStorage['currentTab'] = $(this).attr('href');
        }
    });
    $('a[data-toggle="tab"]:not(.mainMenuTabs a[data-toggle="tab"], .followup_tabs a[data-toggle="tab"])').click(function() {
        if (window.localStorage) {
            window.localStorage['currentSubTab'] = $(this).attr('href');
        }
    });


});
function enterAPIKey() {
    $('a[href=#main_settings]').trigger('click');
    $('#APIKey').attr('autofocus','autofocus');
}
</script>
<?php echo $footer; ?>