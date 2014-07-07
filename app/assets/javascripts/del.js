$( document ).ready(function() {
	var deletePictures = [];
	$('#del img').on('click', function() {
		var id = $(this).attr('id');
		deletePictures.push(id);
		console.log(deletePictures);
		$(this).css('opacity','0.3');
	});
	$('#del #delete_pictures').on('click', function() {
		window.location = '/del/'+(advId+1)+'?deletePictures='+String(deletePictures);
	});
	$('#del #delete_adventure').on('click', function() {
		window.location = '/del/'+(advId+1)+'?deleteAdventure=true';
	});
});
