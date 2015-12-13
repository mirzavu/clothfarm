<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><i class="icon-puzzle"></i>  <?php echo $heading_title; ?> <?php echo $version; ?></h1>
      <div class="buttons"><?php if(isset($stores)){ ?>
        <select onChange="location='<?php echo $module_link; ?>&store_id='+$(this).val()">
          <?php foreach($stores as $store){ ?>
          <?php if($store['store_id'] ==  $store_id){ ?>
          <option value="<?php echo $store['store_id']; ?>" selected="selected" ><?php echo $store['name']; ?></option>
          <?php }else{ ?>
          <option value="<?php echo $store['store_id']; ?>" ><?php echo $store['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
        <?php } ?><a onclick="saveAndStay();" class="button"><?php echo $button_save_and_stay; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div class="htabs" id="tabs_htabs"> 
          <a href="#modules" class="htab-item"><span class="icon-puzzle"></span> Modules</a>
          <a href="#settings" class="htab-item"><span class="icon-settings"></span> Settings</a>
          <a href="#instructions" class="htab-item"><span class="icon-graduation-cap"></span> Instructions</a> </div>
      <div id="modules" class="htab-content">
        <div class="tab-body">

          
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_size; ?></td>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="d_social_login_module[<?php echo $module_row; ?>][size]">
                  <?php if ($module['size'] == 'icons') { ?>
                  <option value="icons" selected="selected"><?php echo $text_icons; ?></option>
                  <?php } else { ?>
                  <option value="icons"><?php echo $text_icons; ?></option>
                  <?php } ?>
                  <?php if ($module['size'] == 'small') { ?>
                  <option value="small" selected="selected"><?php echo $text_small; ?></option>
                  <?php } else { ?>
                  <option value="small"><?php echo $text_small; ?></option>
                  <?php } ?>
                  <?php if ($module['size'] == 'medium') { ?>
                  <option value="medium" selected="selected"><?php echo $text_medium; ?></option>
                  <?php } else { ?>
                  <option value="medium"><?php echo $text_medium; ?></option>
                  <?php } ?>
                  <?php if ($module['size'] == 'large') { ?>
                  <option value="large" selected="selected"><?php echo $text_large; ?></option>
                  <?php } else { ?>
                  <option value="large"><?php echo $text_large; ?></option>
                  <?php } ?>
                  <?php if ($module['size'] == 'huge') { ?>
                  <option value="huge" selected="selected"><?php echo $text_huge; ?></option>
                  <?php } else { ?>
                  <option value="huge"><?php echo $text_huge; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="d_social_login_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="d_social_login_module[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected">Within content</option>
                  <?php } else { ?>
                  <option value="content_top">Within content</option>
                  <?php } ?>
                  <?php if ($module['position'] == 'footer_modules') { ?>
                  <option value="footer_modules" selected="selected">Header login</option>
                  <?php } else { ?>
                  <option value="footer_modules">Header login</option>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="d_social_login_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="d_social_login_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="5"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      

        </div>
      </div>

      <div id="settings" class="htab-content">
        <div class="tab-body table-form">
          <div class="row">
            <div class="col-sm-2 th">
              <div class="wrap-5"><?php echo $text_version_check; ?></div>
            </div>
            <div class="col-sm-5">
              <div class="wrap-5"><a onClick="versionCheck('<?php echo $route; ?>', '#version_result', '<?php echo $token; ?>')" class="button"><?php echo $button_version_check; ?></a></div>
            </div>
            <div class="col-sm-5"><div id="version_result" class="wrap-5"></div></div>
          </div>

          <div class="row">
            <div class="col-sm-2 th">
              <div class="wrap-5"><?php echo $text_base_url_index; ?></div>
            </div>
            <div class="col-sm-5">
              <div class="wrap-5"><input type="hidden" name="d_social_login_settings[base_url_index]" value="0" />
                  <input type="checkbox" name="d_social_login_settings[base_url_index]" <?php echo ($setting['base_url_index'])? 'checked="checked"':'';?> value="1" id="d_social_login_settings_base_url_index"/></div>
            </div>
            <div class="col-sm-5"></div>
          </div>

          <div class="row">
            
            <div class="col-sm-2 th"><div class="wrap-5"><?php echo $text_sort_order; ?></div></div>
            <div class="col-sm-7">
              <div id="providers_sort_order_form" class="sortable atab wrap-5">
              <?php foreach($providers as $key => $provider) { ?>
                <div class="row atab-item sort-item">
                  <div class="col-sm-5">
                  <input type="hidden" name="d_social_login_settings[providers][<?php echo $key; ?>][enabled]" value="0" />
                  <input type="checkbox" name="d_social_login_settings[providers][<?php echo $key; ?>][enabled]" <?php echo ($provider['enabled'])? 'checked="checked"':'';?> value="1" id="d_social_login_settings_providers_<?php echo $key; ?>_enabled"/>
                  <label for="d_social_login_settings_providers_<?php echo $key; ?>_enabled"><i class="<?php echo $provider['icon']; ?>"></i> <?php echo ${'text_'.$provider['id']}; ?></label>
                  <input type="hidden" name="d_social_login_settings[providers][<?php echo $key; ?>][sort_order]" class="sort-value" value="<?php echo $provider['sort_order']; ?>" /><span class="dsl-icon-<?php echo $provider['id']; ?>"></span>
                  </div>
                  <div class="col-sm-5">
                    <label><?php echo $text_background_color; ?></label>
                    <input type="hidden" name="d_social_login_settings[providers][<?php echo $key; ?>][background_color]" class="color-picker" value="<?php echo $provider['background_color']; ?>" />
                    <label><?php echo $text_background_color_active; ?></label>
                    <input type="hidden" name="d_social_login_settings[providers][<?php echo $key; ?>][background_color_active]" class="color-picker" value="<?php echo $provider['background_color_active']; ?>" />
                  </div>
                  <span class="icon-drag"></span>
                </div>
              <?php } ?>
              </div>
              <script>
                $(function() {
                    $( "#providers_sort_order_form" ).sortable({
                      axis: "y",
                      placeholder: "ui-state-highlight",
                      distance: 5,
                      stop: function( event, ui ) {
                        ui.item.children( ".sort-item" ).triggerHandler( "focusout" );
                    $(this).find(".sort-item").each(function(i, el){
                      $(this).find(".sort-value").val($(el).index())
                    });
                      }
                    });
                });
              $(function() {
                  $('.color-picker').colorpicker({
                      parts: 'simple',
                      showOn: 'both',
                      buttonColorize: true,
                      showNoneButton: true,
                      alpha: true,
                      colorFormat: '#HEX'
                  });
              });

              </script>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-2 th">
              <div class="wrap-5"><?php echo $text_fields_sort_order; ?></div>
            </div>
            <div class="col-sm-7">
                <div id="fields_sort_order_form" class="sortable atab wrap-5">
                <?php foreach($fields as $field) { ?>
                <div class="row atab-item sort-item">
                  <div class="col-sm-5">
                  <input type="hidden" name="d_social_login_settings[fields][<?php echo $field['id']; ?>][enabled]" value="0" />
                  <input type="checkbox" name="d_social_login_settings[fields][<?php echo $field['id']; ?>][enabled]" <?php echo ($field['enabled'])? 'checked="checked"':'';?> value="1" id="d_social_login_settings_fields_<?php echo $field['id']; ?>_enabled" />
                  <label for="d_social_login_settings_fields_<?php echo $field['id']; ?>_enabled"><?php echo ${'text_'.$field['id']}; ?></label>
                  <input type="hidden" name="d_social_login_settings[fields][<?php echo $field['id']; ?>][sort_order]" class="sort-value" value="<?php echo $field['sort_order']; ?>" />
                  <input type="hidden" name="d_social_login_settings[fields][<?php echo $field['id']; ?>][type]" class="sort-value" value="<?php echo $field['type']; ?>" />
                  <input type="hidden" name="d_social_login_settings[fields][<?php echo $field['id']; ?>][id]" class="sort-value" value="<?php echo $field['id']; ?>" />
                  </div>
                  <?php if(isset($field['mask'])) {?>
                    <label class="col-sm-2">
                      <?php echo $text_mask; ?>
                    </label>
                    <div class="col-sm-3"><input type="text" name="d_social_login_settings[fields][<?php echo $field['id']; ?>][mask]" value="<?php echo $field['mask']; ?>" />
                    </div>
                  <?php } ?>
                  <span class="icon-drag"></span>
                </div>
               <?php } ?>
             </div>
             <script>
                $(function() {
                    $( "#fields_sort_order_form" ).sortable({
                      axis: "y",
                      placeholder: "ui-state-highlight",
                      distance: 5,
                      stop: function( event, ui ) {
                        ui.item.children( ".sort-item" ).triggerHandler( "focusout" );
                    $(this).find(".sort-item").each(function(i, el){
                      $(this).find(".sort-value").val($(el).index())
                    });
                      }
                    });
                });
              </script>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-2 th">
              <div class="wrap-5"><?php echo $text_return_url; ?></div>
            </div>
            <div class="col-sm-5">
              <div class="wrap-5">
                <select name="d_social_login_settings[return_url]">
                  <?php foreach($return_urls as $return_url) {?>
                    <option value="<?php echo $return_url; ?>" <?php echo ($setting['return_url'] == $return_url) ? 'selected="selected"' : ''; ?> ><?php echo $return_url; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-2 th">
              <div class="wrap-5"><?php echo $text_background_img; ?></div>
            </div>
            <div class="col-sm-5">
              <div class="wrap-5">

                <div class="image"><img src="<?php echo $background_img_thumb; ?>" alt="" id="background_img_thumb" />
                  <input type="hidden" id="background_img" name="d_social_login_settings[background_img]" value="<?php echo $setting['background_img']; ?>" id="logo" />
                  <br />
                  <a onclick="image_upload('background_img', 'background_img_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#background_img_thumb').attr('src', '<?php echo $no_image; ?>'); $('#background_img').attr('value', '');"><?php echo $text_clear; ?></a></div>
              </div>
            </div>
          </div>

          <script type="text/javascript"><!--
            function image_upload(field, thumb) {
              $('#dialog').remove();
              
              $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
              
              $('#dialog').dialog({
                title: '<?php echo $text_image_manager; ?>',
                close: function (event, ui) {
                  if ($('#' + field).attr('value')) {
                    $.ajax({
                      url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
                      dataType: 'text',
                      success: function(data) {
                        $('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
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
            //--></script>
          
          <div class="callout callout-warning"><h4><?php echo $warning_app_settings; ?></h4><p><?php echo $warning_app_settings_full; ?></p></div>

          <?php foreach($providers as $key => $provider) { ?>
            <div class="row">
              <h3><i class="<?php echo $provider['icon']; ?>"></i> <?php echo ${'text_'.$provider['id']}. ' '.$text_app_settings ?><input type="hidden" name="d_social_login_settings[providers][<?php echo $key; ?>][id]" value="<?php echo $provider['id']; ?>" /></h3>
            </div>
            <?php foreach($provider['keys'] as $k => $v){ ?>
            <div class="row">
              <div class="col-sm-2 th">
                <div class="wrap-5"><?php echo ${'text_app_'.$k}; ?></div>
              </div>
              <div class="col-sm-5">
                <div class="wrap-5">
                  <input type="text" name="d_social_login_settings[providers][<?php echo $key; ?>][keys][<?php echo $k; ?>]" value="<?php echo $v; ?>" />          
                          
                </div>
              </div>
            </div>
            <?php } ?>
          <?php } ?>
          
        </div>
      </div>
      <div id="instructions" class="htab-content">
        <div class="tab-body">
          <?php echo $text_instructions_full; ?>
        </div>
      </div>
      <script>
          $('#tabs_htabs a').tabs();
      </script>
      <!-- htabs-->
      </form>
    </div>
  </div><!-- .box -->
</div><!-- #content -->

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {  
  html  = '<tbody id="module-row' + module_row + '">';
  html += '  <tr>';
  html += '    <td class="left"><select name="d_social_login_module[' + module_row + '][size]">';
  html += '      <option value="icons"><?php echo $text_icons; ?></option>';
  html += '      <option value="small"><?php echo $text_small; ?></option>';
  html += '      <option value="medium"><?php echo $text_medium; ?></option>';
  html += '      <option value="larg"><?php echo $text_large; ?></option>';
  html += '      <option value="huge"><?php echo $text_huge; ?></option>';
  html += '    </select></td>';
  html += '    <td class="left"><select name="d_social_login_module[' + module_row + '][layout_id]">';
  <?php foreach ($layouts as $layout) { ?>
  html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
  <?php } ?>
  html += '    </select></td>';
  html += '    <td class="left"><select name="d_social_login_module[' + module_row + '][position]">';
  html += '      <option value="content_top">Within content</option>';
  html += '      <option value="footer_modules">Header login</option>';
  html += '    </select></td>';
  html += '    <td class="left"><select name="d_social_login_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
  html += '    <td class="right"><input type="text" name="d_social_login_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
  html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
  html += '  </tr>';
  html += '</tbody>';
  
  $('#module tfoot').before(html);
  
  module_row++;
}
//--></script> 
<?php echo $footer; ?>