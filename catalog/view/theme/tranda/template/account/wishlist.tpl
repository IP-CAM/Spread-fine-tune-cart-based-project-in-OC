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
            </div>
            <?php echo $content_top; ?> 
            <!-- START ACCOUNT PAGE -->
        	<div class="account-page">
                <div class="wishlist-info">
                    <?php if ($products) { ?>
                    <div class="content-grid">
                        <?php foreach ($products as $product) { ?>
                            <!-- start item -->
                            <div class="grid-item">
                                <div class="image-content">
                                    <?php if ($product['thumb']) { ?>
                                    <div class="image">
                                        <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                                    </div>
                                    <?php } else { ?>
                                    <div class="image no-image">
                                        <i class="icon-camera"></i>
                                    </div>
                                    <?php } ?>
                                </div>
                                <div class="panel-content">
                                    <?php if ($product['price']) { ?>
                                    <?php if ($product['special']) { ?>
                                        <div class="certificate-sale"><i class="<?php if($this->config->get('tranda_icon_certificatesale') != '') { ?><?php echo $this->config->get('tranda_icon_certificatesale'); ?><?php } else { ?>icon-certificate<?php } ?>"></i><strong><?php if($this->config->get('tranda_text_certificatesale') != '') { ?><?php echo $this->config->get('tranda_text_certificatesale'); ?><?php } else { ?>SALE<?php } ?></strong></div>
                                    <?php } ?>
                                    <?php } ?>
                                    <div class="data-product">
                                    	<p><?php echo $column_model; ?>: <?php echo $product['model']; ?></p>
                                    	<p><?php echo $column_stock; ?>: <?php echo $product['stock']; ?></p>
                                    </div>
                                    <div class="top">
                                        <?php if ($product['price']) { ?>
                                        <div class="price">
                                            <?php if (!$product['special']) { ?>
                                            <?php echo $product['price']; ?>
                                            <?php } else { ?>
                                            <span class="price-new"><?php echo $product['special']; ?></span>
                                            <span class="price-old"><?php echo $product['price']; ?></span>
                                            <?php } ?>
                                        </div>
                                        <?php } ?>
                                        <h3 class="name"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
                                    </div>
                                    <div class="middle">
                                        <a class="add add_cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_cart; ?>"><i class="<?php if($this->config->get('tranda_icon_cart') != '') { ?><?php echo $this->config->get('tranda_icon_cart'); ?><?php } else { ?>icon-shopping-cart<?php } ?>"></i></a>
                                        <a class="add add_wishlist" href="<?php echo $product['remove']; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_remove; ?>"><i class="<?php if($this->config->get('tranda_icon_remove') != '') { ?><?php echo $this->config->get('tranda_icon_remove'); ?><?php } else { ?>icon-trash<?php } ?>"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- end item -->
                        <?php } ?>
                    </div>
                    <div class="buttons">
                        <div class="right"><a href="<?php echo $continue; ?>" class="button"><i class="icon-share-alt"></i><?php echo $button_continue; ?></a></div>
                    </div>
                    <?php } else { ?>
                    <div class="tranda_empty"><i class="icon-cogs info_icon"></i><?php echo $text_empty; ?></div>
                    <div class="buttons">
                        <div class="right"><a href="<?php echo $continue; ?>" class="button"><i class="icon-share-alt"></i><?php echo $button_continue; ?></a></div>
                    </div>
                    <?php } ?>
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