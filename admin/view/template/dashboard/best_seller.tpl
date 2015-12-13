<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-renren"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
        <tr>         
          <td><?php echo $column_seller; ?></td>
          <td><?php echo $column_amount; ?></td>
          <td class="text-right"><?php echo $column_sold_products; ?></td>         
        </tr>
      </thead>
      <tbody>
        <?php if ($best_sellers) { ?>
        <?php foreach ($best_sellers as $best_seller) { ?>
        <tr>          
          <td><?php echo $best_seller['seller']; ?></td>
          <td><?php echo $best_seller['amount']; ?></td>
          <td class="text-right"><?php echo $best_seller['sold']; ?></td>         
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
