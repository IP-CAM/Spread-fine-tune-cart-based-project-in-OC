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
                <div class="reward-info">
                    <div class="info-form-content"><p><?php echo $text_total; ?> <?php echo $total; ?></p></div>
                    <table class="list">
                    <thead>
                      <tr>
                        <td class="left"><?php echo $column_date_added; ?></td>
                        <td class="left"><?php echo $column_description; ?></td>
                        <td class="right"><?php echo $column_points; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php if ($rewards) { ?>
                      <?php foreach ($rewards  as $reward) { ?>
                      <tr>
                        <td class="left"><?php echo $reward['date_added']; ?></td>
                        <td class="left"><?php if ($reward['order_id']) { ?>
                          <a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
                          <?php } else { ?>
                          <?php echo $reward['description']; ?>
                          <?php } ?></td>
                        <td class="right"><?php echo $reward['points']; ?></td>
                      </tr>
                      <?php } ?>
                      <?php } else { ?>
                      <tr>
                        <td class="center" colspan="5"><?php echo $text_empty; ?></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                    </table>
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