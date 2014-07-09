
var scrollToImages = function() {
	$('body').scrollTop($('#tagline').parent().height() - $('#header').height() *3 + 2);
}


$(document).ready(function() {
	$('body').on('click', '#compass a', scrollToImages);
  // $('#compass').mouseenter(function(){
  //   $(this).css('width',70);
  //   $('#inspire').css('visibility','visible')
  // }).mouseleave(function(){
  //   $(this).css('width',50);
  //   $('#inspire').css('visibility','hidden')
  // })
})