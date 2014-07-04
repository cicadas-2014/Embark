
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$( document ).ready(function() {
	var speed = 800

	// $('a').hover(function(){
	// console.log(true)
	// var values = [300,0]
	// var radius1 = values[Math.floor(Math.random() * values.length)];
	// var radius2 = values[Math.floor(Math.random() * values.length)];
	// var radius3 = values[Math.floor(Math.random() * values.length)];
	// var radius4 = values[Math.floor(Math.random() * values.length)];
	// 	$('#background').stop().fadeTo(speed,1)
	// 	$(this).css('border','none')
	// 	$(this).animate({
	// 		'border-top-left-radius': radius1,
	// 		'border-top-right-radius': radius2,
	// 		'border-bottom-right-radius': radius3,
	// 		'border-bottom-left-radius': radius4
	// 	},speed);
	// },function(){
	// 	$(this).animate({
	// 		'border-top-left-radius': '300px',
	// 		'border-top-right-radius': '300px',
	// 		'border-bottom-right-radius': '300px',
	// 		'border-bottom-left-radius': '300px'
	// 	},speed);
	// 	$('#background').stop().fadeTo(speed*2,0.2)
	// })

	$('a').hover(function(){
	console.log(true)
	var values = [300,0]
	var radius1 = values[Math.floor(Math.random() * values.length)];
	var radius2 = values[Math.floor(Math.random() * values.length)];
	var radius3 = values[Math.floor(Math.random() * values.length)];
	var radius4 = values[Math.floor(Math.random() * values.length)];
		$('#background').stop().fadeTo(speed,1)
		$('a').css('border','none')
		$('a').stop().animate({
			'border-top-left-radius': radius1,
			'border-top-right-radius': radius2,
			'border-bottom-right-radius': radius3,
			'border-bottom-left-radius': radius4
		},speed);
	},function(){
		$('a').stop().animate({
			'border-top-left-radius': '300px',
			'border-top-right-radius': '300px',
			'border-bottom-right-radius': '300px',
			'border-bottom-left-radius': '300px'
		},speed);
		$('#background').stop().fadeTo(speed*2,0.2)
	})
});
