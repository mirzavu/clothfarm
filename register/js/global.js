
$(window).load(function () {
    "use strict";

    
    // Preloader
    $("#status").fadeOut();
    $("#preloader").delay(350).fadeOut("slow");

    // Placeholder support for older browsers
    $('[placeholder]').focus(function () {
        var input = $(this);
        if (input.val() == input.attr('placeholder')) {
            input.val('');
            input.removeClass('placeholder');
        }
    }).blur(function () {
        var input = $(this);
        if (input.val() == '' || input.val() == input.attr('placeholder')) {
            input.addClass('placeholder');
            input.val(input.attr('placeholder'));
        }
    }).blur().parents('form').submit(function () {
        $(this).find('[placeholder]').each(function () {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
            }
        })
    });


});


(function ($) {
    "use strict";

    // Background images

    // Duration is the amount of time in between slides,
    // and fade is value that determines how quickly the next image will fade in
    $.backstretch([
      "images/background/1.jpg"
    , "images/background/2.jpg"
    , "images/background/3.jpg"
    , "images/background/4.jpg"
    ],
    { duration: 7000, fade: 800 });

    // date Format: mm/dd/yyyy
    $('.countdown').downCount({
        date: '5/27/2015'
    });

    // Dropdown hover
    $(".dropdown-panel-handle ul").fadeTo(0, 0);
    $(".dropdown-panel-handle").hover(
      function () {
          $(".dropdown-panel-handle ul").stop(true).fadeTo("normal", 1);
      },
      function () {
          $(".dropdown-panel-handle ul").fadeTo("normal", 0);
      }
    );



    // Show/hide page content on click
    $(document).ready(function () {
        $("#content-area").each(function () {
            $(this).find("section:lt(1)").show()
        })
    })

    $('.tab-container a').click(function () {
        var index = $('.tab-container a').index(this);
        $('#content-area').children().hide().eq(index).fadeIn();
        $('.tab-container').children().removeClass('active');
        $(this).addClass('active');
    });

    // Slider
     $("#owl-slider").owlCarousel({
        navigation: true,
        pagination: true,
        items: 3,
        navigationText: false
     });


    // Subscribe
    $('#submit').click(function () {		

	    var name = $('input[name=name]');
		var email = $('input[name=email]');
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		var emailVal = email.val();
		var website = $('input[name=website]');
		var comment = $('textarea[name=comment]');

		//validate
		if (name.val()=='') {
			name.addClass('hightlight');
			return false;
		} else name.removeClass('hightlight');
		
		if (email.val()=='') {
		    email.addClass('hightlight');
            email.attr('placeholder','Email required');
			return false;
		} else email.removeClass('hightlight');

        if (!emailReg.test(emailVal)){
            email.addClass('hightlight');
        return false;
        } else email.removeClass('hightlight');
		
		if (comment.val()=='') {
			comment.addClass('hightlight');
			return false;
		} else comment.removeClass('hightlight');
		
		var data = 'name=' + name.val() + '&email=' + email.val() + '&website=' + 
		website.val() + '&comment='  + encodeURIComponent(comment.val());
		
		//disabled all the text fields
		$('.text').attr('disabled','true');
		
		$('#loading').show();
		
		$.ajax({
			//this is the php file that processes the data and send mail
			url: "subscribe.php",	
			type: "GET",
			data: data,		
			cache: false,
			
			//success
			success: function (html) {				
				//if process.php returned 1/true (send mail success)
				if (html==1) {					
					$('.form').hide();					
					$('.done').fadeIn('slow');
					
				//if process.php returned 0/false (send mail failed)
				} else alert('Sorry, unexpected error. Please try again later.');				
			}	
		});
		//cancel the submit button default behaviours
		return false;
	});	

})(jQuery);

