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
                <?php if ($success) { ?>
                <div class="success"><i class="icon-ok info_icon"></i><?php echo $success; ?></div>
                <?php } ?>
                <?php if ($error_warning) { ?>
                <div class="warning"><i class="icon-warning-sign info_icon"></i><?php echo $error_warning; ?></div>
                <?php } ?>
            </div>
            <?php echo $content_top; ?> 
            <!-- START ACCOUNT PAGE -->
        	<div class="account-page">
                <div class="form-content">
                    <div class="info-form-content"><?php echo $text_description; ?></div>
                    <div class="left-form-content login-form-box">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <p class="title"><b><?php echo $text_returning_affiliate; ?></b></p>
                            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <div class="gpu_form">
                                <p><span class="required">*</span> <?php echo $entry_email; ?></p>
                                <div><input type="text" name="email" value="<?php echo $email; ?>" /></div>
                            </div>
                            <div class="gpu_form">
                                <p><span class="required">*</span> <?php echo $entry_password; ?></p>
                                <div><input type="password" name="password" value="<?php echo $password; ?>" /></div>
                            </div>
                            <div class="buttons">
                                <div class="left">
                                    <input type="submit" value="<?php echo $button_login; ?>" class="button but_green" />
                                    <?php if ($redirect) { ?>
                                    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                                    <?php } ?>
                                </div>
                                <a class="forgotten" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                            </div>
                            </form>
                        </div>
                        <!-- END -->
                    </div>
                    <div class="right-form-content">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <p class="title"><b><?php echo $text_new_affiliate; ?></b></p>
                            <div class="new-customer-box">
                                <?php echo $text_register_account; ?>
                            </div>
                            <div class="buttons">
                                <div class="right"><a class="button but_black" href="<?php echo $register; ?>"><i class="icon-edit"></i><?php echo $button_continue; ?></a></div>
                            </div>
                        </div>
                        <!-- END -->
                    </div>
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