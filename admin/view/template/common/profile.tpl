<div id="profile">
  <div><a class="dropdown-toggle" data-toggle="dropdown">
<?php if(!empty($image)){ ?><i class="fa fa-user" style="font-size:40px;float:left;"></i> <?php } ?>
<img src="<?php echo $image; ?>" alt="<?php echo $firstname; ?> <?php echo $lastname; ?>" title="<?php echo $username; ?>" class="img-circle" /></a></div>
  <div>
    <h4><?php echo $firstname; ?> <?php echo $lastname; ?></h4>
    <small><?php echo $user_group; ?></small></div>
</div>
