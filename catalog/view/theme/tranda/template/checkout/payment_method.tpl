<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="form-content">
	<?php if ($payment_methods) { ?>
	<!-- START LEFT -->
    <div class="left-form-content">
    	<div class="gpu_box_form"> <!-- start gpu -->
            <div class="gpu_form">
                <p><?php echo $text_payment_method; ?></p>
                <div>
                    <table class="radio">
                      <?php foreach ($payment_methods as $payment_method) { ?>
                      <tr class="highlight">
                        <td><?php if ($payment_method['code'] == $code || !$code) { ?>
                          <?php $code = $payment_method['code']; ?>
                          <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
                          <?php } else { ?>
                          <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
                          <?php } ?></td>
                        <td><label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></td>
                      </tr>
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
    <?php if ($text_agree) { ?>
    <div class="buttons">
        <div class="right"><span style="font-size:14px;"><?php echo $text_agree; ?>
            <input type="checkbox" name="agree" value="1" /></span>
            <a id="button-payment-method" class="button but_black"><i class="icon-edit"></i><?php echo $button_continue; ?></a>
        </div>
    </div>
    <?php } else { ?>
    <div class="buttons">
        <div class="right"><a id="button-payment-method" class="button but_black"><i class="icon-edit"></i><?php echo $button_continue; ?></a></div>
    </div>
    <?php } ?>
</div>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5,
	width: 640,
	height: 480
});
//--></script> 