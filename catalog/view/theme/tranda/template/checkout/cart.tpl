<?php echo $header; ?>
<div class="container-top">
    <div class="gpc">
    	<!-- START CONTENT TOP -->
        <div class="content-top">
            <!-- START BREADCRUMB -->
            <h1 class="page_title"><?php echo $heading_title; ?><?php if ($weight) { ?>&nbsp;(<?php echo $weight; ?>)<?php } ?></h1>
            <div class="breadcrumb">
            	<h2>
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                <?php } ?>
                </h2>
            </div>
            <!-- END BREADCRUMB -->
        </div>
        <!-- END CONTENT TOP -->
    </div>
</div>
<div class="container-bottom">
    <div class="gpc">
    	<?php echo $column_left; ?>
        <?php echo $column_right; ?>
        <!-- START COLUMN CENTER -->
        <div class="column-center">
            <div class="page_notification">
                <?php if ($attention) { ?>
                <div class="attention"><i class="icon-exclamation-sign info_icon"></i><?php echo $attention; ?></div>
                <?php } ?>
                <?php if ($success) { ?>
                <div class="success"><i class="icon-ok info_icon"></i><?php echo $success; ?></div>
                <?php } ?>
                <?php if ($error_warning) { ?>
                <div class="warning"><i class="icon-warning-sign info_icon"></i><?php echo $error_warning; ?></div>
                <?php } ?>
            </div>
            <?php echo $content_top; ?> 
            <!-- START CART PAGE -->
            <div class="cart-page">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="cart-info">
                  <table>
                    <thead>
                      <tr>
                        <td class="name" colspan="2"><?php echo $column_name; ?></td>
                        <td class="quantity"><?php echo $column_quantity; ?></td>
                        <td class="total"><?php echo $column_total; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($products as $product) { ?>
                      <tr>
                        <td class="image"><?php if ($product['thumb']) { ?>
                          <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                          <?php } else { ?>
                          <a class="no-image" href="<?php echo $product['href']; ?>"><i class="icon-camera"></i></a>
                          <?php } ?></td>
                        <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                          <?php if (!$product['stock']) { ?>
                          <span class="stock">***</span>
                          <?php } ?>
                          <p class="model"><b><?php echo $column_model; ?>:</b> <?php echo $product['model']; ?></p>
                          <div>
                            <?php foreach ($product['option'] as $option) { ?>
                            <small>- <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                            <?php } ?>
                          </div>
                          <?php if ($product['reward']) { ?>
                          <small><?php echo $product['reward']; ?></small>
                          <?php } ?></td>
                        <td class="quantity">
                        	<div>
                                <a class="quantitymenu" onclick="quantity<?php echo $product['key']; ?>Less();"><i class="icon-minus"></i></a>
                                <input type="text" id="quantity<?php echo $product['key']; ?>" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                                <a class="quantitymenu" onclick="quantity<?php echo $product['key']; ?>More();"><i class="icon-plus"></i></a>
                            </div>
                            <div class="button_update">
                                <input class="input_update" type="image" src="catalog/view/tranda_root/stylesheet/img/opac.png" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_update; ?>" />
                                <a class="link_update"><i class="icon-magic"></i></a>
                            </div>
                            <a href="<?php echo $product['remove']; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_remove; ?>"><i class="<?php if($this->config->get('tranda_icon_remove') != '') { ?><?php echo $this->config->get('tranda_icon_remove'); ?><?php } else { ?>icon-trash<?php } ?>"></i></a>
                        </td>
                        <td class="total"><?php echo $product['total']; ?><p class="price"><?php echo $column_price; ?>: <?php echo $product['price']; ?></p></td>
                      </tr>
                      <script type="text/javascript"><!--
						function quantity<?php echo $product['key']; ?>More(){
							var quantity = parseInt($('#quantity<?php echo $product["key"]; ?>').val());
							if(quantity > 0){
								$('#quantity<?php echo $product["key"]; ?>').val(quantity+1);
							}         
							return false;
						}
						function quantity<?php echo $product['key']; ?>Less(){
							var quantity = parseInt($('#quantity<?php echo $product["key"]; ?>').val());
							if(quantity > 1){
								$('#quantity<?php echo $product["key"]; ?>').val(quantity-1);
							}         
							return false;
						}
					   //--></script>
                      <?php } ?>
                      <?php foreach ($vouchers as $vouchers) { ?>
                      <tr>
                        <td class="image"><span class="no-image"><i class="icon-gift"></i></span></a></td>
                        <td class="name"><?php echo $vouchers['description']; ?></td>
                        <td class="quantity">
                            <input type="text" name="" value="1" size="1" disabled="disabled" class="disabled" style="display:none;" />
                            <a href="<?php echo $vouchers['remove']; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_remove; ?>"><i class="<?php if($this->config->get('tranda_icon_remove') != '') { ?><?php echo $this->config->get('tranda_icon_remove'); ?><?php } else { ?>icon-trash<?php } ?>"></i></a>
                        </td>
                        <td class="total"><?php echo $vouchers['amount']; ?><p class="price"><?php echo $column_price; ?>: <?php echo $vouchers['amount']; ?></p></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                  </table>
                </div>
                </form>
                <?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>
                <div class="left_cart_page">
                    <div class="panel">
                        <p class="text_info"><?php echo $text_next_choice; ?></p>
                        <table class="radio">
                          <?php if ($coupon_status) { ?>
                          <tr>
                            <td><?php if ($next == 'coupon') { ?>
                              <input type="radio" name="next" value="coupon" id="use_coupon" checked="checked" />
                              <?php } else { ?>
                              <input type="radio" name="next" value="coupon" id="use_coupon" />
                              <?php } ?></td>
                            <td><label for="use_coupon"><?php echo $text_use_coupon; ?></label></td>
                          </tr>
                          <?php } ?>
                          <?php if ($voucher_status) { ?>
                          <tr>
                            <td><?php if ($next == 'voucher') { ?>
                              <input type="radio" name="next" value="voucher" id="use_voucher" checked="checked" />
                              <?php } else { ?>
                              <input type="radio" name="next" value="voucher" id="use_voucher" />
                              <?php } ?></td>
                            <td><label for="use_voucher"><?php echo $text_use_voucher; ?></label></td>
                          </tr>
                          <?php } ?>
                          <?php if ($reward_status) { ?>
                          <tr>
                            <td><?php if ($next == 'reward') { ?>
                              <input type="radio" name="next" value="reward" id="use_reward" checked="checked" />
                              <?php } else { ?>
                              <input type="radio" name="next" value="reward" id="use_reward" />
                              <?php } ?></td>
                            <td><label for="use_reward"><?php echo $text_use_reward; ?></label></td>
                          </tr>
                          <?php } ?>
                          <?php if ($shipping_status) { ?>
                          <tr>
                            <td><?php if ($next == 'shipping') { ?>
                              <input type="radio" name="next" value="shipping" id="shipping_estimate" checked="checked" />
                              <?php } else { ?>
                              <input type="radio" name="next" value="shipping" id="shipping_estimate" />
                              <?php } ?></td>
                            <td><label for="shipping_estimate"><?php echo $text_shipping_estimate; ?></label></td>
                          </tr>
                          <?php } ?>
                        </table>
                    </div>
                    <div class="cart-module">
                        <div class="panel_content" id="coupon" style="display: <?php echo ($next == 'coupon' ? 'block' : 'none'); ?>;">
                          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <div class="gpu_box_form">
                                <div class="gpu_form">
                                    <p><?php echo $entry_coupon; ?></p>
                                    <div>
                                        <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
                                        <input type="hidden" name="next" value="coupon" />
                                    </div>
                                </div>
                                <div class="gpu_form">
                                    <div><input type="submit" value="<?php echo $button_coupon; ?>" class="button but_yellow" /></div>
                                </div>
                            </div>
                          </form>
                        </div>
                        <div class="panel_content" id="voucher" style="display: <?php echo ($next == 'voucher' ? 'block' : 'none'); ?>;">
                          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <div class="gpu_box_form">
                                <div class="gpu_form">
                                    <p><?php echo $entry_voucher; ?></p>
                                    <div>
                                        <input type="text" name="voucher" value="<?php echo $voucher; ?>" />
                                        <input type="hidden" name="next" value="voucher" />
                                    </div>
                                </div>
                                <div class="gpu_form">
                                    <div><input type="submit" value="<?php echo $button_voucher; ?>" class="button but_yellow" /></div>
                                </div>
                            </div>
                          </form>
                        </div>
                        <div class="panel_content" id="reward" style="display: <?php echo ($next == 'reward' ? 'block' : 'none'); ?>;">
                          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <div class="gpu_box_form">
                                <div class="gpu_form">
                                    <p><?php echo $entry_reward; ?></p>
                                    <div>
                                        <input type="text" name="reward" value="<?php echo $reward; ?>" />
                                        <input type="hidden" name="next" value="reward" />
                                    </div>
                                </div>
                                <div class="gpu_form">
                                    <div><input type="submit" value="<?php echo $button_reward; ?>" class="button but_yellow" /></div>
                                </div>
                            </div>
                          </form>
                        </div>
                        <div class="panel_content" id="shipping" style="display: <?php echo ($next == 'shipping' ? 'block' : 'none'); ?>;">
                            <div class="gpu_box_form">
                            	<div class="info-form-content"><p><?php echo $text_shipping_detail; ?></p></div>
                                <div class="gpu_form">
                                    <p><span class="required">* </span><?php echo $entry_country; ?></p>
                                    <div>
                                      <select name="country_id">
                                          <option value=""><?php echo $text_select; ?></option>
                                          <?php foreach ($countries as $country) { ?>
                                          <?php if ($country['country_id'] == $country_id) { ?>
                                          <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                          <?php } else { ?>
                                          <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                          <?php } ?>
                                          <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="gpu_form">
                                    <p><span class="required">* </span><?php echo $entry_zone; ?></p>
                                    <div><select name="zone_id"></select></div>
                                </div>
                                <div class="gpu_form">
                                    <p><span id="postcode-required" class="required">* </span><?php echo $entry_postcode; ?></p>
                                    <div><input type="text" name="postcode" value="<?php echo $postcode; ?>" /></div>
                                </div>
                                <div class="gpu_form">
                                    <div><input type="button" id="button-quote" value="<?php echo $button_quote; ?>" class="button but_yellow" /></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php } ?>
                <div class="right_cart_page">
                    <div class="cart-total">
                        <table id="total">
                            <?php foreach ($totals as $total) { ?>
                                <tr>
                                    <td class="right"><b><?php echo $total['title']; ?>:</b></td>
                                    <td class="right"><?php echo $total['text']; ?></td>
                                </tr>
                            <?php } ?>
                        </table>
                    </div>
                </div>
                <div class="buttons">
                    <div class="left"><a href="<?php echo $continue; ?>" class="button but_black"><i class="icon-reply"></i><?php echo $button_shopping; ?></a></div>
                    <div class="right"><a href="<?php echo $checkout; ?>" class="button but_green"><i class="<?php if($this->config->get('tranda_icon_checkout') != '') { ?><?php echo $this->config->get('tranda_icon_checkout'); ?><?php } else { ?>icon-credit-card<?php } ?>"></i><?php echo $button_checkout; ?></a></div>
                </div>
            </div>
            <!-- END CART PAGE -->
        </div>
        <!-- END COLUMN CENTER -->
    	<!-- START CONTENT BOTTOM -->
        <div class="content-bottom">
            <?php echo $content_bottom; ?>
        </div>
        <!-- END CONTENT BOTTOM -->
    </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function() {
	$('.cart-module > div').hide();
	
	$('#' + this.value).show();
});
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--
$('#button-quote').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/quote',
		type: 'post',
		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-quote').attr('disabled', true);
			$('#button-quote').after('<span class="wait"><i class="icon-spinner icon-spin"></i></span>');
		},
		complete: function() {
			$('#button-quote').attr('disabled', false);
			$('.wait').remove();
		},		
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();			
						
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="notification_view"><div class="warning" style="display: none;"><i class="icon-warning-sign info_icon"></i>' + json['error']['warning'] + '</div><span class="close"><i class="icon-remove-circle"></i></span></div></div>');

					$('.warning').fadeIn('slow');
					
				}	
							
				if (json['error']['country']) {
					$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
				
				if (json['error']['postcode']) {
					$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}					
			}
			
			if (json['shipping_method']) {
				html  = '<h2 style="margin:0 0 10px 0;"><?php echo $text_shipping_method; ?></h2>';
				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
				html += '  <table class="radio">';
				
				for (i in json['shipping_method']) {
					html += '<tr>';
					html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
					html += '</tr>';
				
					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<tr class="highlight">';
							
							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
							} else {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
							}
								
							html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
							html += '</tr>';
						}		
					} else {
						html += '<tr>';
						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
						html += '</tr>';						
					}
				}
				
				html += '  </table>';
				html += '  <br />';
				html += '  <input type="hidden" name="next" value="shipping" />';
				
				<?php if ($shipping_method) { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button but_yellow" />';	
				<?php } else { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button but_yellow" disabled="disabled" />';	
				<?php } ?>
							
				html += '</form>';
				
				$.colorbox({
					overlayClose: true,
					opacity: 0.3,
					width: '400px',
					height: '400px',
					href: false,
					html: html
				});
				
				$('input[name=\'shipping_method\']').bind('change', function() {
					$('#button-shipping').attr('disabled', false);
				});
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait"><i class="icon-spinner icon-spin"></i></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php } ?>
<?php echo $footer; ?>