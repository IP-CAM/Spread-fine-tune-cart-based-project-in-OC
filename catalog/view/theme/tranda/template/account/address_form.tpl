<?php echo $header; ?>
<div class="container-top">
    <div class="gpc">
    	<!-- START CONTENT TOP -->
        <div class="content-top">
            <!-- START BREADCRUMB -->
            <h1 class="page_title"><?php echo $heading_title; ?></h1>
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
            <?php echo $content_top; ?> 
            <!-- START ACCOUNT PAGE -->
        	<div class="account-page">
                <div class="form-content">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="left-form-content full-form-content">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <p class="title"><b><?php echo $text_edit_address; ?></b></p>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_firstname; ?></p>
                                <div><input type="text" name="firstname" value="<?php echo $firstname; ?>" /></div>
                                <?php if ($error_firstname) { ?><span class="error"><?php echo $error_firstname; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_lastname; ?></p>
                                <div><input type="text" name="lastname" value="<?php echo $lastname; ?>" /></div>
                                <?php if ($error_lastname) { ?><span class="error"><?php echo $error_lastname; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><?php echo $entry_company; ?></p>
                                <div><input type="text" name="company" value="<?php echo $company; ?>" /></div>
                            </div>
                            <?php if ($company_id_display) { ?>
                            <div class="gpu_form">
                                <p><span id="company-id-required" class="required">* </span><?php echo $entry_company_id; ?></p>
                                <div><input type="text" name="company_id" value="<?php echo $company_id; ?>" /></div>
                                <?php if ($error_company_id) { ?><span class="error"><?php echo $error_company_id; ?></span><?php } ?>
                            </div>
                            <?php } ?>
                            <?php if ($tax_id_display) { ?>
                            <div class="gpu_form">
                                <p><span id="tax-id-required" class="required">* </span><?php echo $entry_tax_id; ?></p>
                                <div><input type="text" name="tax_id" value="<?php echo $tax_id; ?>" /></div>
                                <?php if ($error_tax_id) { ?><span class="error"><?php echo $error_tax_id; ?></span><?php } ?>
                            </div>
                            <?php } ?>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_address_1; ?></p>
                                <div><input type="text" name="address_1" value="<?php echo $address_1; ?>" /></div>
                                <?php if ($error_address_1) { ?><span class="error"><?php echo $error_address_1; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><?php echo $entry_address_2; ?></p>
                                <div><input type="text" name="address_2" value="<?php echo $address_2; ?>" /></div>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_city; ?></p>
                                <div><input type="text" name="city" value="<?php echo $city; ?>" /></div>
                                <?php if ($error_city) { ?><span class="error"><?php echo $error_city; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span id="postcode-required" class="required">* </span><?php echo $entry_postcode; ?></p>
                                <div><input type="text" name="postcode" value="<?php echo $postcode; ?>" /></div>
                                <?php if ($error_postcode) { ?><span class="error"><?php echo $error_postcode; ?></span><?php } ?>
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
                                <?php if ($error_country) { ?><span class="error"><?php echo $error_country; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_zone; ?></p>
                                <div><select name="zone_id"></select> </div>
                                <?php if ($error_zone) { ?><span class="error"><?php echo $error_zone; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><?php echo $entry_default; ?></p>
                                <div>
                                    <?php if ($default) { ?>
                                    <label><input type="radio" name="default" value="1" checked="checked" /> <?php echo $text_yes; ?></label>
                                    <label><input type="radio" name="default" value="0" /> <?php echo $text_no; ?></label>
                                    <?php } else { ?>
                                    <label><input type="radio" name="default" value="1" /> <?php echo $text_yes; ?></label>
                                    <label><input type="radio" name="default" value="0" checked="checked" /> <?php echo $text_no; ?></label>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <!-- END -->
                        <div class="buttons">
                            <div class="left"><input type="submit" value="<?php echo $button_continue; ?>" class="button but_green" /></div>
                            <div class="right"><a href="<?php echo $back; ?>" class="button"><i class="icon-reply"></i><?php echo $button_back; ?></a></div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <!-- END ACCOUNT PAGE -->
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
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/address/country&country_id=' + this.value,
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
<?php echo $footer; ?>