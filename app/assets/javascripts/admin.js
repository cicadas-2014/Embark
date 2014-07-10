$( document ).ready(function() {
	var deletePictures = [];

	$('#admin img').on('click', function() {
		var id = $(this).attr('id');
		deletePictures.push(id);
		$(this).css('opacity','0.3');
	});

	$('#admin #delete_pictures').on('click', function() {
		window.location = '/admin/'+(cityId+1)+'?deletePictures='+String(deletePictures);
	});
	$('#admin #delete_adventure').on('click', function() {
		window.location = '/admin/'+(cityId+1)+'?deleteAdventure=true';
	});
});
