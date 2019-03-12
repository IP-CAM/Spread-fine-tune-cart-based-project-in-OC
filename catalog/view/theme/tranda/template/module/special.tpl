<!-- START SPECIAL -->
<div class="module-special global-module">
    <h6><?php echo $heading_title; ?></h6>
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
            	<?php if ($product['rating']) { ?>
                <div class="rating rating<?php echo $product['rating']; ?>" data-original-title="<?php echo $product['reviews']; ?>" data-placement="top" rel="tooltip">
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-color color1"></i>
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-color color2"></i>
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-color color3"></i>
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-color color4"></i>
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-color color5"></i>
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark1"></i>
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark2"></i>
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark3"></i>
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark4"></i>
                    <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark5"></i>
                </div>
                <?php } ?>
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
                    <h3><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
                </div>
                <div class="middle">
                    <a class="add add_cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_cart; ?>"><i class="<?php if($this->config->get('tranda_icon_cart') != '') { ?><?php echo $this->config->get('tranda_icon_cart'); ?><?php } else { ?>icon-shopping-cart<?php } ?>"></i></a>
                    <?php if($this->config->get('tranda_add_display') == '1') { ?>
                    <a class="add add_wishlist" onClick="addToWishList('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php if($this->config->get('tranda_text_addwishlist') != '') { ?><?php echo $this->config->get('tranda_text_addwishlist'); ?><?php } else { ?>Add to Wish List<?php } ?>"><i class="<?php if($this->config->get('tranda_icon_wishlist') != '') { ?><?php echo $this->config->get('tranda_icon_wishlist'); ?><?php } else { ?>icon-file-alt<?php } ?>"></i></a>
                    <a class="add add_compare" onClick="addToCompare('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php if($this->config->get('tranda_text_addcompare') != '') { ?><?php echo $this->config->get('tranda_text_addcompare'); ?><?php } else { ?>Add to Compare<?php } ?>"><i class="<?php if($this->config->get('tranda_icon_compare') != '') { ?><?php echo $this->config->get('tranda_icon_compare'); ?><?php } else { ?>icon-exchange<?php } ?>"></i></a>
                    <?php } ?>
                </div>
            </div>
        </div>
        <!-- end item -->
        <?php } ?>
    </div>
</div>
<!-- END SPECIAL -->