
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="pull-right"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-calendar"></i> <i class="caret"></i></a>
      <ul id="transaction" class="dropdown-menu dropdown-menu-right">
        <li><a href="day"><?php echo $text_day; ?></a></li>
        <li><a href="week"><?php echo $text_week; ?></a></li>
        <li ><a href="month"><?php echo $text_month; ?></a></li>
        <li class="active"><a href="year"><?php echo $text_year; ?></a></li>
      </ul>
    </div>
    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="panel-body">
    <div id="transaction-chart" width='100%' style="width: 100%; height: 260px;">	</div>
  </div>
</div>


<script type="text/javascript">

var chart;
$('#transaction a').on('click', function(e) { 
	e.preventDefault();
	
	$(this).parent().parent().find('li').removeClass('active');
	
	$(this).parent().addClass('active');
	
	$.ajax({
		type: 'get',
		url: 'index.php?route=dashboard/transaction/getSales&token=<?php echo $token; ?>&range=' + $(this).attr('href'),
		dataType: 'json',
		success: function(json) {                        
			chart = new Highcharts.Chart({  
			chart: {
			    renderTo: 'transaction-chart',
			    type: 'column',	
			    width:950	 			    			   
			},
			credits: {
		      	    enabled: false
		  	},
			exporting: {
		             enabled: false
			},
			title: {
				text: '<?php echo $text_sub_title; ?>'
			},
			xAxis: {
				categories: json['xaxis']
			},
			yAxis: {
				min: 0,
				title: {
					text: '<?php echo $text_y_axis; ?>'
				},			
			},
			tooltip: {
			    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				'<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
			    footerFormat: '</table>',
			    shared: true,
			    useHTML: true
			},
			plotOptions: {
			    column: {
				pointPadding: 0.2,
				borderWidth: 0
			    }
			},
			series: [json['order']]
		   	 });												
		},
		error: function(xhr, ajaxOptions, thrownError) {
		   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});		

});

$('#transaction .active a').trigger('click');	

</script>
