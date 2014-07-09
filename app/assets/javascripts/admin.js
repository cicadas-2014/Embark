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

$('#colorboxExample').justifiedGallery({
	lastRow : 'nojustify', 
	rowHeight : 100, 
	rel : 'gallery1', //replace with 'gallery1' the rel attribute of each link
	margins : 1
}).on('jg.complete', function () {
	$(this).find('a').colorbox({
		maxWidth : '80%',
		maxHeight : '80%',
		opacity : 0.8,
		transition : 'elastic',
		current : ''
	});
});


});

