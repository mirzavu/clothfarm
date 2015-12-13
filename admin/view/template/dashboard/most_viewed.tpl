<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-eye"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
        <tr>         
          <td><?php echo $column_product; ?></td>
          <td><?php echo $column_model; ?></td>
          <td class="text-right"><?php echo $column_views; ?></td>         
        </tr>
      </thead>
      <tbody>
        <?php if ($most_viewed) { ?>
        <?php foreach ($most_viewed as $most_view) { ?>
        <tr>          
          <td><?php echo $most_view['product']; ?></td>
          <td><?php echo $most_view['model']; ?></td>
          <td class="text-right"><?php echo $most_view['views']; ?></td>         
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
