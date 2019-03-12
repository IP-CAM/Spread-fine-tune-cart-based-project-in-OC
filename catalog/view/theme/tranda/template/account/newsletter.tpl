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
                            <p class="title"><b><?php echo $entry_newsletter; ?></b></p>
                            <div class="gpu_form">
                                <div>
                                    <?php if ($newsletter) { ?>
                                    <label><input type="radio" name="newsletter" value="1" checked="checked" /> <?php echo $text_yes; ?></label>
                                    <label><input type="radio" name="newsletter" value="0" /> <?php echo $text_no; ?></label>
                                    <?php } else { ?>
                                    <label><input type="radio" name="newsletter" value="1" /> <?php echo $text_yes; ?></label>
                                    <label><input type="radio" name="newsletter" value="0" checked="checked" /> <?php echo $text_no; ?></label>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="buttons">
                                <div class="left"><input type="submit" value="<?php echo $button_continue; ?>" class="button but_green" /></div>
                                <div class="right"><a href="<?php echo $back; ?>" class="button"><i class="icon-reply"></i><?php echo $button_back; ?></a></div>
                            </div>
                        </div>
                        <!-- END -->
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