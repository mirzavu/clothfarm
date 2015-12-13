
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="pull-right">
      <ul id="salescommission" class="dropdown-menu dropdown-menu-right">
        <li><a href="day"><?php echo $text_day; ?></a></li>
        <li><a href="week"><?php echo $text_week; ?></a></li>
        <li ><a href="month"><?php echo $text_month; ?></a></li>
        <li class="active"><a href="year"><?php echo $text_year; ?></a></li>
      </ul>
    </div>
    <h3 class="panel-title"><i class="fa fa-ioxhost"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="panel-body">
    <div id="salescommission-chart" width='100%' style="width: 100%; height: 260px;">	</div>
  </div>
</div>


<script type="text/javascript">

var chart;
$('#salescommission a').on('click', function(e) { 
	e.preventDefault();
	
	$(this).parent().parent().find('li').removeClass('active');
	
	$(this).parent().addClass('active');
	
	$.ajax({
		type: 'get',
		url: 'index.php?route=dashboard/rate/getSalesCommission&token=<?php echo $token; ?>&range=' + $(this).attr('href'),
		dataType: 'json',
		success: function(json) {                        
			chart = new Highcharts.Chart({  
			chart: {
			    renderTo: 'salescommission-chart',	
			    plotBackgroundColor: null,
			    plotBorderWidth: 0,
			    plotShadow: false,			   
			    width:450	 			    			   
			},
			credits: {
		      	    enabled: false
		  	},
			exporting: {
		             enabled: false
			},
			
			title: {
			    text: json['rate'],
			    align: 'center',
			    verticalAlign: 'middle',
			    y: 10
			},
			tooltip: {
			    tooltip: {
				    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				},
			},
			
			series: [{
			    type: 'pie',
			    name: 'Amount',
			    innerSize: '50%',
			    data: [ json['sales'], json['debits'], json['commission'] ]
			}]
		   	 });												
		},
		error: function(xhr, ajaxOptions, thrownError) {
		   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});		

});

$('#salescommission .active a').trigger('click');	

</script>
