<html>
<head>
  <title>Login</title>
  <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript"  src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script type="text/javascript"  src="<?php echo $http; ?>catalog/view/javascript/social_login_free/jquery.maskedinput.min.js"></script></head>
<body id="<?php echo $provider ?>">
<style>
body{
  background: <?php echo $background_color; ?>;
  background-image: url('<?php echo $http; ?>image/<?php echo $background_img; ?>');
  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}

#dsl_email{
  width: 400px;
  margin: 0 auto;
  text-align: center;
}

#dsl_email_form{
  padding: 20px;
  background: #fff;
  border: 1px solid #ccc;
  margin-top: 20px;
  border-radius: 6px;
  box-shadow: 0px 3px 8px 0px rgba(0,0,0,0.4);
}
#dsl_email_form > div{
  margin-bottom: 10px;
}
input, select{
  display: inline-block;
  height: 34px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
  box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
  -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
  transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
  vertical-align: middle;
  width:212px
}
input.error, select.error{
  background: #f2dede;
  border: 1px solid #ebccd1}
.button{
  display: inline-block;
  margin-bottom: 0;
  font-weight: 400;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  background-image: none;
  border: 1px solid transparent;
  white-space: nowrap;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  border-radius: 4px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  color: #fff;
  background-color: #428bca;
  border-color: #357ebd;
  width: 150px;
}
.wait{
  position: absolute;
  margin: 5px;
}
#dsl_email_intro{
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid transparent;
  border-radius: 4px;
  box-sizing: border-box;
  background-color: #dff0d8;
  border-color: #d6e9c6;
  color: #333;
  text-align: justify;
  margin-bottom: 20px;
  line-height: 1.4;
}
#dsl_error{
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid transparent;
  border-radius: 4px;
  box-sizing: border-box;
  background-color: #f2dede;
  border-color: #ebccd1;
  color: #a94442;
}
#dsl_profile_image{
  height: 32px;
  vertical-align: middle;
  border: 1px solid #ccc;
  margin-right: 4px;
  border-radius: 5px;
}
</style>

<div id="dsl_email">
  <div class="holder">
    <div class="popup">
      <form id="dsl_email_form">
        <div id="dsl_email_intro"><?php echo $text_email_intro; ?></div>
         <?php if(!$profile['email']){ ?>
         <div>
          <input type="text" id="email" name="email" value="<?php echo $profile['email']; ?>" placeholder="<?php echo $text_email; ?>"/>
        </div>
        <?php } ?>
          <?php foreach($fields as $field){ ?>
            <?php if($field['enabled']) { ?> 
            <div>
            <?php if($field['type'] == "select"){ ?>
              <select id="<?php echo $field['id']; ?>"  name="<?php echo $field['id']; ?>">
                <?php if($field['id']=='country_id') { ?>
                  <?php foreach($countries as $country) {?>
                  <option value="<?php echo $country['country_id']; ?>" <?php echo ($country['country_id'] == $profile_value[$field['id']]) ? 'selected="selected"': ''; ?>><?php echo $country['name']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            <?php }else{ ?>
              <input type="<?php echo $field['type']; ?>" id="<?php echo $field['id']; ?>" name="<?php echo $field['id']; ?>" value="<?php echo (isset($profile_value[$field['id']])) ? $profile_value[$field['id']] : ''; ?>" placeholder="<?php echo ${'text_'.$field['id']}; ?>" autocomplete="off"/>
             <?php } ?>
           </div>
             <?php if(isset($field['mask']) && $field['mask']){ ?>
               <script>
               $(document).ready(function() {
                   $("#<?php echo $field['id']; ?>").mask("<?php echo $field['mask']; ?>");
                })
               </script>
             <?php } ?> 
          <?php } ?> 
        <?php } ?> 
        <div>
          <?php if($profile['photoURL']){ ?><img src="<?php echo $profile['photoURL']; ?>" id="dsl_profile_image" /><?php } ?><a id="dsl_email_submit" class="button"><?php echo $button_sign_in_mail; ?></a>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {

  

    $('#dsl_email_submit').on('click', function(){
      console.log($( '#dsl_email_form' ).serialize());
      $.ajax({
          url: '<?php echo $http; ?>index.php?route=module/social_login_free/create_with_email&provider=<?php echo $provider; ?>',
          type: 'post',
          data:    $( '#dsl_email_form' ).serialize(),
          dataType: 'json',
          beforeSend: function() {
            $('#dsl_email_submit').prop('disabled', true);
            $('#dsl_email_submit').after('<span class="wait fa fa-refresh fa-spin"></span>');
          },
          complete: function() {
            $('#dsl_email_submit').prop('disabled', false);
            $('.wait').remove();
          },
          success: function(json) {
            console.log(json)
            $('#dsl_error').remove()
            $('.error').removeClass('error')
            if(json['error']){
              $('#dsl_email_intro').after('<div id="dsl_error">'+json['error']+'</div>')
            }
            if(json['empty']){
              $.each( json['empty'], function( i, l ){
                $( "#" + l ).addClass('error');
              });
            }
            if(json['url']){
              window.location.replace(json['url']);
            }
            
          },
          error: function(xhr, ajaxOptions, thrownError) {
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
    })
  })
</script>
<script type="text/javascript"><!--
$('#dsl_email_form select[name=\'country_id\']').bind('change', function() {
  if (this.value == '') return;
  $.ajax({
    url: '<?php echo $http; ?>index.php?route=checkout/checkout/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('#dsl_email_form select[name=\'country_id\']').after('<span class="wait fa fa-refresh fa-spin"></span>');
    },
    complete: function() {
      $('.wait').remove();
    },      
    success: function(json) {
      
      html = '<option value=""><?php echo $text_select; ?></option>';
      
      if (json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
            html += '<option value="' + json['zone'][i]['zone_id'] + '"';
            html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }
      
      $('#dsl_email_form select[name=\'zone_id\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('#dsl_email_form select[name=\'country_id\']').trigger('change');
//--></script>
</body>
</html>