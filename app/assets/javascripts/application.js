
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
	var speed = 800
	$('#background').stop().fadeTo(speed*4,0.7)
	$('a').hover(function(){
		console.log(true)
		$('#background').stop().fadeTo(speed,0.9)

	},function(){
		$('#background').stop().fadeTo(speed*2,0.7)
		})

	$('#search a').on('click',function(e){
		e.preventDefault();
		getUserLocation($(this).attr('href'))
	})
};
$(document).ready(ready)
$(document).on('page:load', ready);









