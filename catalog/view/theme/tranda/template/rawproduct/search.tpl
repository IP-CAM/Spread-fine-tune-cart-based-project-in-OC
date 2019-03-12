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
            <?php if ($products) { ?>
                <div class="product-filter global-no-value">
                    <div class="display">
                        <a class="" onclick="display('grid');"><i class="<?php if($this->config->get('tranda_icon_grid') != '') { ?><?php echo $this->config->get('tranda_icon_grid'); ?><?php } else { ?>icon-th<?php } ?>"></i><span><?php echo $text_grid; ?></span></a>
                        <a class="active" onclick=""><i class="<?php if($this->config->get('tranda_icon_list') != '') { ?><?php echo $this->config->get('tranda_icon_list'); ?><?php } else { ?>icon-th-list<?php } ?>"></i><span><?php echo $text_list; ?></span></a>
                    </div>
                    <div class="limit">
                      <select onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                    </div>
                    <div class="sort">
                      <select onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                    </div>
                    <a class="product-compare" href="<?php echo $compare; ?>"><i class="<?php if($this->config->get('tranda_icon_compare') != '') { ?><?php echo $this->config->get('tranda_icon_compare'); ?><?php } else { ?>icon-exchange<?php } ?>"></i><span id="compare-total"><?php echo $text_compare; ?></span></a>
                </div>
            <?php } ?>
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
            <!-- START SEARCH PAGE -->
        	<div id="search_content" class="search-page">
                <div class="search-panel">
                    <h6><?php echo $text_critea; ?></h6>
                    <div class="left">
                        <?php if ($search) { ?>
                        <input type="text" name="search" value="<?php echo $search; ?>" />
                        <?php } else { ?>
                        <input type="text" name="search" value=""/>
                        <?php } ?>
                        <select name="category_id">
                            <option value="0"><?php echo $text_category; ?></option>
                            <?php foreach ($categories as $category_1) { ?>
                            <?php if ($category_1['category_id'] == $category_id) { ?>
                            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                            <?php } ?>
                            <?php foreach ($category_1['children'] as $category_2) { ?>
                            <?php if ($category_2['category_id'] == $category_id) { ?>
                            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                            <?php } ?>
                            <?php foreach ($category_2['children'] as $category_3) { ?>
                            <?php if ($category_3['category_id'] == $category_id) { ?>
                            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="right">
                        <?php if ($description) { ?>
                        <p><label for="description"><input type="checkbox" name="description" value="1" id="description" checked="checked" /> <?php echo $entry_description; ?></label></p>
                        <?php } else { ?>
                        <p><label for="description"><input type="checkbox" name="description" value="1" id="description" /> <?php echo $entry_description; ?></label></p>
                        <?php } ?>
                        <?php if ($sub_category) { ?>
                        <p><label for="sub_category"><input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" /> <?php echo $text_sub_category; ?></label></p>
                        <?php } else { ?>
                        <p><label for="sub_category"><input type="checkbox" name="sub_category" value="1" id="sub_category" /> <?php echo $text_sub_category; ?></label></p>
                        <?php } ?>
                    </div>
                    <a id="button-search" class="button but_green"><i class="<?php if($this->config->get('tranda_icon_search') != '') { ?><?php echo $this->config->get('tranda_icon_search'); ?><?php } else { ?>icon-search<?php } ?>"></i><?php echo $button_search; ?></a>
                </div>
                <h6><?php echo $text_search; ?></h6>
                <?php if ($products) { ?>
                <div class="product-grid">
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
                            <div class="upload-rating">
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
                                    <?php if ($product['tax']) { ?>
                                    <span class="price-tax">/&nbsp;&nbsp;<?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                    <?php } ?>
                                </div>
                                <?php } ?>
                                <h3 class="name"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
                            </div>
                            <div class="middle">
                                <a class="add add_cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_cart; ?>"><i class="<?php if($this->config->get('tranda_icon_cart') != '') { ?><?php echo $this->config->get('tranda_icon_cart'); ?><?php } else { ?>icon-shopping-cart<?php } ?>"></i></a>
                                <a class="add add_wishlist" onClick="addToWishList('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_wishlist; ?>"><i class="<?php if($this->config->get('tranda_icon_wishlist') != '') { ?><?php echo $this->config->get('tranda_icon_wishlist'); ?><?php } else { ?>icon-file-alt<?php } ?>"></i></a>
                                <a class="add add_compare" onClick="addToCompare('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_compare; ?>"><i class="<?php if($this->config->get('tranda_icon_compare') != '') { ?><?php echo $this->config->get('tranda_icon_compare'); ?><?php } else { ?>icon-exchange<?php } ?>"></i></a>
                            </div>
                            <div class="bottom">
                                <h5><?php echo $product['description']; ?></h5>
                            </div>
                        </div>
                    </div>
                    <!-- end item -->
                    <?php } ?>
                </div>
                <div class="pagination"><?php echo $pagination; ?></div>
                <?php } else { ?>
                <div class="tranda_empty"><i class="icon-cogs info_icon"></i><?php echo $text_empty; ?></div>
                <?php } ?>
            </div>
            <!-- END SEARCH PAGE -->
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
$('#search_content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#search_content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#search_content select[name=\'category_id\']').attr('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#search_content input[name=\'sub_category\']:checked').attr('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#search_content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		$('.grid-item').attr('class', 'list-item');
		
		$('.product-list > div').each(function(index, element) {
			html = '';
			var image = $(element).find('.image-content').html();
			if (image != null) {
				html += '<div class="image-content">' + image + '</div>';
			}
			html += '<div class="panel-content">';
				var rating = $(element).find('.upload-rating').html();
				if (rating != null) {
					html += '<div class="upload-rating">' + rating + '</div>';
				}
				html += '<div class="top">';
				html += '<h3 class="name">' + $(element).find('.name').html() + '</h3>';
				var price = $(element).find('.price').html();
				if (price != null) {
					html += '<div class="price">' + price  + '</div>';
				}
				html += '</div>';
			html += '<div class="bottom">' + $(element).find('.bottom').html() + '</div>';
			html += '<div class="middle">' + $(element).find('.middle').html() + '</div>';
			html += '</div>';
						
			$(element).html(html);
		});	
		
		$('.display').html('<a class="" onclick="display(\'grid\');"><i class="<?php if($this->config->get("tranda_icon_grid") != '') { ?><?php echo $this->config->get("tranda_icon_grid"); ?><?php } else { ?>icon-th<?php } ?>"></i><span><?php echo $text_grid; ?></span></a><a class="active" onclick=""><i class="<?php if($this->config->get("tranda_icon_list") != '') { ?><?php echo $this->config->get("tranda_icon_list"); ?><?php } else { ?>icon-th-list<?php } ?>"></i><span><?php echo $text_list; ?></span></a>');

		$.cookie('display', 'list');
		$(".rating").tooltip();
		$(".middle a").tooltip();
	} else {
		$('.product-list').attr('class', 'product-grid');
		$('.list-item').attr('class', 'grid-item');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			var image = $(element).find('.image-content').html();
			if (image != null) {
				html += '<div class="image-content">' + image + '</div>';
			}
			html += '<div class="panel-content">';
				var rating = $(element).find('.upload-rating').html();
				if (rating != null) {
					html += '<div class="upload-rating">' + rating + '</div>';
				}
				html += '<div class="top">';
				var price = $(element).find('.price').html();
				if (price != null) {
					html += '<div class="price">' + price  + '</div>';
				}
				html += '<h3 class="name">' + $(element).find('.name').html() + '</h3>';
				html += '</div>';
			html += '<div class="middle">' + $(element).find('.middle').html() + '</div>';
			html += '<div class="bottom">' + $(element).find('.bottom').html() + '</div>';
			html += '</div>';
						
			$(element).html(html);
		});	
		
		$('.display').html('<a class="active" onclick=""><i class="<?php if($this->config->get("tranda_icon_grid") != '') { ?><?php echo $this->config->get("tranda_icon_grid"); ?><?php } else { ?>icon-th<?php } ?>"></i><span><?php echo $text_grid; ?></span></a><a class="" onclick="display(\'list\');"><i class="<?php if($this->config->get("tranda_icon_list") != '') { ?><?php echo $this->config->get("tranda_icon_list"); ?><?php } else { ?>icon-th-list<?php } ?>"></i><span><?php echo $text_list; ?></span></a>');
		
		$.cookie('display', 'grid');
		$(".rating").tooltip();
		$(".middle a").tooltip();
	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script> 
<?php echo $footer; ?>