
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="pull-right"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-calendar"></i> <i class="caret"></i></a>
      <ul id="sales" class="dropdown-menu dropdown-menu-right">
        <li><a href="day"><?php echo $text_day; ?></a></li>
        <li><a href="week"><?php echo $text_week; ?></a></li>
        <li ><a href="month"><?php echo $text_month; ?></a></li>
        <li class="active"><a href="year"><?php echo $text_year; ?></a></li>
      </ul>
    </div>
    <h3 class="panel-title"><i class="fa fa-align-right"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="panel-body">
    <div id="sales-chart" width='100%' style="width: 100%; height: 260px;">	</div>
  </div>
</div>


<script type="text/javascript">

var chart;
$('#sales a').on('click', function(e) { 
	e.preventDefault();
	
	$(this).parent().parent().find('li').removeClass('active');
	
	$(this).parent().addClass('active');
	
	$.ajax({
		type: 'get',
		url: 'index.php?route=dashboard/chart/chart&token=<?php echo $token; ?>&range=' + $(this).attr('href'),
		dataType: 'json',
		success: function(json) {                        
			chart = new Highcharts.Chart({  
			chart: {
			    renderTo: 'sales-chart',
			    type: 'line',	
			    width:460			    			   
			},
			title: {
			    text: '<?php echo $text_sub_title; ?>'
			},
			
			credits: {
		      	    enabled: false
		  	},
			exporting: {
		             enabled: false
			},
			xAxis: {
			    categories: json['xaxis'],
			    crosshair: true
			},
			yAxis: [{ // Primary yAxis
			    labels: {
				//format: '{value}°C',
				style: {
				    color: Highcharts.getOptions().colors[1]
				}
			    },
			    title: {
				text: 'Orders',
				style: {
				    color: Highcharts.getOptions().colors[1]
				}
			    }
			}, { // Secondary yAxis
			    title: {
				text: 'Sales',
				style: {
				    color: Highcharts.getOptions().colors[0]
				}
			    },
			    labels: {
				//format: '{value} mm',
				style: {
				    color: Highcharts.getOptions().colors[0]
				}
			    },
			    opposite: true
			}],
			tooltip: {
			    shared: true
			},
			legend: {
			    layout: 'vertical',
			    align: 'left',
			    x: 80,
			    verticalAlign: 'top',
			    y: 40,
			    floating: true,
			    backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
			},
			series: [
				json['order'], json['sales'] 
			]
		   	 });												
		},
        error: function(xhr, ajaxOptions, thrownError) {
           alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});		

});

$('#sales .active a').trigger('click');	

</script>
