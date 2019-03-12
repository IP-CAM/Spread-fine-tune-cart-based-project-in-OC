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
                    <div class="left-form-content full-form-content">
                        <!-- START -->
                        <div class="gpu_box_form">
                            <p class="title"><b><?php echo $text_address_book; ?></b></p>
                            <?php foreach ($addresses as $result) { ?>
                            <div class="info-addresses-box">
                                <p><?php echo $result['address']; ?></p>
                                <a href="<?php echo $result['update']; ?>" class="button but_green edit_but"><i class="icon-pencil"></i><?php echo $button_edit; ?></a>
                                <a href="<?php echo $result['delete']; ?>" class="button but_red delete_but"><i class="icon-trash"></i><?php echo $button_delete; ?></a>
                            </div>
                            <?php } ?>
                            <div class="buttons">
                                <div class="left"><a href="<?php echo $insert; ?>" class="button but_black"><i class="icon-key"></i><?php echo $button_new_address; ?></a></div>
                                <div class="right"><a href="<?php echo $back; ?>" class="button"><i class="icon-reply"></i><?php echo $button_back; ?></a></div>
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