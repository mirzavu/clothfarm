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
      <div class="pull-right">
        <button type="submit" form="form-store" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-store" class="form-horizontal">
          
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              
			 <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-url"><?php echo $plan_name_label; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="plan_name" value="<?php echo $plan_name; ?>" placeholder="<?php echo $enter_plan_name; ?>" id="subject" class="form-control" />
                 <?php if ($error_plan_name) { ?>
                  <div class="text-danger"><?php echo $error_plan_name; ?></div>
                  <?php } ?>
                </div>
			</div>
			  <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-url"><?php echo $plan_amount_label; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="plan_amount" value="<?php echo $plan_amount; ?>" placeholder="<?php echo $enter_plan_amount; ?>" id="subject" class="form-control" />
                 <?php if ($error_plan_amount) { ?>
                  <div class="text-danger"><?php echo $error_plan_amount; ?></div>
                  <?php } ?>
                </div>
			</div>
			  <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-url"><?php echo $plan_days_label; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="plan_days" value="<?php echo $plan_days; ?>" placeholder="<?php echo $enter_plan_days; ?>" id="subject" class="form-control" />
                 <?php if ($error_plan_days) { ?>
                  <div class="text-danger"><?php echo $error_plan_days; ?></div>
                  <?php } ?>
                </div>
			</div>
			
			
			 <div class="form-group">
                <label class="col-sm-2 control-label" for="input-store"><?php echo "Status"; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-store" class="form-control">
                    <option value="0" <?php if($status == 1){ ?>  selected="selected" <?php } ?> ><?php echo $enable; ?></option>
                    <option value="1" <?php if($status == 2){ ?>  selected="selected" <?php } ?> ><?php echo $disable; ?></option>
					
                  </select>
                </div>
              </div>
			  
			  
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-store"><?php echo "Description"; ?></label>
                <div class="col-sm-10">
				
					<textarea name="description" class="form-control"><?php echo $description; ?></textarea>
                  
                </div>
              </div>
			  
			  
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-store"><?php echo "Highlight"; ?></label>
                <div class="col-sm-10">
				
<input type="checkbox" name="highlight" id="input-store" class="form-control" <?php if($highlight==1){ echo 'checked="checked"'; } ?>  />
                  
                </div>
              </div>
			
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('select[name=\'config_template\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent(this.value),
		dataType: 'html',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(html) {
			$('.fa-spin').remove();

			$('#template').attr('src', html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_template\']').trigger('change');
//--></script> 
  <script type="text/javascript"><!--
$('select[name=\'config_country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=setting/store/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'config_country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';
					
					if (json['zone'][i]['zone_id'] == '<?php echo $config_zone_id; ?>') {
						html += ' selected="selected"';
					}
					
					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'config_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_country_id\']').trigger('change');
//--></script></div>
<?php echo $footer; ?>
