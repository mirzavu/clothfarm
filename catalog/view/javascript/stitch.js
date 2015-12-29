$(function(){ 
   var  i=0;
   $('.imgbox ul').each(function(){
   i=i+1;
   console.log();
   var ulwidth = $(this).children().length * 148;
   $(this).css({width:ulwidth});
   })

   $('.lftArr').click(function(){
   $(this).parent().find('.imgbox').animate({scrollLeft: '-=888'},1000)
    })
  $('.rgtArr').click(function(){

     $(this).parent().find('.imgbox').animate({scrollLeft: '+=888'},1000)
    })
})

$(function(){
 $('.measure-tab button.btn-measure').hover(function() {
        var imgpath = $(this).attr('rel');
        var dummytext = $(this).attr('id');
        $('.howMesure').css({ 'display': 'none' });
        $('#' + dummytext + 'text').css({ 'display': 'block' });
        $('.DummyImg').attr('src', 'images/stitch/' + imgpath + '.jpg');

    }, function() {
    	var tab = $('ul#measure-nav li.active').attr('id');

        $('.howMesure').css({ 'display': 'none' });
        if(tab == "salwartab")
            $('.DummyImg').attr('src', 'images/stitch/measure-dummy.jpg');
        else if(tab == "sareetab")
        	$('.DummyImg').attr('src', 'images/stitch/saree-dummy.jpg');
        else
        	$('.DummyImg').attr('src', 'images/stitch/lehenga-dummy.jpg');
    });
})

$(document).ready(function() {

	//material type selection
	$('.imgbox li img').click(function(){
		$(this).parent().siblings().each(function(){
			$(this).children().removeClass('active');
		});
		$(this).addClass('active');
	});

	$('#measure-done-salwar').click(function(){
		//Validation for salwar
		var flag=1;
		$('#salwar-tab input').each(function(){
			if($(this).val()=='')
			{
				$(this).css({"border-color": "red"});
				$(this).focus();
				flag=0;
			}
		});
		if(flag==0)
			return false;
		var all_measure = '';
		$('#salwar-tab .btn-measure').each(function(){
			var rel = $(this).attr('rel');
			var measure_input = $(this).next().children('input').val();
			all_measure += '"'+rel+'":"'+measure_input+'",';
		});

		all_measure = all_measure.slice(0,-1);
		var measure_list = '{"type":"Salwar","data":{'+all_measure+'}}';
		console.log(measure_list);
		$('#input-measures').val(measure_list);
		$('#input-stitch-type').val('salwar');
		console.log($('#input-stitch-type'));
		$('#content-new').hide();
		$('#content').show();
		$('html,body').animate({
        scrollTop: $("#content").offset().top},
        'slow');
		$('#button-cart').click();
	});

	$('#measure-done-saree').click(function(){
		var flag=1;
		$('#saree-tab input').each(function(){
			if($(this).val()=='')
			{
				$(this).css({"border-color": "red"});
				$(this).focus();
				flag=0;
			}
		});
		if(flag==0)
			return false;
		console.log('asdasd');
		var all_measure = '';
		$('#saree-tab .btn-measure').each(function(){
			var rel = $(this).attr('rel');
			var measure_input = $(this).next().children('input').val();
			all_measure += '"'+rel+'":"'+measure_input+'",';
		});
		all_measure = all_measure.slice(0,-1);
		var measure_list = '{"type":"Saree","data":{'+all_measure+'}}';
		console.log(measure_list);
		$('#input-measures').val(measure_list);
		$('#input-stitch-type').val('saree');
		console.log($('#input-stitch-type'));
		$('#content-new').hide();
		$('#content').show();
		$('html,body').animate({
        scrollTop: $("#content").offset().top},
        'slow');
		$('#button-cart').click();
	});

	$('#measure-done-choli').click(function(){
		var flag=1;
		$('#choli-tab input').each(function(){
			if($(this).val()=='')
			{
				$(this).css({"border-color": "red"});
				$(this).focus();
				flag=0;
			}
		});
		if(flag==0)
			return false;
		var all_measure = '';
		$('#choli-tab .btn-measure').each(function(){
			var rel = $(this).attr('rel');
			var measure_input = $(this).next().children('input').val();
			all_measure += '"'+rel+'":"'+measure_input+'",';
		});
		all_measure = all_measure.slice(0,-1);
		var measure_list = '{"type":"Choli","data":{'+all_measure+'}}';
		console.log(measure_list);
		$('#input-measures').val(measure_list);
		$('#input-stitch-type').val('choli');
		console.log($('#input-stitch-type'));
		$('#content-new').hide();
		$('#content').show();
		$('html,body').animate({
        scrollTop: $("#content").offset().top},
        'slow');
		$('#button-cart').click();
	});

	//Changing images on tab change
	$('#measure-nav li').click(function(){
		var tab = $(this).attr('id');
        if(tab == "salwartab")
            $('.DummyImg').attr('src', 'images/stitch/measure-dummy.jpg');
        else if(tab == "sareetab")
        	$('.DummyImg').attr('src', 'images/stitch/saree-dummy.jpg');
        else
        	$('.DummyImg').attr('src', 'images/stitch/lehenga-dummy.jpg');
	});

	$('.btn-measure').hover(function(){
		$(this).next().children('input').focus();
	});
	$('a.pop').mouseout(function() {
		setTimeout(function(){
		  $('a.pop').show();
		}, 0.001);
		
	});
	$('[data-toggle="popover"]').popover();   
	$('.mam').fancybox({
		'beforeLoad': function(){
		 $('html,body').animate({
        scrollTop: $("#content").offset().top},
        'slow');
		  },
		maxWidth	: 412,
		maxHeight	: 300,
		fitToView	: false,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});

	$('.mam2').fancybox({
		maxWidth	: 490,
		maxHeight	: 500,
		fitToView	: true,
		width		: '55%',
		height		: '80%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none',
		'onComplete': function() {
      $("#fancybox-wrap").css({'top':'20px', 'bottom':'auto'});
   }
	});

	$('#nostitch').on("click",function(){
		$.fancybox.close();
		$('#button-cart').click();
	});

	//on popup stitch farm click
	$('#stitch-ready').on("click",function(){
		$.fancybox.close();
		$('#content').hide();
		$('#content-new').show();
		$('html,body').animate({
        scrollTop: $("#header_type1").offset().top},
        'slow');
		//$('#measure-trigger').click();
	});

	$('#stitch-material').on("click",function(){
		$.fancybox.close();
		$('#content').hide();
		$('#content-dress').show();
		$('html,body').animate({
        scrollTop: $("#header_type1").offset().top},
        'slow');
		//$('#measure-trigger').click();
	});

});