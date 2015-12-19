$(function(){
   var  i=0;
   $('.imgbox ul').each(function(){
   i=i+1;
   $(this).css({width:$('#'+i+ ' ul li').length*148});
   })

   $('.lftArr').click(function(){
   $(this).parent().find('.imgbox').animate({scrollLeft: '-=888'},1000)
    })
  $('.rgtArr').click(function(){
     $(this).parent().find('.imgbox').animate({scrollLeft: '+=888'},1000)
    })
})

$(function(){
 $('.measure-tab button').hover(function() {
        var imgpath = $(this).attr('rel');
        var dummytext = $(this).attr('id');
        $('.howMesure').css({ 'display': 'none' });
        $('#' + dummytext + 'text').css({ 'display': 'block' });
        $('.DummyImg').attr('src', 'images/stitch/' + imgpath + '.jpg');

    }, function() {
        $('.howMesure').css({ 'display': 'none' });
            $('.DummyImg').attr('src', 'images/stitch/measure-dummy.jpg');
    });
})

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
		$.fancybox.close();
		$('#content').hide();
		$('#content-new').show();
		$('html,body').animate({
        scrollTop: $("#header_type1").offset().top},
        'slow');
		//$('#measure-trigger').click();
	});

});