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
                <div class="download-list-info">
                    <?php foreach ($downloads as $download) { ?>
                    <div class="download-list">
                        <div class="download-id"><b><?php echo $text_order; ?></b> <?php echo $download['order_id']; ?></div>
                        <div class="download-status"><b><?php echo $text_size; ?></b> <?php echo $download['size']; ?></div>
                        <div class="download-content">
                          <div>
                              <b><?php echo $text_name; ?></b> <?php echo $download['name']; ?><br />
                              <b><?php echo $text_date_added; ?></b> <?php echo $download['date_added']; ?>
                          </div>
                          <div><b><?php echo $text_remaining; ?></b> <?php echo $download['remaining']; ?></div>
                          <div class="download-info">
                            <?php if ($download['remaining'] > 0) { ?>
                            <a href="<?php echo $download['href']; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_download; ?>"><i class="icon-cloud-download"></i></a>
                            <?php } ?>
                          </div>
                        </div>
                    </div>
                    <?php } ?>
                    <div class="pagination"><?php echo $pagination; ?></div>
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