$(window).bind('load', function() {
   $('#wrapper').delay(400).fadeTo( "slow" , 1);
   $('#loader').fadeOut();
});

$(window).load(function() {
	$('#project-slider ul.slides img, #story-slider ul.slides img').each(function() {
		$(this).wrapAll('<li></li>');
	});

	if ($(window).width() > 767) {
		$('#story-slider .flexslider, #home-slider .flexslider, #testimonial-slider .flexslider, #project-slider .flexslider').flexslider({
	    animation: "fade",
		directionNav: false,
		touch: true,
		pauseOnAction: true, //Boolean: Pause the slideshow when interacting with control elements, highly recommended.
		pauseOnHover: false, //Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering
		useCSS: false //{NEW} Boolean: Slider will use CSS3 transitions if available
	  });
	} else {
		$('#story-slider .flexslider, #home-slider .flexslider, #testimonial-slider .flexslider').flexslider({
	    animation: "slide",
		directionNav: false,
		touch: true,
		pauseOnAction: true, 
		pauseOnHover: false, 
		useCSS: false
	  });
	}
	centerSliderNav();
	$('#contact-form .ajax-loader').attr('src', '/wp-content/themes/cobblehill/images/ajax-loader.gif');
	colorTransition();
	
});

$(document).ready(function() {
	
	fadeNavitems();
	if ($(window).width() > 1024) {homeCtas();}
	centerSliderNav();
	$('.page-header a').addClass('button white');
	colorTransition();
	setInputFieldFunctions();
	$('*').removeAttr( "title" );
	$('input[type="checkbox"]').addClass('customCheckbox');
	$('.customCheckbox').iCheck({
	    checkboxClass: 'icheckbox_minimal',
	    radioClass: 'iradio_minimal',
	    increaseArea: '20%' // optional
	});	
    $('#contact-form .ajax-loader').attr('src', '/wp-content/themes/cobblehill/images/preloader.gif');
	

});

$(window).resize(function() {
	// if ($(window).width() > 1024) {homeCtas();}
	centerSliderNav();
	colorTransition();

});

$(window).scroll(function() {
	if ($(window).width() > 999) {
 		var sT = $(this).scrollTop();
        if (sT >= 10) {
            $('#header').addClass('scrolled');
			$('#header .logo').css({'background-position':'0 -18px'});
			$('#header .hamburger').css({'background-position':'0 -28px'});
			//$('#cat-cont').css({'position': 'fixed', 'top': 77});
        }else {
            $('#header').removeClass('scrolled');
			$('#header .logo, #header .hamburger').css({'background-position':'0 0'});
			//$('#cat-cont').css({'position': 'relative', 'top': 0});
        }
	}
	if ($(window).width() > 1229) {
		/* Check the location of each desired element */
		$('.hideme').each( function(i){
		    var bottom_of_object = $(this).position().top + $('#featured-cont').height();
		    var bottom_of_window = $(window).scrollTop() + $(window).height() + 805;
		    /* If the object is completely visible in the window, fade it it */
		    if( bottom_of_window > bottom_of_object ){
		        $(this).animate({'opacity':'1'},500);
		    }
		}); 
	}
	
});


function setInputFieldFunctions(){
	$('input, textarea').each(function(){
	    var $this = $(this);
	    $this.data('placeholder', $this.attr('placeholder'))
	         .focus(function(){$this.removeAttr('placeholder');})
	         .blur(function(){$this.attr('placeholder', $this.data('placeholder'));});
	});
}


function fadeNavitems() {
   var lis = $('#nav ul li').hide();          
	$('.hamburger').click(function() {
		$('#nav').animate({'top':0 +'px'}, 500, 'swing');
		var winH = $(document).height();
		
		    var i = 0;   
		setTimeout(function() {
		(function displayImages() {
			$('#nav .logo, #nav .close').fadeIn('slow');
		        lis.eq(i++).fadeIn(200, displayImages);
		     })();
		}, 500); 
		if ($(window).width() < 1000) {
			$('#nav').css({'height': winH});
		}
	}); 

	$('#cat-cont .cat-sort').click(function() {
		$('#cat-cont .cat-list').slideToggle();
	});
	$('#nav .close').click(function() {
		$('#nav').animate({'top':-380 +'px'}, 500, 'swing');
		$('#nav ul li, #nav .logo, #nav .close').hide();
		$('#nav').css({'height': 'auto'});
	});
}

function colorTransition() {
	originalColor = $('#footer .contact a').css('color');
	originalBg = $('#footer .social-icon').css('background-color'); 
	originalBorder = $('.button').css('border-color');
	originalBtnBg = $('.button').css('background-color'); 
	originalBtnColor = $('.button').css('color');
	$('#footer .contact a, #cat-cont .cat-list li a, #contact .contact a, .blog-link').hover(function() { 
		var colors = ["#ee3823","#fdb818","#2ba0a3"];  
		var rand = Math.floor(Math.random()*colors.length);
		$(this).animate({'color': colors[rand]}, 500);
	},function() {
		$(this).animate({'color': originalColor},500);
	});
	$('.social-icon').hover(function() { 
		var colors = ["#ee3823","#fdb818","#2ba0a3"];  
		var rand = Math.floor(Math.random()*colors.length);
		$(this).animate({'background-color': colors[rand]}, 500);
	},function() {
		$(this).animate({'background-color': originalBg},500);
	});
	$('#footer .signup-cont #mc-embedded-subscribe').hover(function() { 
		var colors = ["#ee3823","#fdb818","#2ba0a3"];  
		var rand = Math.floor(Math.random()*colors.length);
		$('#footer .signup-cont .arrow').animate({'background-color': colors[rand]}, 500);
	},function() {
		$('#footer .signup-cont .arrow').animate({'background-color': originalBg},500);
	});
	$('.button.white').hover(function() { 
		var colors = ["#ee3823","#fdb818","#2ba0a3"];  
		var rand = Math.floor(Math.random()*colors.length);
		$(this).animate({'background-color': colors[rand], 'color': originalBtnColor, 'border-color': colors[rand]}, 500);
	},function() {
		$(this).animate({'background-color': originalBtnBg, 'color': originalBtnColor, 'border-color': '#231f20'},300);
	});
	$('.button.black').hover(function() { 
		var colors = ["#ee3823","#fdb818","#2ba0a3"];  
		var rand = Math.floor(Math.random()*colors.length);
		$(this).animate({'background-color': colors[rand], 'color': '#231f20', 'border-color': colors[rand]}, 500);
	},function() {
		$(this).animate({'background-color': '#231f20', 'color': '#fff', 'border-color': '#fff'},300);
	});
	$('.blog-cont .entry-title a, .blog-cont .entry-meta a, .blog-cont .post-excerpt a').hover(function() { 
		var colors = ["#ee3823","#fdb818","#2ba0a3"];  
		var rand = Math.floor(Math.random()*colors.length);
		$(this).animate({'color': colors[rand]}, 300);
	},function() {
		$(this).animate({'color': '#231F20'},300);
	});
	$('#post-nav .nav-links a, .latest-posts .entry-title a').hover(function() { 
		var colors = ["#ee3823","#fdb818","#2ba0a3"];  
		var rand = Math.floor(Math.random()*colors.length);
		$(this).animate({'color': colors[rand]}, 300);
		$(this).children('.mid-cont').children('.arrow').animate({'background-color': colors[rand]});
	},function() {
		$(this).animate({'color': '#231F20'},300);
		$(this).children('.mid-cont').children('.arrow').animate({'background-color': '#231F20'});
	});
	var colors = ["#ee3823","#fdb818","#2ba0a3"];  
	var rand = Math.floor(Math.random()*colors.length);
	$('#cat-cont .current-menu-item a').css({'color': colors[rand]});
	$('#cat-cont .current-menu-item a').hover(function() { 
		var colors = ["#ee3823","#fdb818","#2ba0a3"];  
		var rand = Math.floor(Math.random()*colors.length);
		$(this).animate({'color': colors[rand]}, 500);
	},function() {
		$(this).animate({'color': colors[rand]},500);
	});
	
}

function scrollToHome() {
	$('body').scrollTo($('#section1'), 1000 );
}



function homeCtas() {
	$('#cta-cont .cta').each(function() {
		$(this).on({
			mouseenter: function(){$(this).children('.no-hover').hide(); $(this).children('.for-hover').css({'opacity':1}); $(this).children('.for-hover').fadeIn('slow'); },
			mouseleave: function(){$(this).children('.for-hover').hide(); $(this).children('.for-hover').css({'opacity':0}); $(this).children('.no-hover').fadeIn('slow');}
		});
	});

}

function centerSliderNav() {
	var navW = $('.flex-control-nav').width();
	var contW= $('.flexslider').width();
	$('.flex-control-nav').css({'left': (contW - navW)/2});
}

