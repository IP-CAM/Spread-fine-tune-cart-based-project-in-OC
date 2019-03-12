$(document).ready(function() {
	$('.jbtitle').click(function() {
		$('.jbtitle').removeClass('jbopen');
		$('.jbcontent').slideUp('normal');
		if($(this).next().is(':hidden') == true) {
			$(this).addClass('jbopen');
			$(this).next().slideDown('normal');
	} 
});

$('.jbtitle').mouseover(function() {
	$(this).addClass('jbover');
	}).mouseout(function() {
		$(this).removeClass('jbover');										
	});
	$('.jbcontent').hide();
});

$(document).ready(function() {
	$('.jbchildren').click(function() {
		$('.jbchildren').removeClass('jbchildopen');
		$('.jbchildrenlist').slideUp('normal');
		if($(this).next().is(':hidden') == true) {
			$(this).addClass('jbchildopen');
			$(this).next().slideDown('normal');
	} 
});

$('.jbchildren').mouseover(function() {
	$(this).addClass('jbchildover');
	}).mouseout(function() {
		$(this).removeClass('jbchildover');										
	});
	$('.jbchildrenlist').hide();
});