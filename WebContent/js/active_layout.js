$(document).ready(function(){
	$('.nav li a').click(function() {
		$('.nav li a').each(function(){
			$(this).removeClass("active");
		});
		$(this).addClass('active');
	});
});