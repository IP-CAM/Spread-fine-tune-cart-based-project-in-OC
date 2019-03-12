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
            <div class="page_notification">
                <?php if ($error_warning) { ?>
                <div class="warning"><i class="icon-warning-sign info_icon"></i><?php echo $error_warning; ?></div>
                <?php } ?>
            </div>
            <?php echo $content_top; ?> 
            <!-- START ACCOUNT PAGE -->
        	<div class="account-page">
                <div class="form-content">
                    <div class="info-form-content"><?php echo $text_description; ?></div>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="left-form-content">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <p class="title"><b><?php echo $text_order; ?></b></p>
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
                                <p><span class="required">* </span><?php echo $entry_email; ?></p>
                                <div><input type="text" name="email" value="<?php echo $email; ?>" /></div>
                                <?php if ($error_email) { ?><span class="error"><?php echo $error_email; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_telephone; ?></p>
                                <div><input type="text" name="telephone" value="<?php echo $telephone; ?>" /></div>
                                <?php if ($error_telephone) { ?><span class="error"><?php echo $error_telephone; ?></span><?php } ?>
                            </div>
                        </div>
                        <!-- END -->
                    </div>
                    <div class="right-form-content">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <p class="title"><b><?php echo $text_product; ?></b></p>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_order_id; ?></p>
                                <div><input type="text" name="order_id" value="<?php echo $order_id; ?>" /></div>
                                <?php if ($error_order_id) { ?><span class="error"><?php echo $error_order_id; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><?php echo $entry_date_ordered; ?></p>
                                <div><input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="date" /></div>
                            </div>
                            <div id="return-product">
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_product; ?></p>
                                <div><input type="text" name="product" value="<?php echo $product; ?>" /></div>
                                <?php if ($error_product) { ?><span class="error"><?php echo $error_product; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_model; ?></p>
                                <div><input type="text" name="model" value="<?php echo $model; ?>" /></div>
                                <?php if ($error_model) { ?><span class="error"><?php echo $error_model; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><?php echo $entry_quantity; ?></p>
                                <div><input type="text" name="quantity" value="<?php echo $quantity; ?>" /></div>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_reason; ?></p>
                                <div>
                                    <?php foreach ($return_reasons as $return_reason) { ?>
                                    <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
                                    <label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /> <?php echo $return_reason['name']; ?></label>
                                    <?php } else { ?>
                                    <label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" /> <?php echo $return_reason['name']; ?></label>
                                    <?php  } ?>
                                    <?php } ?>
                                </div>
                                <?php if ($error_reason) { ?><span class="error"><?php echo $error_reason; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><?php echo $entry_opened; ?></p>
                                <div>
                                    <?php if ($opened) { ?>
                                    <label for="opened"><input type="radio" name="opened" value="1" id="opened" checked="checked" /> <?php echo $text_yes; ?></label>
                                    <?php } else { ?>
                                    <label for="opened"><input type="radio" name="opened" value="1" id="opened" /> <?php echo $text_yes; ?></label>
                                    <?php } ?>
                                    <?php if (!$opened) { ?>
                                    <label for="unopened"><input type="radio" name="opened" value="0" id="unopened" checked="checked" /> <?php echo $text_no; ?></label>
                                    <?php } else { ?>
                                    <label for="unopened"><input type="radio" name="opened" value="0" id="unopened" /> <?php echo $text_no; ?></label>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="gpu_form">
                                <p><?php echo $entry_fault_detail; ?></p>
                                <div><textarea name="comment"><?php echo $comment; ?></textarea></div>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_captcha; ?></p>
                                <div><input type="text" name="captcha" value="<?php echo $captcha; ?>" /></div>
                                <div><img src="index.php?route=account/return/captcha" alt="" /></div>
                                <?php if ($error_captcha) { ?><span class="error"><?php echo $error_captcha; ?></span><?php } ?>
                            </div>
                            </div>
                        </div>
                        <!-- END -->
                    </div>
                    <?php if ($text_agree) { ?>
                    <div class="buttons">
                      <div class="center">
                        <p class="text_agree">
                            <?php if ($agree) { ?>
                            <input type="checkbox" name="agree" value="1" checked="checked" />
                            <?php } else { ?>
                            <input type="checkbox" name="agree" value="1" />
                            <?php } ?>
                            <?php echo $text_agree; ?>
                        </p>
                        <a href="<?php echo $back; ?>" class="button"><i class="icon-reply"></i><?php echo $button_back; ?></a>&nbsp;&nbsp;
                        <input type="submit" value="<?php echo $button_continue; ?>" class="button but_green" />
                      </div>
                    </div>
                    <?php } else { ?>
                    <div class="buttons">
                      <div class="left">
                          <a href="<?php echo $back; ?>" class="button"><i class="icon-reply"></i><?php echo $button_back; ?></a>&nbsp;&nbsp;
                      </div>
                      <div class="right">
                          <input type="submit" value="<?php echo $button_continue; ?>" class="button but_green" />
                      </div>
                    </div>
                    <?php } ?>
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
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5,
	width: 640,
	height: 480
});
//--></script>
<?php echo $footer; ?>