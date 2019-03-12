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
            <!-- START MANUFACTURER PAGE -->
            <div class="manufacturer-page">
                <div class="manufacturer-list">
                    <?php if ($categories) { ?>
                    <?php foreach ($categories as $category) { ?>
                    <p class="brand-heading"><?php echo $category['name']; ?><a id="<?php echo $category['name']; ?>"></a></p>
                      <?php if ($category['manufacturer']) { ?>
                      <ul class="brand-list">
                      <?php for ($i = 0; $i < count($category['manufacturer']);) { ?>
                        <?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>
                        <?php for (; $i < $j; $i++) { ?>
                        <?php if (isset($category['manufacturer'][$i])) { ?>
                        <li><h2><a href="<?php echo $category['manufacturer'][$i]['href']; ?>" title="<?php echo $category['manufacturer'][$i]['name']; ?>"><?php echo $category['manufacturer'][$i]['name']; ?></a></h2></li>
                        <?php } ?>
                        <?php } ?>
                      <?php } ?>
                      </ul>
                      <?php } ?>
                    <?php } ?>
                    <?php } else { ?>
                    <div class="tranda_empty"><i class="icon-cogs info_icon"></i><?php echo $text_empty; ?></div>
                    <div class="buttons">
                        <div class="right"><a href="<?php echo $continue; ?>" class="button"><i class="icon-share-alt"></i><?php echo $button_continue; ?></a></div>
                    </div>
                    <?php } ?>
                </div>
            </div>
            <!-- END MANUFACTURER PAGE -->
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