
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="pull-right">
      <ul id="userrange" class="dropdown-menu dropdown-menu-right">
        <li><a href="day"><?php echo $text_day; ?></a></li>
        <li><a href="week"><?php echo $text_week; ?></a></li>
        <li ><a href="month"><?php echo $text_month; ?></a></li>
        <li class="active"><a href="year"><?php echo $text_year; ?></a></li>
      </ul>
    </div>
    <h3 class="panel-title"><i class="fa fa-users"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="panel-body">
    <div id="user-count" width='100%' style="width: 100%; height: 260px;">	</div>
  </div>
</div>


<script type="text/javascript">

var chart;
$('#userrange a').on('click', function(e) { 
	e.preventDefault();
	
	$(this).parent().parent().find('li').removeClass('active');
	
	$(this).parent().addClass('active');
	
	$.ajax({
		type: 'get',
		url: 'index.php?route=dashboard/user/getUsers&token=<?php echo $token; ?>&range=' + $(this).attr('href'),
		dataType: 'json',
		success: function(json) {                        
			chart = new Highcharts.Chart({  
			chart: {
			    renderTo: 'user-count',
			    type: 'pie',
			    plotBackgroundColor: null,
			    plotBorderWidth: null,
			    plotShadow: false,
			    spacingLeft: 10,
        		    spacingRight: 100,	
			 	
			},
			title: {
			    text: '<?php echo $text_chart_title; ?>'
			},
		        subtitle: {
			    text: '<?php echo $text_chart_sub_title; ?>'
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
			credits: {
		      		enabled: false
		  		},
			exporting: {
		                enabled: false
			        },
			series: [{
				    type: 'pie',
				    name: '<?php echo $text_chart_sub_name; ?>',
				    data: json['users']
				}]
		   	 });												
		},
        error: function(xhr, ajaxOptions, thrownError) {
           alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});	
	$(window).resize();

});

$('#userrange .active a').trigger('click');	

</script>
