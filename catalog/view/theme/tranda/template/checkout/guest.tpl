<div class="form-content">
	<!-- START LEFT -->
    <div class="left-form-content">
    	<div class="gpu_box_form"> <!-- start gpu -->
            <p class="title"><b><?php echo $text_your_details; ?></b></p>
            <div class="gpu_form">
                <p><span class="required">* </span><?php echo $entry_firstname; ?></p>
                <div><input type="text" name="firstname" value="<?php echo $firstname; ?>" /><br /></div>
            </div>
            <div class="gpu_form">
                <p><span class="required">* </span><?php echo $entry_lastname; ?></p>
                <div><input type="text" name="lastname" value="<?php echo $lastname; ?>" /><br /></div>
            </div>
            <div class="gpu_form">
                <p><span class="required">* </span><?php echo $entry_email; ?></p>
                <div><input type="text" name="email" value="<?php echo $email; ?>" /><br /></div>
            </div>
            <div class="gpu_form">
                <p><span class="required">* </span><?php echo $entry_telephone; ?></p>
                <div><input type="text" name="telephone" value="<?php echo $telephone; ?>" /><br /></div>
            </div>
            <div class="gpu_form">
                <p><?php echo $entry_fax; ?></p>
                <div><input type="text" name="fax" value="<?php echo $fax; ?>" /><br /></div>
            </div>
        </div> <!-- end gpu -->
    </div>
	<!-- END LEFT -->
	<!-- START RIGHT -->
    <div class="right-form-content">
    	<div class="gpu_box_form"> <!-- start gpu -->
            <p class="title"><b><?php echo $text_your_address; ?></b></p>
            <div class="gpu_form">
                <p><?php echo $entry_company; ?></p>
                <div><input type="text" name="company" value="<?php echo $company; ?>" /><br /></div>
            </div>
            <div class="gpu_form" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
                <p><?php echo $entry_customer_group; ?></p>
                <div>
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                    <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" /> <?php echo $customer_group['name']; ?></label>
                    <br />
                    <?php } else { ?>
                    <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" /> <?php echo $customer_group['name']; ?></label>
                    <br />
                    <?php } ?>
                    <?php } ?>
                </div>
            </div>
            <div class="gpu_form" id="company-id-display">
                <p><span id="company-id-required" class="required">* </span><?php echo $entry_company_id; ?></p>
                <div><input type="text" name="company_id" value="<?php echo $company_id; ?>" /><br /></div>
            </div>
            <div class="gpu_form" id="tax-id-display">
                <p><span id="tax-id-required" class="required">* </span><?php echo $entry_tax_id; ?></p>
                <div><input type="text" name="tax_id" value="<?php echo $tax_id; ?>" /><br /></div>
            </div>
            <div class="gpu_form">
                <p><span class="required">* </span><?php echo $entry_address_1; ?></p>
                <div><input type="text" name="address_1" value="<?php echo $address_1; ?>" /><br /></div>
            </div>
            <div class="gpu_form">
                <p><?php echo $entry_address_2; ?></p>
                <div><input type="text" name="address_2" value="<?php echo $address_2; ?>" /><br /></div>
            </div>
            <div class="gpu_form">
                <p><span class="required">* </span><?php echo $entry_city; ?></p>
                <div><input type="text" name="city" value="<?php echo $city; ?>" /><br /></div>
            </div>
            <div class="gpu_form">
                <p><span id="payment-postcode-required" class="required">* </span><?php echo $entry_postcode; ?></p>
                <div><input type="text" name="postcode" value="<?php echo $postcode; ?>" /><br /></div>
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
                    </select><br />
                </div>
            </div>
            <div class="gpu_form">
                <p><span class="required">* </span><?php echo $entry_zone; ?></p>
                <div><select name="zone_id"></select><br /></div>
            </div>
        </div> <!-- end gpu -->
    </div>
	<!-- END RIGHT -->
    <?php if ($shipping_required) { ?>
    <div class="gpu_form_options">
        <div>
            <?php if ($shipping_address) { ?>
            <label for="shipping"><input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" /> <?php echo $entry_shipping; ?></label>
            <?php } else { ?>
            <label for="shipping"><input type="checkbox" name="shipping_address" value="1" id="shipping" /> <?php echo $entry_shipping; ?></label>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
    <div class="buttons">
        <div class="right"><a id="button-guest" class="button but_black"><i class="icon-edit"></i><?php echo $button_continue; ?></a></div>
    </div>
</div>
<script type="text/javascript"><!--
$('#payment-address input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('#payment-address input[name=\'customer_group_id\']:checked').trigger('change');
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