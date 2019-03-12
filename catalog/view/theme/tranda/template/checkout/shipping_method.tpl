<?php if ($error_warning) { ?>
<div class="warning"><i class="icon-warning-sign info_icon"></i><?php echo $error_warning; ?></div>
<?php } ?>
<div class="form-content">
	<?php if ($shipping_methods) { ?>
	<!-- START LEFT -->
    <div class="left-form-content">
    	<div class="gpu_box_form"> <!-- start gpu -->
            <div class="gpu_form">
                <p><?php echo $text_shipping_method; ?></p>
                <div>
                    <table class="radio">
                      <?php foreach ($shipping_methods as $shipping_method) { ?>
                      <tr>
                        <td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
                      </tr>
                      <?php if (!$shipping_method['error']) { ?>
                      <?php foreach ($shipping_method['quote'] as $quote) { ?>
                      <tr class="highlight">
                        <td><?php if ($quote['code'] == $code || !$code) { ?>
                          <?php $code = $quote['code']; ?>
                          <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
                          <?php } else { ?>
                          <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
                          <?php } ?></td>
                        <td><label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label></td>
                        <td style="text-align: right;"><label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label></td>
                      </tr>
                      <?php } ?>
                      <?php } else { ?>
                      <tr>
                        <td colspan="3"><div class="error"><?php echo $shipping_method['error']; ?></div></td>
                      </tr>
                      <?php } ?>
                      <?php } ?>
                    </table><br />
                </div>
            </div>
        </div> <!-- end gpu -->
    </div>
	<!-- END LEFT -->
    <?php } ?>
	<!-- START RIGHT -->
    <div class="right-form-content">
    	<div class="gpu_box_form"> <!-- start gpu -->
            <div class="gpu_form">
                <p><?php echo $text_comments; ?></p>
                <div><textarea name="comment"><?php echo $comment; ?></textarea><br /></div>
            </div>
        </div> <!-- end gpu -->
    </div>
	<!-- END RIGHT -->
    <div class="buttons">
        <div class="right"><a id="button-shipping-method" class="button but_black"><i class="icon-edit"></i><?php echo $button_continue; ?></a></div>
    </div>
</div>