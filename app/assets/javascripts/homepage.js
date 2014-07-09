function startAnimation(speed){
	setTimeout(function() {
		$('#homepage .logo').fadeTo(speed,1);
		setTimeout(function() {
			$('#homepage #tagline').fadeTo(speed,1);
			setTimeout(function() {
				$('#homepage .bigButton').fadeTo(speed,1);
				$('#homepage video').fadeTo(speed,1);
			},speed)
		},speed)
	},speed/2)
}

function buttonEffects(speed){
	$('#homepage a').hover(function(){
		$('#homepage #background').stop().fadeTo(speed/2,0.6)
	},function(){
		$('#homepage #background').stop().fadeTo(speed/2,1)
	})

	$('#homepage #search a').on('click',function(e){
		e.preventDefault();
		getUserLocation($(this).attr('href'))
		$('#homepage a').fadeTo(speed,0)
		$('#homepage #background').fadeTo(speed,0)
		setTimeout(function() {$('#homepage #background').hide()},speed)
		$('#homepage #logo').fadeTo(speed,0)
	})
};
ready = function(){
	var speed = 1600
	$('#homepage .logo').hide();
	$('#homepage #tagline').hide();
	$('#homepage .bigButton').hide();
	$('#homepage video').hide();
	startAnimation(speed)
	buttonEffects(speed)
};

$(document).ready(ready)
$(document).on('page:load', ready);

