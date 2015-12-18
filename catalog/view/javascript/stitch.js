$(document).ready(function() {

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

	$('#stitch').on("click",function(){
		console.log('sdfgsdfsfgsdf');
		$.fancybox.close();
		$('#content').hide();
		$('#content-new').show();
		//$('#measure-trigger').click();
	});

});