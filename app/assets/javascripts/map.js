function addMarker(map,markerLocation) {
	var marker = new google.maps.Marker({
		position: markerLocation,
		map: map,
		title: "The start of your adventure"
	})
}

function initialize(latitude,longitude) {
	var mapCenter = new google.maps.LatLng(latitude,longitude);
	
	var mapOptions = {
		zoom:10,
		center: mapCenter
	}

	map = new google.maps.Map(document.getElementById('map'), mapOptions);	

	addMarker(map,mapCenter);
}



function renderMap(latitude,longitude) {
	google.maps.event.addDomListener(window, 'load', initialize(latitude,longitude));
}