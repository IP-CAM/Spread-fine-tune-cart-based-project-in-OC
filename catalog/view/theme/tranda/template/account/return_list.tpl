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
                <div class="return-info-list">
                    <?php if ($returns) { ?>
                    <?php foreach ($returns as $return) { ?>
                    <div class="return-list">
                        <div class="return-id"><b><?php echo $text_return_id; ?></b> #<?php echo $return['return_id']; ?></div>
                        <div class="return-status"><b><?php echo $text_status; ?></b> <?php echo $return['status']; ?></div>
                        <div class="return-content">
                        <div>
                            <b><?php echo $text_date_added; ?></b> <?php echo $return['date_added']; ?><br />
                            <b><?php echo $text_order_id; ?></b> <?php echo $return['order_id']; ?>
                        </div>
                        <div>
                            <b><?php echo $text_customer; ?></b> <?php echo $return['name']; ?>
                        </div>
                        <div class="return-info"><a href="<?php echo $return['href']; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_view; ?>"><i class="icon-eye-open"></i></a></div>
                        </div>
                    </div>
                    <?php } ?>
                    <div class="pagination"><?php echo $pagination; ?></div>
                    <?php } else { ?>
                    <div class="tranda_empty"><i class="icon-cogs info_icon"></i><?php echo $text_empty; ?></div>
                    <?php } ?>
                    <div class="buttons">
                        <div class="right"><a href="<?php echo $continue; ?>" class="button"><i class="icon-share-alt"></i><?php echo $button_continue; ?></a></div>
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