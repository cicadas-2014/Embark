
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



// function filter() {
// 	$('.filters button').on('click',function(e){
// 		e.preventDefault();

// 		$('.filterOptions').css('display','block');
// 	})
// }


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
	filter();
	imageGallery();
	imageListLoad(speed);
	galleryCaptions()
};

function imageListLoad(speed){
	$(
		'#adventuresPage').hide()
	$('#adventuresPage').fadeTo(speed,1)
}

imageGallery = function() {
	$('div.show_images').on('click', '.smallimage', function(e) {
		e.preventDefault();
		var new_image_source = e.target.getAttribute('src')
		$('img#main_image').attr('src', new_image_source);
	});
};

<link rel="stylesheet" href="css/justifiedGallery.css" />
<script src="js/jquery.justifiedGallery.js"></script>

function galleryCaptions() {
	$("#gallery").justifiedGallery();
});
}


$(document).ready(ready)
$(document).on('page:load', ready);










