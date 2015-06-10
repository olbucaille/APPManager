$(document).ready(function() {

	var buttn1 = false;
	var buttn2 = false;
	var buttn3 = false;
	var buttn4 = false;
	var buttn5 = false;
	var buttn6 = false;
	var buttn7 = false;
	var buttn8 = false;

	$('#menu-rond').on('mousedown touchstart', function() {

		if (!buttn1) $(this).find('#buttn-1').css({
			'background-color': 'gray',
			'transform': 'translate(0px,125px)'
		});
		else $(this).find('#buttn-1').css({
			'background-color': 'gray',
			'transform': 'none'
		});
		if (!buttn2) $(this).find('#buttn-2').css({
			'background-color': 'gray',
			'transform': 'translate(60px,105px)'
		});
		else $(this).find('#buttn-2').css({
			'background-color': 'gray',
			'transform': 'none'
		});
		if (!buttn3) $(this).find('#buttn-3').css({
			'background-color': 'gray',
			'transform': 'translate(105px,60px)'
		});
		else $(this).find('#buttn-3').css({
			'background-color': 'gray',
			'transform': 'none'
		});
		if (!buttn4) $(this).find('#buttn-4').css({
			'background-color': 'gray',
			'transform': 'translate(125px,0px)'
		});
		else $(this).find('#buttn-4').css({
			'background-color': 'gray',
			'transform': 'none'
		});
		if (!buttn5) $(this).find('#buttn-5').css({
			'background-color': 'gray',
			'transform': 'translate(0px,190px)'
		});
		else $(this).find('#buttn-5').css({
			'background-color': 'gray',
			'transform': 'none'
		});
		if (!buttn6) $(this).find('#buttn-6').css({
			'background-color': 'gray',
			'transform': 'translate(60px,170px)'
		});
		else $(this).find('#buttn-6').css({
			'background-color': 'gray',
			'transform': 'none'
		});
		if (!buttn7) $(this).find('#buttn-7').css({
			'background-color': 'gray',
			'transform': 'translate(170px,60px)'
		});
		else $(this).find('#buttn-7').css({
			'background-color': 'gray',
			'transform': 'none'
		});
		if (!buttn8) $(this).find('#buttn-8').css({
			'background-color': 'gray',
			'transform': 'translate(190px,0px)'
		});
		else $(this).find('#buttn-8').css({
			'background-color': 'gray',
			'transform': 'none'
		});

		buttn1 = !buttn1;
		buttn2 = !buttn2;
		buttn3 = !buttn3;
		buttn4 = !buttn4;
		buttn5 = !buttn5;
		buttn6 = !buttn6;
		buttn7 = !buttn7;
		buttn8 = !buttn8;
	});

	$('.buttn').click(function() {
		$('.buttn').each(function() {
			$(this).removeClass("active");
		});
		$(this).addClass('active');
	});

	var tabmenu = ["buttn-1", "buttn-2", "buttn-3", "buttn-4", "buttn-5", "buttn-6", "buttn-7", "buttn-8"]
	for (i = 0; i < tabmenu.length; i++) {
		$('#' + tabmenu[i]).hover(function() {
			var selected = "#text-" + $(this).attr('id');
			$(selected).css({
				'display': 'block',
				'position': 'relative',
				'-webkit-animation': 'movetexton 0.5s',
				'-webkit-animation-timing-function': 'linear',
				'animation': 'movetexton 0.5s',
				'animation-timing-function': 'linear'
			});
			$('#title').css('display', 'none');
		}, function() {
			var selected = "#text-" + $(this).attr('id');
			$(selected).css('display', 'none');
			$('#title').css('display', 'block');
		});
	}
});