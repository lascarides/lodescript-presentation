$(document).ready(function(){

	var ht = Math.round(window.innerHeight);
	var wd = Math.round(window.innerWidth);

	// Set page height
	$('.step').css('min-height', ht);
	$('.step').css('min-width', wd);

	var ct = 0;
	$('.step').each(function(){
		$(this).attr('data-x', ct++ * wd);
	});	

	// Start jmpress
	$(function() {
    	$('.preso').jmpress();
	});

	$('.table').click(function(){
		$(this).find('.reveal').show();
	});

	$('.piece').click(function(){
		if ($(this).hasClass('active')) {
			$('.piece').removeClass('active');
			$(this).removeClass('active');
		} else {
			$('.piece').removeClass('active');
			$(this).addClass('active');
		}
	});

	$('.piece input').click(function(){
		return false;
	});


});