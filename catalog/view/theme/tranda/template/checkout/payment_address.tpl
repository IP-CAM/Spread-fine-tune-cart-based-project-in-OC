<div class="form-content">
	<!-- START LEFT -->
    <div class="left-form-content full-form-content">
    	<?php if ($addresses) { ?>
        <div class="gpu_form">
            <div><label for="payment-address-existing"><input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="checked" /> <?php echo $text_address_existing; ?></label></div>
        </div>
    	<div id="payment-existing">
            <div class="gpu_box_form"> <!-- start gpu -->
            	<div>
                    <select name="address_id" style="width:100%; min-width:100%; max-width:100%;" size="5">
                        <?php foreach ($addresses as $address) { ?>
                        <?php if ($address['address_id'] == $address_id) { ?>
                        <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
            	</div>
            </div> <!-- end gpu -->
        </div>
        <div class="gpu_form">
            <div><label for="payment-address-new"><input type="radio" name="payment_address" value="new" id="payment-address-new" /> <?php echo $text_address_new; ?></label></div>
        </div>
        <?php } ?>
        <div id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
            <div class="gpu_box_form"> <!-- start gpu -->
                <div class="gpu_form">
                    <p><span class="required">* </span><?php echo $entry_firstname; ?></p>
                    <div><input type="text" name="firstname" value="" /></div>
                </div>
                <div class="gpu_form">
                    <p><span class="required">* </span><?php echo $entry_lastname; ?></p>
                    <div><input type="text" name="lastname" value="" /></div>
                </div>
                <div class="gpu_form">
                    <p><?php echo $entry_company; ?></p>
                    <div><input type="text" name="company" value="" /></div>
                </div>
                <?php if ($company_id_display) { ?>
                <div class="gpu_form">
                    <p><?php if ($company_id_required) { ?><span class="required">* </span><?php } ?><?php echo $entry_company_id; ?></p>
                    <div><input type="text" name="company_id" value="" /></div>
                </div>
                <?php } ?>
                <?php if ($tax_id_display) { ?>
                <div class="gpu_form">
                    <p><?php if ($tax_id_required) { ?><span class="required">* </span><?php } ?><?php echo $entry_tax_id; ?></p>
                    <div><input type="text" name="tax_id" value="" /></div>
                </div>
                <?php } ?>
                <div class="gpu_form">
                    <p><span class="required">* </span><?php echo $entry_address_1; ?></p>
                    <div><input type="text" name="address_1" value="" /></div>
                </div>
                <div class="gpu_form">
                    <p><?php echo $entry_address_2; ?></p>
                    <div><input type="text" name="address_2" value="" /></div>
                </div>
                <div class="gpu_form">
                    <p><span class="required">* </span><?php echo $entry_city; ?></p>
                    <div><input type="text" name="city" value="" /></div>
                </div>
                <div class="gpu_form">
                    <p><span id="payment-postcode-required" class="required">* </span><?php echo $entry_postcode; ?></p>
                    <div><input type="text" name="postcode" value="" /></div>
                </div>
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
            </div> <!-- end gpu -->
        </div>
    </div>
	<!-- END LEFT -->
    <div class="buttons">
        <div class="right"><a id="button-payment-address" class="button but_black"><i class="icon-edit"></i><?php echo $button_continue; ?></a></div>
    </div>
</div>
<script type="text/javascript"><!--
$('#payment-address input[name=\'payment_address\']').live('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
	} else {
		$('#payment-existing').show();
		$('#payment-new').hide();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('#payment-address select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#payment-address select[name=\'country_id\']').after('<span class="wait"><i class="icon-spinner icon-spin"></i></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').show();
			} else {
				$('#payment-postcode-required').hide();
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
			
			$('#payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#payment-address select[name=\'country_id\']').trigger('change');
//--></script>