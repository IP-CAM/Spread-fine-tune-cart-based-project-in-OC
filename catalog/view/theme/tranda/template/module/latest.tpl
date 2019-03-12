<!-- START LATEST -->
<div class="module-latest global-module">
    <h6><?php echo $heading_title; ?></h6>
    <div class="content-latest">
    	<?php foreach ($products as $product) { ?>
        <!-- start item -->                    
        <div class="grid-latest">
        	<?php if ($product['thumb']) { ?>
            <a class="image" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" /></a>
            <?php } else { ?>
            <div class="image no-image">
                <i class="icon-camera"></i>
            </div>
            <?php } ?>
            <div class="info-box">
                <a href="<?php echo $product['href']; ?>" class="info link"><i class="<?php if($this->config->get('tranda_icon_viewmore') != '') { ?><?php echo $this->config->get('tranda_icon_viewmore'); ?><?php } else { ?>icon-link<?php } ?>" rel="tooltip" data-placement="top" data-original-title="<?php if($this->config->get('tranda_text_viewmore') != '') { ?><?php echo $this->config->get('tranda_text_viewmore'); ?><?php } else { ?>View More<?php } ?>"></i></a>
                <a id="fancybox" href="#quickview<?php echo $product['product_id']; ?>" class="info fullscreen" rel="grid_latest_group"><i class="<?php if($this->config->get('tranda_icon_quickview') != '') { ?><?php echo $this->config->get('tranda_icon_quickview'); ?><?php } else { ?>icon-fullscreen<?php } ?>" rel="tooltip" data-placement="top" data-original-title="<?php if($this->config->get('tranda_text_quickview') != '') { ?><?php echo $this->config->get('tranda_text_quickview'); ?><?php } else { ?>Quick View<?php } ?>"></i></a>
            </div>
        </div>
        <div class="quickview-hidden">
            <div class="quickview" id="quickview<?php echo $product['product_id']; ?>">
                <div class="certificate-new"><i class="<?php if($this->config->get('tranda_icon_certificatenew') != '') { ?><?php echo $this->config->get('tranda_icon_certificatenew'); ?><?php } else { ?>icon-certificate<?php } ?>"></i><strong><?php if($this->config->get('tranda_text_certificatenew') != '') { ?><?php echo $this->config->get('tranda_text_certificatenew'); ?><?php } else { ?>NEW<?php } ?></strong></div>
            	<?php if ($product['thumb']) { ?>
                <div class="left-image">
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" /></a>
                </div>
                <?php } else { ?>
                <div class="no-image"><i class="icon-camera"></i></div>
                <?php } ?>
                <div class="right-info">
                    <h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                    <div class="price">
                    <?php if ($product['price']) { ?>
                        <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                        <?php } else { ?>
                        <span class="price-new"><?php echo $product['special']; ?></span>
                        <span class="price-old"><?php echo $product['price']; ?></span>
                        <?php } ?>
                    <?php } ?>
                    </div>
                    <div class="menu">
                        <div class="left">
                        	<div class="mini_links">
                                <a href="<?php echo $product['href']; ?>"><i class="<?php if($this->config->get('tranda_icon_viewmore') != '') { ?><?php echo $this->config->get('tranda_icon_viewmore'); ?><?php } else { ?>icon-link<?php } ?>"></i><?php if($this->config->get('tranda_text_viewmore') != '') { ?><?php echo $this->config->get('tranda_text_viewmore'); ?><?php } else { ?>View More<?php } ?></a>
                                <a onClick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="<?php if($this->config->get('tranda_icon_compare') != '') { ?><?php echo $this->config->get('tranda_icon_compare'); ?><?php } else { ?>icon-exchange<?php } ?>"></i><?php if($this->config->get('tranda_text_addcompare') != '') { ?><?php echo $this->config->get('tranda_text_addcompare'); ?><?php } else { ?>Add to Compare<?php } ?></a>
                                <a onClick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="<?php if($this->config->get('tranda_icon_wishlist') != '') { ?><?php echo $this->config->get('tranda_icon_wishlist'); ?><?php } else { ?>icon-file-alt<?php } ?>"></i><?php if($this->config->get('tranda_text_addwishlist') != '') { ?><?php echo $this->config->get('tranda_text_addwishlist'); ?><?php } else { ?>Add to Wish List<?php } ?></a>
                            </div>
                            <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button but_green"><i class="<?php if($this->config->get('tranda_icon_cart') != '') { ?><?php echo $this->config->get('tranda_icon_cart'); ?><?php } else { ?>icon-shopping-cart<?php } ?>"></i><?php echo $button_cart; ?></a>
                        </div>
                        <div class="right">
                        	<?php if ($product['rating']) { ?>
                            <p><?php echo $product['reviews']; ?></p>
                            <div class="rating rating<?php echo $product['rating']; ?>">
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
                            <?php } else { ?>
                            <p>&nbsp;</p>
                            <div class="rating rating<?php echo $product['rating']; ?> rating-opac">
                                <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark1"></i>
                                <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark2"></i>
                                <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark3"></i>
                                <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark4"></i>
                                <i class="<?php if($this->config->get('tranda_icon_rating') != '') { ?><?php echo $this->config->get('tranda_icon_rating'); ?><?php } else { ?>icon-star<?php } ?> star-dark dark5"></i>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>                       
        </div>
        <!-- end item -->
        <?php } ?>
        <script type="text/javascript"><!-- 
        $(document).ready(function() {
            $("#fancybox").fancybox();

            $("a[rel=grid_latest_group]").fancybox({
                'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over"><?php echo $heading_title; ?> ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
        });
         --></script>
    </div>
</div>
<!-- END LATEST -->