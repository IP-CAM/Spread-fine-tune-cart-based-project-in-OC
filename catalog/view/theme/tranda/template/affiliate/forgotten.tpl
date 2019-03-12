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
                    <div class="info-form-content"><p><?php echo $text_email; ?></p></div>
                    <div class="left-form-content forgotten-form-box">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <div class="gpu_form">
                                <p><span class="required">*</span> <?php echo $entry_email; ?></p>
                                <div><input type="text" name="email" value="" /></div>
                            </div>
                            <div class="buttons">
                                <div class="left"><input type="submit" value="<?php echo $button_continue; ?>" class="button but_green" /></div>
                                <div class="right"><a href="<?php echo $back; ?>" class="button"><i class="icon-reply"></i><?php echo $button_back; ?></a></div>
                            </div>
                            </form>
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