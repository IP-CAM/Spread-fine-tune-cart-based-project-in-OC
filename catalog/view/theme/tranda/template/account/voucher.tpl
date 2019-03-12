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
                    <div class="info-form-content"><p><?php echo $text_description; ?></p></div>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="left-form-content full-form-content">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_to_name; ?></p>
                                <div><input type="text" name="to_name" value="<?php echo $to_name; ?>" /></div>
                                <?php if ($error_to_name) { ?><span class="error"><?php echo $error_to_name; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_to_email; ?></p>
                                <div><input type="text" name="to_email" value="<?php echo $to_email; ?>" /></div>
                                <?php if ($error_to_email) { ?><span class="error"><?php echo $error_to_email; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_from_name; ?></p>
                                <div><input type="text" name="from_name" value="<?php echo $from_name; ?>" /></div>
                                <?php if ($error_from_name) { ?><span class="error"><?php echo $error_from_name; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_from_email; ?></p>
                                <div><input type="text" name="from_email" value="<?php echo $from_email; ?>" /></div>
                                <?php if ($error_from_email) { ?><span class="error"><?php echo $error_from_email; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_theme; ?></p>
                                <div>
                                    <?php foreach ($voucher_themes as $voucher_theme) { ?>
                                    <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
                                    <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" /> <?php echo $voucher_theme['name']; ?></label>
                                    <?php } else { ?>
                                    <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" /> <?php echo $voucher_theme['name']; ?></label>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                                <?php if ($error_theme) { ?><span class="error"><?php echo $error_theme; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><?php echo $entry_message; ?></p>
                                <div><textarea name="message"><?php echo $message; ?></textarea></div>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">* </span><?php echo $entry_amount; ?></p>
                                <div><input type="text" name="amount" value="<?php echo $amount; ?>" size="5" /></div>
                                <?php if ($error_amount) { ?><span class="error"><?php echo $error_amount; ?></span><?php } ?>
                            </div>
                        </div>
                        <!-- END -->
                    </div>
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
                            <input type="submit" value="<?php echo $button_continue; ?>" class="button but_green" />
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
<?php echo $footer; ?>