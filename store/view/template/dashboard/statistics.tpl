
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="pull-right">
      <ul id="statistics" class="dropdown-menu dropdown-menu-right">
        <li><a href="day"><?php echo $text_day; ?></a></li>
        <li><a href="week"><?php echo $text_week; ?></a></li>
        <li ><a href="month"><?php echo $text_month; ?></a></li>
        <li class="active"><a href="year"><?php echo $text_year; ?></a></li>
      </ul>
    </div>
    <h3 class="panel-title"><i class="fa fa-money"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="panel-body">
    <div id="statistics-chart" width='100%' style="width: 100%; height: 260px;">	</div>
  </div>
</div>


<script type="text/javascript">

var chart;
$('#statistics a').on('click', function(e) { 
	e.preventDefault();
	
	$(this).parent().parent().find('li').removeClass('active');
	
	$(this).parent().addClass('active');
	
	$.ajax({
		type: 'get',
		url: 'index.php?route=dashboard/statistics/getSales&token=<?php echo $token; ?>&range=' + $(this).attr('href'),
		dataType: 'json',
		success: function(json) {                        
			chart = new Highcharts.Chart({  
			chart: {
			    renderTo: 'statistics-chart',
			    type: 'pie',	
			    width:460	 			    			   
			},
			credits: {
		      	    enabled: false
		  	},
			exporting: {
		             enabled: false
			},
			title: {
				text: ''
			},
			tooltip: {
			    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions: {
			    pie: {
				allowPointSelect: true,
				cursor: 'pointer',
				dataLabels: {
				    enabled: true,
				    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
				    style: {
					color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				    }
				}
			    }
			},
			series: [{
				    type: 'pie',
				    name: 'Net Percentage',
				    data: json['statistics']
			        }]
		   	 });												
		},
		error: function(xhr, ajaxOptions, thrownError) {
		   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});		

});

$('#statistics .active a').trigger('click');	

</script>
