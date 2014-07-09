$(document).ready(function() {
	$("#myGallery").magnificPopup({
		delegate: "a",
		type: "image",
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1]
		},
		zoom: {
			enabled: true,
			duration: 300,
			opener: function(element) {
				return element.find('img');
			}
		}
	});
});