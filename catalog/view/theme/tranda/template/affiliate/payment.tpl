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
                            <p class="title"><b><?php echo $text_your_payment; ?></b></p>
                            <div class="gpu_form">
                                <p><?php echo $entry_tax; ?></p>
                                <div><input type="text" name="tax" value="<?php echo $tax; ?>" /></div>
                            </div>
                            <div class="gpu_form">
                                <p><?php echo $entry_payment; ?></p>
                                <div>
                                    <?php if ($payment == 'cheque') { ?>
                                    <label for="cheque"><input type="radio" name="payment" value="cheque" id="cheque" checked="checked" /> <?php echo $text_cheque; ?></label>
                                    <?php } else { ?>
                                    <label for="cheque"><input type="radio" name="payment" value="cheque" id="cheque" /> <?php echo $text_cheque; ?></label>
                                    <?php } ?>
                                    <?php if ($payment == 'paypal') { ?>
                                    <label for="paypal"><input type="radio" name="payment" value="paypal" id="paypal" checked="checked" /> <?php echo $text_paypal; ?></label>
                                    <?php } else { ?>
                                    <label for="paypal"><input type="radio" name="payment" value="paypal" id="paypal" /> <?php echo $text_paypal; ?></label>
                                    <?php } ?>
                                    <?php if ($payment == 'bank') { ?>
                                    <label for="bank"><input type="radio" name="payment" value="bank" id="bank" checked="checked" /> <?php echo $text_bank; ?></label>
                                    <?php } else { ?>
                                    <label for="bank"><input type="radio" name="payment" value="bank" id="bank" /> <?php echo $text_bank; ?></label>
                                    <?php } ?>
                                </div>
                            </div>
                            <div id="payment-cheque" class="payment">
                                <div class="gpu_form">
                                    <p><?php echo $entry_cheque; ?></p>
                                    <div><input type="text" name="cheque" value="<?php echo $cheque; ?>" /></div>
                                </div>
                            </div>
                            <div id="payment-paypal" class="payment">
                                <div class="gpu_form">
                                    <p><?php echo $entry_paypal; ?></p>
                                    <div><input type="text" name="paypal" value="<?php echo $paypal; ?>" /></div>
                                </div>
                            </div>
                            <div id="payment-bank" class="payment">
                                <div class="gpu_form">
                                    <p><?php echo $entry_bank_name; ?></p>
                                    <div><input type="text" name="bank_name" value="<?php echo $bank_name; ?>" /></div>
                                </div>
                                <div class="gpu_form">
                                    <p><?php echo $entry_bank_branch_number; ?></p>
                                    <div><input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" /></div>
                                </div>
                                <div class="gpu_form">
                                    <p><?php echo $entry_bank_swift_code; ?></p>
                                    <div><input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" /></div>
                                </div>
                                <div class="gpu_form">
                                    <p><?php echo $entry_bank_account_name; ?></p>
                                    <div><input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" /></div>
                                </div>
                                <div class="gpu_form">
                                    <p><?php echo $entry_bank_account_number; ?></p>
                                    <div><input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" /></div>
                                </div>
                            </div>
                        </div>
                        <!-- END -->
                    </div>
                    <div class="buttons">
                        <div class="left"><input type="submit" value="<?php echo $button_continue; ?>" class="button but_green" /></div>
                        <div class="right"><a href="<?php echo $back; ?>" class="button"><i class="icon-reply"></i><?php echo $button_back; ?></a></div>
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
$('input[name=\'payment\']').bind('change', function() {
	$('.payment').hide();
	
	$('#payment-' + this.value).show();
});

$('input[name=\'payment\']:checked').trigger('change');
//--></script> 
<?php echo $footer; ?>