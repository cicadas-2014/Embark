
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function getUserLocation(search) {
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position){
			var lat = position.coords.latitude;
			var lon = position.coords.longitude;
			console.log(search+'&latitude='+lat+'&longitude='+lon);
			window.location = search+'&latitude='+lat+'&longitude='+lon;
		},displayError);
	} else {
		document.getElementById('locationData').innerHTML = "Sorry - your browser doesn't support geolocation!";
	}
}
function redirect(position, search){

}
function displayError(error){
	var locationElement = document.getElementById("locationData");
	switch(error.code) {
		case error.PERMISSION_DENIED:
		locationElement.innerHTML = "Permission was denied";
		break;
		case error.POSITION_UNAVAILABLE:
		locationElement.innerHTML = "Location data not available";
		break;
		case error.TIMEOUT:
		locationElement.innerHTML = "Location request timeout";
		break;
		case error.UNKNOWN_ERROR:
		locationElement.innerHTML = "An unspecified error occurred";
		break;
		default:
		locationElement.innerHTML = "Who knows what happened...";
		break;
	}
}

ready = function(){
	var speed = 1200
	startAnimation(speed)
	buttonEffects(speed)
	imageGallery();
};

function startAnimation(speed){
	$('#home a').hide();
	$('#home #logo').fadeTo(speed,1)
	setTimeout(function() {
		$('#home #logo').animate({
			'font-size':'100px',
			'letter-spacing': '0.1em'
		},speed*2)
		$('#home #background').stop().fadeTo(speed*2,1)
		setTimeout(function() {
			$('#home a').fadeTo(speed,1)
		},speed*1.5)
	},speed)
}
function buttonEffects(speed){
	$('#home a').hover(function(){
		$('#home #background').stop().fadeTo(speed/2,0.6)
	},function(){
		$('#home #background').stop().fadeTo(speed/2,1)
	})

	$('#home #search a').on('click',function(e){
		e.preventDefault();
		getUserLocation($(this).attr('href'))
	})
};

imageGallery = function() {
	$('div.show_images').on('click', '.smallimage', function(e) {
		e.preventDefault();
		var new_image_source = e.target.getAttribute('src')
		$('img#main_image').attr('src', new_image_source);
	});
};




$(document).ready(ready)
$(document).on('page:load', ready);









