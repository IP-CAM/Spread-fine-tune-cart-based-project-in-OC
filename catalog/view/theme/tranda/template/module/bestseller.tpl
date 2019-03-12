<!-- START BESTSELLER -->
<div class="module-bestseller global-module">
    <h6><?php echo $heading_title; ?></h6>
    <div class="content-bestseller">
    	<?php foreach ($products as $product) { ?>
    	<!-- start item -->
        <div class="list-best">
        	<h3><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
            <div class="top">
            	<i class="icon-trophy trophy"></i>
                <?php if ($product['thumb']) { ?>
                <a class="image" href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                <?php } else { ?>
                <div class="image no-image">
                    <i class="icon-camera"></i>
                </div>
                <?php } ?>
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
            </div>
            <div class="bottom">
                <a class="add" onclick="addToCart('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_cart; ?>"><i class="icon-shopping-cart"></i></a>
                <?php if ($product['rating']) { ?>
                <div class="rating rating<?php echo $product['rating']; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $product['reviews']; ?>">
                    <i class="icon-star star-color color1"></i>
                    <i class="icon-star star-color color2"></i>
                    <i class="icon-star star-color color3"></i>
                    <i class="icon-star star-color color4"></i>
                    <i class="icon-star star-color color5"></i>
                    <i class="icon-star star-dark dark1"></i>
                    <i class="icon-star star-dark dark2"></i>
                    <i class="icon-star star-dark dark3"></i>
                    <i class="icon-star star-dark dark4"></i>
                    <i class="icon-star star-dark dark5"></i>
                </div>
                <?php } ?>
            </div>
        </div>
        <!-- end item -->
        <?php } ?>
    </div>
</div>
<!-- END BESTSELLER -->