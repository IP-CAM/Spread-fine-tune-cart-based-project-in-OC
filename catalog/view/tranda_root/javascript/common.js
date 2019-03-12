$(document).ready(function() {
	setTimeout(function() {
		/* Menu */
		$('#menu ul > li > a + div').each(function(index, element) {
			var menu = $('#menu').offset();
			var dropdown = $(this).parent().offset();
			i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
			if (i > 0) {
				$(this).css('margin-left', '-' + (i + 5) + 'px');
			}
		});
		
		/* Fixed Menu */
		$(function () {
		  var msie6 = $.browser == 'msie' && $.browser.version < 7;
		  if (!msie6) {
			var top = $('#bottomh').offset().top;
			$(window).scroll(function (event) {
			  var y = $(this).scrollTop();
			  if (y >= top) { $('#bottomh').addClass('bottomfixed'); }
			  else { $('#bottomh').removeClass('bottomfixed'); }
			});
		  }
		});
	
		$(function () {
		  var msie6 = $.browser == 'msie' && $.browser.version < 7;
		  if (!msie6) {
			var top = $('#bottomh').offset().top;
			$(window).scroll(function (event) {
			  var y = $(this).scrollTop();
			  if (y >= top) {
				$('#bottomh').addClass('bottomfixed');
			  } else {
				$('#bottomh').removeClass('bottomfixed');
			  }
			});
		  }
		});
	
		/* Margin Menu */
		$(function () {
		  var msie6 = $.browser == 'msie' && $.browser.version < 7;
		  if (!msie6) {
			var top = $('#bottomh').offset().top;
			$(window).scroll(function (event) {
			  var y = $(this).scrollTop();
			  if (y >= top) { $('#container').addClass(' topmargin'); }
			  else { $('#container').removeClass(' topmargin'); }
			});
		  }
		});
	
		$(function () {
		  var msie6 = $.browser == 'msie' && $.browser.version < 7;
		  if (!msie6) {
			var top = $('#bottomh').offset().top;
			$(window).scroll(function (event) {
			  var y = $(this).scrollTop();
			  if (y >= top) {
				$('#container').addClass(' topmargin');
			  } else {
				$('#container').removeClass(' topmargin');
			  }
			});
		  }
		});
	}, 500);
						   
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('input[name=\'search\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('#header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Ajax Home */
	$('#links_home').live('hover', function() {
		$('#home_content_links').addClass('home_content_active');
		$('#links_home').addClass('active');
	});
	
	$('.links_home').live('mouseleave', function() {
		$('#home_content_links').removeClass('home_content_active');
		$('#links_home').removeClass('active');
	});
	
	/* Ajax My Account */
	$('#links_my_account').live('hover', function() {
		$('#my_account_content_links').addClass('my_account_content_active');
		$('#links_my_account').addClass('active');
	});
	
	$('.links_my_account').live('mouseleave', function() {
		$('#my_account_content_links').removeClass('my_account_content_active');
		$('#links_my_account').removeClass('active');
	});
	
	/* Ajax Category */
	$('#links_category').live('hover', function() {
		$('#category_content_links').addClass('category_content_active');
		$('#links_category').addClass('active');
	});
	
	$('.links_category').live('mouseleave', function() {
		$('#category_content_links').removeClass('category_content_active');
		$('#links_category').removeClass('active');
	});

	/* Ajax Cart */
	$('#cart .heading').live('hover', function() {
		$('#cart').addClass('active');
		$('#cart').load('index.php?route=module/cart #cart > *');
	});
	
	$('.shop-cart .active').live('mouseleave', function() {
		$('#cart').removeClass('active');
	});

	$('.notification_view .close').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	

});

function quantityMore(){
	var quantity = parseInt($('#quantity').val());
	if(quantity > 0){
		$('#quantity').val(quantity+1);
	}         
	return false;
}

function quantityLess(){
	var quantity = parseInt($('#quantity').val());
	if(quantity > 1){
		$('#quantity').val(quantity-1);
	}         
	return false;
}

function getURLVar(urlVarName) {
	var urlHalves = String(document.location).toLowerCase().split('?');
	var urlVarValue = '';
	
	if (urlHalves[1]) {
		var urlVars = urlHalves[1].split('&');

		for (var i = 0; i <= (urlVars.length); i++) {
			if (urlVars[i]) {
				var urlVarPair = urlVars[i].split('=');
				
				if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
					urlVarValue = urlVarPair[1];
				}
			}
		}
	}
	
	return urlVarValue;
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
				$('#notification').html('<div class="notification_view"><div class="success" style="display: none;"><i class="icon-shopping-cart info_icon"></i> ' + json['success'] + '</div><span class="close"><i class="icon-remove-circle"></i></span></div>');
				
				$('.success').fadeIn('slow');
				
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}

function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="notification_view"><div class="success" style="display: none;"><i class="icon-file-alt info_icon"></i> ' + json['success'] + '</div><span class="close"><i class="icon-remove-circle"></i></span></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="notification_view"><div class="success" style="display: none;"><i class="icon-exchange info_icon"></i> ' + json['success'] + '</div><span class="close"><i class="icon-remove-circle"></i></span></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}