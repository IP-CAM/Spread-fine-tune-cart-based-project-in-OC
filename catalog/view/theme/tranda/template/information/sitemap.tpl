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
            <!-- START SITE MAP PAGE -->
        	<div class="sitemap-page">
                <div class="sitemap-info">
                <div class="left">
                  <ul>
                    <?php foreach ($categories as $category_1) { ?>
                    <li><a href="<?php echo $category_1['href']; ?>" title="<?php echo $category_1['name']; ?>"><?php echo $category_1['name']; ?></a>
                      <?php if ($category_1['children']) { ?>
                      <ul>
                        <?php foreach ($category_1['children'] as $category_2) { ?>
                        <li><a href="<?php echo $category_2['href']; ?>" title="<?php echo $category_2['name']; ?>"><?php echo $category_2['name']; ?></a>
                          <?php if ($category_2['children']) { ?>
                          <ul>
                            <?php foreach ($category_2['children'] as $category_3) { ?>
                            <li><a href="<?php echo $category_3['href']; ?>" title="<?php echo $category_3['name']; ?>"><?php echo $category_3['name']; ?></a></li>
                            <?php } ?>
                          </ul>
                          <?php } ?>
                        </li>
                        <?php } ?>
                      </ul>
                      <?php } ?>
                    </li>
                    <?php } ?>
                  </ul>
                </div>
                <div class="right">
                  <ul>
                    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                      <ul>
                        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                        <li><a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
                        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                      </ul>
                    </li>
                    <li><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></li>
                    <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                    <li><a href="<?php echo $search; ?>"><?php echo $text_search; ?></a></li>
                    <li><?php echo $text_information; ?>
                      <ul>
                        <?php foreach ($informations as $information) { ?>
                        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                        <?php } ?>
                        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
                </div>
            </div>
            <!-- END SITE MAP PAGE -->
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