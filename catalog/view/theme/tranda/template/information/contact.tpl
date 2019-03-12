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
            <!-- START CONTACT PAGE -->
        	<div class="contact-page">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="form-content contact-form-box">
                    <div class="left-form-content">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <p class="title"><b><?php echo $text_contact; ?></b></p>
                            <div class="gpu_form">
                                <p><span class="required">*</span> <?php echo $entry_name; ?></p>
                                <div><input type="text" name="name" value="<?php echo $name; ?>" /></div>
                                <?php if ($error_name) { ?><span class="error"><?php echo $error_name; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">*</span> <?php echo $entry_email; ?></p>
                                <div><input type="text" name="email" value="<?php echo $email; ?>" /></div>
                                <?php if ($error_email) { ?><span class="error"><?php echo $error_email; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">*</span> <?php echo $entry_enquiry; ?></p>
                                <div><textarea name="enquiry"><?php echo $enquiry; ?></textarea></div>
                                <?php if ($error_enquiry) { ?><span class="error"><?php echo $error_enquiry; ?></span><?php } ?>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">*</span> <?php echo $entry_captcha; ?></p>
                                <div><input type="text" name="captcha" value="<?php echo $captcha; ?>" /></div>
                                <div><img src="index.php?route=information/contact/captcha" alt="" /></div>
                                <?php if ($error_captcha) { ?><span class="error"><?php echo $error_captcha; ?></span><?php } ?>
                            </div>
                            <div class="buttons">
                                <div class="left"><input type="submit" value="<?php echo $button_continue; ?>" class="button but_green" /></div>
                            </div>
                        </div>
                        <!-- END -->
                    </div>
                    <div class="right-form-content">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <p class="title"><b><?php echo $text_location; ?></b></p>
                            <div class="gpu_form">
                                <p><b><?php echo $text_address; ?></b></p>
                                <div><?php echo $store; ?><br /><?php echo $address; ?></div>
                            </div>
                            <?php if ($telephone) { ?>
                            <div class="gpu_form">
                                <p><b><?php echo $text_telephone; ?></b></p>
                                <div><?php echo $telephone; ?></div>
                            </div>
                            <?php } ?>
                            <?php if ($fax) { ?>
                            <div class="gpu_form">
                                <p><b><?php echo $text_fax; ?></b></p>
                                <div><?php echo $fax; ?></div>
                            </div>
                            <?php } ?>
                        </div>
                        <!-- END -->
                    </div>
                </div>
                </form>
            </div>
            <!-- END CONTACT PAGE -->
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