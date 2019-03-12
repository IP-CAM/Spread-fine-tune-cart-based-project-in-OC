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
            <!-- START PRODUCT PAGE -->
        	<div class="product-page">
                <div class="group_product"> <!-- start group_product -->
                <div class="top_product_panel">
                    <div class="gallery-product">
                        <?php if ($thumb) { ?>
                        <div class="thumb">
                            <a href="<?php echo $popup; ?>" class="cloud-zoom" id="image" rel="position:'inside', adjustX:0, adjustY:0"><img src="<?php echo $popup; ?>" /></a>
                            <a href="<?php echo $popup; ?>" rel="gallery_product_group"><i class="icon-zoom-in zoom" rel="tooltip" data-placement="top" data-original-title="Zoom"></i></a>
                        </div>
                        <?php } else { ?>
                        <div class="thumb primary-no-thumb">
                            <i class="icon-camera no-thumb"></i>
                        </div>
                        <?php } ?>
                        <div class="images">
                            <?php if ($thumb) { ?>
                            <?php if ($images) { ?>
                                <?php if ($thumb) { ?>
                                    <a href="<?php echo $popup; ?>" class="cloud-zoom-gallery" rel="useZoom:'image', smallImage:'<?php echo $popup; ?>'" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></a>
                                <?php } ?>
                                <?php foreach ($images as $image) { ?>
                                <a href="<?php echo $image['popup']; ?>" class="cloud-zoom-gallery" rel="useZoom:'image', smallImage:'<?php echo $image['popup']; ?>'" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" alt="<?php echo $heading_title; ?>" /></a>
                                <?php } ?>
                            <?php } ?>
                            <?php } ?>
                        </div>
                        <?php if ($thumb) { ?>
                        <?php if ($images) { ?>
                        <div id="off">
                            <?php if ($images) { ?><?php foreach ($images as $image) { ?><a href="<?php echo $image['popup']; ?>" rel="gallery_product_group"></a><?php } ?><?php } ?>
                        </div>
                        <?php } ?>
                        <script type="text/javascript"><!-- 
                        $(document).ready(function() {
                            $("a[rel=gallery_product_group]").fancybox({
                                'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
                                    return "<span id='fancybox-title-over'><?php echo $heading_title; ?> " + (currentIndex + 1) + " / " + currentArray.length + "</span>";
                                }
                            });
                        });
                         --></script>
                        <?php } ?>
                    </div>
                    <!-- start product info -->
                    <div class="product-info">
                        <?php if ($price) { ?>
                        <div class="price">
                            <?php echo $text_price; ?>
                            <?php if (!$special) { ?>
                            <?php echo $price; ?>
                            <?php } else { ?>
                            <span class="price-new"><?php echo $special; ?><div class="certificate-sale"><i class="<?php if($this->config->get('tranda_icon_certificatesale') != '') { ?><?php echo $this->config->get('tranda_icon_certificatesale'); ?><?php } else { ?>icon-certificate<?php } ?>"></i><strong><?php if($this->config->get('tranda_text_certificatesale') != '') { ?><?php echo $this->config->get('tranda_text_certificatesale'); ?><?php } else { ?>SALE<?php } ?></strong></div></span>
                            <span class="price-old"><?php echo $price; ?></span>
                            <?php } ?>
                            <?php if ($tax) { ?>
                            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
                            <?php } ?>
                            <?php if ($points) { ?>
                            <span class="reward"><?php echo $text_points; ?> <?php echo $points; ?></span>
                            <?php } ?>
                            <?php if ($discounts) { ?>
                            <div class="discount">
                                <?php foreach ($discounts as $discount) { ?>
                                <span><?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?></span>
                                <?php } ?>
                            </div>
                            <?php } ?>
                        </div>
                        <?php } ?>
                        <?php if($this->config->get('tranda_product_list_icon') == '0') { ?>
                        <ul class="description">
                            <?php if ($manufacturer) { ?>
                            <li><i><?php echo $text_manufacturer; ?></i> <a href="<?php echo $manufacturers; ?>" title="<?php echo $manufacturer; ?>"><?php echo $manufacturer; ?></a></li>
                            <?php } ?>
                            <li><i><?php echo $text_model; ?></i> <?php echo $model; ?></li>
                            <?php if ($reward) { ?>
                            <li><i><?php echo $text_reward; ?></i> <?php echo $reward; ?></li>
                            <?php } ?>
                            <li><i><?php echo $text_stock; ?></i> <?php echo $stock; ?></li>
                            <!-- START TAB Tags -->
                            <?php if ($tags) { ?>
                            <li>
                                <i><?php echo $text_tags; ?></i>
                                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                                <?php if ($i < (count($tags) - 1)) { ?>
                                <a href="<?php echo $tags[$i]['href']; ?>" title="<?php echo $tags[$i]['tag']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                                <?php } else { ?>
                                <a href="<?php echo $tags[$i]['href']; ?>" title="<?php echo $tags[$i]['tag']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                                <?php } ?>
                                <?php } ?>
                            </li>
                            <?php } ?>
                            <!-- END TAB Tags -->
                        </ul>
                        <?php } else { ?>
                        <ul class="description">
                            <?php if ($manufacturer) { ?>
                            <li><i class="<?php if($this->config->get('tranda_icon_brand') != '') { ?><?php echo $this->config->get('tranda_icon_brand'); ?><?php } else { ?>icon-globe<?php } ?>"></i>&nbsp;&nbsp;&nbsp;<i><?php echo $text_manufacturer; ?></i> <a href="<?php echo $manufacturers; ?>" title="<?php echo $manufacturer; ?>"><?php echo $manufacturer; ?></a></li>
                            <?php } ?>
                            <li><i class="<?php if($this->config->get('tranda_icon_productcode') != '') { ?><?php echo $this->config->get('tranda_icon_productcode'); ?><?php } else { ?>icon-barcode<?php } ?>"></i>&nbsp;&nbsp;&nbsp;<i><?php echo $text_model; ?></i> <?php echo $model; ?></li>
                            <?php if ($reward) { ?>
                            <li><i class="<?php if($this->config->get('tranda_icon_rewardpoints') != '') { ?><?php echo $this->config->get('tranda_icon_rewardpoints'); ?><?php } else { ?>icon-money<?php } ?>"></i>&nbsp;&nbsp;&nbsp;<i><?php echo $text_reward; ?></i> <?php echo $reward; ?></li>
                            <?php } ?>
                            <li><i class="<?php if($this->config->get('tranda_icon_availability') != '') { ?><?php echo $this->config->get('tranda_icon_availability'); ?><?php } else { ?>icon-dashboard<?php } ?>"></i>&nbsp;&nbsp;&nbsp;<i><?php echo $text_stock; ?></i> <?php echo $stock; ?></li>
                            <!-- START TAB Tags -->
                            <?php if ($tags) { ?>
                            <li>
                                <i class="<?php if($this->config->get('tranda_icon_tags') != '') { ?><?php echo $this->config->get('tranda_icon_tags'); ?><?php } else { ?>icon-tags<?php } ?>"></i>&nbsp;&nbsp;&nbsp;<i><?php echo $text_tags; ?></i>
                                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                                <?php if ($i < (count($tags) - 1)) { ?>
                                <a href="<?php echo $tags[$i]['href']; ?>" title="<?php echo $tags[$i]['tag']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                                <?php } else { ?>
                                <a href="<?php echo $tags[$i]['href']; ?>" title="<?php echo $tags[$i]['tag']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                                <?php } ?>
                                <?php } ?>
                            </li>
                            <?php } ?>
                            <!-- END TAB Tags -->
                        </ul>
                        <?php } ?>
                        <div class="share">
                            <!-- AddThis Button BEGIN -->
                            <div class="addthis_toolbox addthis_default_style<?php if($this->config->get('tranda_product_share') == '2') { ?> addthis_32x32_style<?php } ?>">
                            <a class="addthis_button_preferred_1"></a>
                            <a class="addthis_button_preferred_2"></a>
                            <a class="addthis_button_preferred_3"></a>
                            <a class="addthis_button_preferred_4"></a>
                            <a class="addthis_button_compact"></a>
                            <a class="addthis_counter addthis_bubble_style"></a>
                            </div>
                            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-5113f4df486c3dad"></script>
                            <!-- AddThis Button END -->
                        </div>
                        <?php if ($options) { ?> <!-- start options -->
                        <div class="options">
                            <div class="title"><?php echo $text_option; ?></div>
                            <?php foreach ($options as $option) { ?>
                                <?php if ($option['type'] == 'select') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div>
                                        <select name="option[<?php echo $option['product_option_id']; ?>]">
                                            <option value=""><?php echo $text_select; ?></option>
                                            <?php foreach ($option['option_value'] as $option_value) { ?>
                                            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'radio') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div>
                                        <?php foreach ($option['option_value'] as $option_value) { ?>
                                            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                <?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </label>
                                        <?php } ?>
                                    </div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'checkbox') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div>
                                        <?php foreach ($option['option_value'] as $option_value) { ?>
                                            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                                <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                <?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </label>
                                        <?php } ?>
                                    </div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'image') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div>
                                      <table class="option-image">
                                        <?php foreach ($option['option_value'] as $option_value) { ?>
                                        <tr>
                                          <td style="width:1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                                          <td style="width:50px;"><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                                          <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                              <?php if ($option_value['price']) { ?>
                                              (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                              <?php } ?>
                                            </label></td>
                                        </tr>
                                        <?php } ?>
                                      </table>
                                    </div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'text') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" /></div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'textarea') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div><textarea name="option[<?php echo $option['product_option_id']; ?>]"><?php echo $option['option_value']; ?></textarea></div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'file') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div>
                                        <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
                                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
                                    </div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'date') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" /></div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'datetime') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" /></div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'time') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="gpu_form">
                                    <p><?php if ($option['required']) { ?><span class="required">* </span><?php } ?><?php echo $option['name']; ?>:</p>
                                    <div><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" /></div>
                                    <i class="option-<?php echo $option['product_option_id']; ?>"></i>
                                </div>
                                <?php } ?>
                            <?php } ?>
                        </div>
                        <?php } ?> <!-- end options -->
                    </div>
                    <!-- end product info -->
                </div>
                <!-- END TOP PANEL -->
                <div class="bottom_product_panel">
                    <div class="actions">
                        <a id="button-cart" class="button but_green"><i class="<?php if($this->config->get('tranda_icon_cart') != '') { ?><?php echo $this->config->get('tranda_icon_cart'); ?><?php } else { ?>icon-shopping-cart<?php } ?>"></i><?php echo $button_cart; ?></a>
                        <div class="qty">
                            <i><?php if ($minimum > 1) { ?><span class="required">* </span><?php } ?><?php echo $text_qty; ?></i>
                            <a class="quantitymenu" onclick="quantityLess();"><i class="icon-minus"></i></a>
                            <div class="box">
                                <input type="text" id="quantity" name="quantity" size="2" value="<?php echo $minimum; ?>" />
                                <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                            </div>
                            <a class="quantitymenu" onclick="quantityMore();"><i class="icon-plus"></i></a>
                        </div>
                    </div>
                    <?php if ($review_status) { ?>
                    <div class="rating rating<?php echo $rating; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $reviews; ?>">
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
                    <div class="info">
                        <a onclick="addToWishList('<?php echo $product_id; ?>');" class="add" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_wishlist; ?>"><i class="<?php if($this->config->get('tranda_icon_wishlist') != '') { ?><?php echo $this->config->get('tranda_icon_wishlist'); ?><?php } else { ?>icon-file-alt<?php } ?>"></i></a>
                        <a onclick="addToCompare('<?php echo $product_id; ?>');" class="add" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_compare; ?>"><i class="<?php if($this->config->get('tranda_icon_compare') != '') { ?><?php echo $this->config->get('tranda_icon_compare'); ?><?php } else { ?>icon-exchange<?php } ?>"></i></a>
                    </div>
                    <?php if ($minimum > 1) { ?>
                    <div class="minimum"><p><span class="required">* </span><?php echo $text_minimum; ?></p></div>
                    <?php } ?>
                </div>
                </div> <!-- end group_product -->
                <!-- START TAB Description -->
                <div class="product-tab tab-description">
                    <h6 class="title"><?php echo $tab_description; ?></h6>
                    <div class="description-content">
                        <?php echo $description; ?>
                    </div>
                </div>
                <!-- END TAB Description -->
                <?php if ($attribute_groups) { ?>
                <!-- START TAB Specification -->
                <div class="product-tab tab-specification">
                    <h6 class="title"><?php echo $tab_attribute; ?></h6>
                    <table>
                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                        <thead>
                            <tr class="title-attr"><td colspan="2"><?php echo $attribute_group['name']; ?></td></tr>
                        </thead>
                        <tbody>
                            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                            <tr><td class="left-attr"><?php echo $attribute['name']; ?></td><td class="right-attr"><?php echo $attribute['text']; ?></td></tr>
                            <?php } ?>
                        </tbody>
                        <?php } ?>
                    </table>
                </div>
                <!-- END TAB Specification -->
                <?php } ?>
                <?php if ($review_status) { ?>
                <!-- START TAB Reviews -->
                <div class="product-tab tab-reviews">
                	<div class="list_review">
                        <h6 class="title"><?php echo $tab_review; ?></h6>
                        <div id="review"></div>
                    </div>
                    <div class="add_review">
                        <h6 class="title" id="review-title"><?php echo $text_write; ?></h6>
                        <div class="form-content review-form-box">
                            <div class="left-form-content">
                                <div class="gpu_box_form">
                                    <div class="gpu_form">
                                        <p><span class="required">*</span> <?php echo $entry_name; ?></p>
                                        <div><input type="text" name="name" value="" /></div>
                                    </div>
                                    <div class="gpu_form">
                                        <p><span class="required">*</span> <?php echo $entry_review; ?></p>
                                        <div><textarea name="text"></textarea></div>
                                    </div>
                                </div>
                            </div>
                            <div class="right-form-content">
                                <div class="gpu_box_form">
                                    <div class="gpu_form">
                                        <p><span class="required">*</span> <?php echo $entry_captcha; ?></p>
                                        <div>
                                            <input style="width:80px; min-width:80px; max-width:80px; margin:0 10px 0 0; vertical-align:top;" type="text" name="captcha" value="" /><img style="height:33px;" src="index.php?route=product/product/captcha" alt="" id="captcha" />
                                        </div>
                                    </div>
                                    <div class="gpu_form">
                                        <p><span class="required">*</span> <?php echo $entry_rating; ?></p>
                                        <div>
                                        	<font style="font-size:14px;"><?php echo $entry_bad; ?></font>
                                            <input type="radio" name="rating" value="1" />
                                        	<input type="radio" name="rating" value="2" />
                                        	<input type="radio" name="rating" value="3" />
                                        	<input type="radio" name="rating" value="4" />
                                        	<input type="radio" name="rating" value="5" />
                                            <font style="font-size:14px;"><?php echo $entry_good; ?></font>
                                        </div>
                                    </div>
                                    <div class="buttons">
                                        <div class="left"><a id="button-review" class="button but_green"><i class="icon-pencil"></i><?php echo $button_continue; ?></a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END TAB Reviews -->
                <?php } ?>
                <?php if ($products) { ?>
                <!-- START TAB Related Products -->
                <div class="product-tab tab-related">
                    <h6 class="title"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</h6>
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
                                </div>
                            </div>
                        </div>
                        <!-- end item -->
                        <?php } ?>
                    </div>
                </div>
                <!-- END TAB Related Products -->
                <?php } ?>
            </div>
            <!-- END PRODUCT PAGE -->
        </div>
        <!-- END COLUMN CENTER -->
    	<!-- START CONTENT BOTTOM -->
        <div class="content-bottom">
            <?php echo $content_bottom; ?>
        </div>
        <!-- END CONTENT BOTTOM -->
    </div>
</div>
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.group_product input[type=\'text\'], .group_product input[type=\'hidden\'], .group_product input[type=\'radio\']:checked, .group_product input[type=\'checkbox\']:checked, .group_product select, .group_product textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('.option-' + i).html('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="notification_view"><div class="success" style="display: none;"><i class="icon-shopping-cart info_icon"></i>' + json['success'] + '</div><span class="close"><i class="icon-remove-circle"></i></span></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<span class="loading wait"><i class="icon-spinner icon-spin"></i></span>');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><i class="icon-exclamation-sign info_icon"></i><span class="wait"><i class="icon-spinner icon-spin"></i></span><?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning"><i class="icon-warning-sign info_icon"></i>' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success"><i class="icon-ok info_icon"></i>' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
if ($.browser.msie && $.browser.version == 6) {
	$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<?php echo $footer; ?>