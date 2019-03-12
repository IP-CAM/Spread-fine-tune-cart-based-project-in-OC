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
                <div class="success"><i class="icon-warning-sign info_icon"></i><?php echo $success; ?></div>
                <?php } ?>
            </div>
            <?php echo $content_top; ?> 
            <!-- START COMPARE PAGE -->
            <div class="compare-page">
                <?php if ($products) { ?>
                <table class="compare-info">
                <thead>
                  <tr>
                    <td class="compare-product" colspan="<?php echo count($products) + 1; ?>"><?php echo $text_product; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><?php echo $text_name; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td class="name"><a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td><?php echo $text_image; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td class="image"><?php if ($products[$product['product_id']]['thumb']) { ?>
                      <img src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" />
                      <?php } else { ?><i class="icon-camera"></i><?php } ?></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td><?php echo $text_price; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td><?php if ($products[$product['product_id']]['price']) { ?>
                      <?php if (!$products[$product['product_id']]['special']) { ?>
                      <?php echo $products[$product['product_id']]['price']; ?>
                      <?php } else { ?>
                      <span class="price-old"><?php echo $products[$product['product_id']]['price']; ?></span> <span class="price-new"><?php echo $products[$product['product_id']]['special']; ?></span>
                      <?php } ?>
                      <?php } ?></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td><?php echo $text_model; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td><?php echo $products[$product['product_id']]['model']; ?></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td><?php echo $text_manufacturer; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td><?php echo $text_availability; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td><?php echo $products[$product['product_id']]['availability']; ?></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td><?php echo $text_rating; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td>
                        <div class="rating rating<?php echo $products[$product['product_id']]['rating']; ?>" data-original-title="<?php echo $products[$product['product_id']]['reviews']; ?>" data-placement="top" rel="tooltip">
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
                    </td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td><?php echo $text_summary; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td class="description"><?php echo $products[$product['product_id']]['description']; ?></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td><?php echo $text_weight; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td><?php echo $products[$product['product_id']]['weight']; ?></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td><?php echo $text_dimension; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
                    <?php } ?>
                  </tr>
                </tbody>
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td class="compare-attribute" colspan="<?php echo count($products) + 1; ?>"><?php echo $attribute_group['name']; ?></td>
                  </tr>
                </thead>
                <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
                <tbody>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <?php foreach ($products as $product) { ?>
                    <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
                    <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
                    <?php } else { ?>
                    <td></td>
                    <?php } ?>
                    <?php } ?>
                  </tr>
                </tbody>
                <?php } ?>
                <?php } ?>
                <tr>
                  <td></td>
                  <?php foreach ($products as $product) { ?>
                  <td class="actions">
                      <a onclick="addToCart('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_cart; ?>"><i class="<?php if($this->config->get('tranda_icon_cart') != '') { ?><?php echo $this->config->get('tranda_icon_cart'); ?><?php } else { ?>icon-shopping-cart<?php } ?>"></i></a>
                      <a href="<?php echo $product['remove']; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_remove; ?>"><i class="<?php if($this->config->get('tranda_icon_remove') != '') { ?><?php echo $this->config->get('tranda_icon_remove'); ?><?php } else { ?>icon-trash<?php } ?>"></i></a>
                  </td>
                  <?php } ?>
                </tr>
                </table>
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
            <!-- END COMPARE PAGE -->
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