<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-money"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
        <tr>         
          <td><?php echo $column_product; ?></td>
          <td><?php echo $column_model; ?></td>
          <td class="text-right"><?php echo $column_quantity; ?></td>
	  <td class="text-right"><?php echo $column_total; ?></td>         	         
        </tr>
      </thead>
      <tbody>
        <?php if ($most_purchased) { ?>
        <?php foreach ($most_purchased as $most_purchase) { ?>
        <tr>          
          <td><?php echo $most_purchase['product']; ?></td>
          <td><?php echo $most_purchase['model']; ?></td>
          <td class="text-right"><?php echo $most_purchase['quantity']; ?></td>    
	<td class="text-right"><?php echo $most_purchase['total']; ?></td>         
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
</div>
