var scrolled = 0;

var scrollToImages = function() {
	scrolled += $('#tagline').parent().height();
	$('body').animate({scrollTop:($('#tagline').parent().height() - $('#header').height() *3 + 2), 'slow');
	// $('body').scrollTop($('#tagline').parent().height() - $('#header').height() *3 + 2);
}


$(document).ready(function() {
	$('body').on('click', '#compass a', scrollToImages);
})