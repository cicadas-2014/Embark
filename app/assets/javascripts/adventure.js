
var scrollToImages = function() {
	$('body').scrollTop($('#tagline').parent().height() - $('#header').height() *3 + 2);
}


$(document).ready(function() {
	$('body').on('click', '#compass a', scrollToImages);
  $('#compass').mouseenter(function(){
    $(this).css('font-size',70);
  }).mouseleave(function(){
    $(this).css('font-size',60);
  })
})