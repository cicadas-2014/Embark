function initialize(latitude,longitude) {
	var mapCenter = new google.maps.LatLng(latitude,longitude);
	
	var mapOptions = {
		zoom:10,
		center: mapCenter
	}

	map = new google.maps.Map(document.getElementbyId('map'),mapOptions);	
}



function renderMap(latitude,longitude) {
	google.maps.event.addDomListener(window, 'load', initialize(latitude,longitude));
}