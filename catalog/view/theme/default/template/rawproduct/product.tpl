<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="product-info">
    <?php
    $x=0; 
    foreach($images as $id=>$imglist)
    {
    	$x++;
        if ($thumb || $images) {
         ?>
    <div class="left" <?php if($x!=1){?>style="display:none;"<?php }?> id="color<?php echo $id;?>">
      <?php foreach ($imglist as $thumb) { ?>
      <div class="image"><a href="<?php echo RAWPRODUCT_500x500.$thumb; ?>" title="<?php echo $heading_title; ?>" class="colorbox" id="thumb<?php echo $id;?>"><img src="<?php echo RAWPRODUCT_500x500.$thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" height="228" width="228" id="thumbimg<?php echo $id;?>" /></a></div>
      <input type="hidden" name="colorid" id="colorid" value="<?php echo $id;?>" />
      <?php break;}?>
      <?php if ($imglist) { ?>
      <div class="image-additional">
        <?php foreach ($imglist as $image) { ?>
       <a href="javaScript:void(0);"><img src="<?php echo RAWPRODUCT_41x41.$image; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" onclick="changeViewImage('<?php echo RAWPRODUCT_500x500.$image; ?>','<?php echo $id; ?>');" /></a>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
    <?php }
    }
    ?>
    
    <div class="right">
      <div class="description">
        <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span> <?php echo $stock; ?></div>
      <?php if ($price) { ?>
      <div class="price"><?php echo $text_price; ?>
        <?php if (!$special) { ?>
        <?php echo $price; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
        <?php } ?>
        <br />
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
        <?php } ?>
        </div>
      <?php } ?>
      <div class="options" style="height:60px;">
        <h2><?php echo $text_option; ?></h2>
        <div>
        <?php foreach($colors as $a=>$k){?>
        <?php //var_dump($k);?>
        <div class="colorplatethumb" style="background-color:#<?php echo $k['color_code'];?>" onclick="changeColor('<?php echo $k['id'];?>');">&nbsp;</div>
        <?php }?>
        </div> 
         <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
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
        <br />
        <?php } ?>
        <?php } ?>
      </div>
      <div class="cart">
        <div>
           <a id="button-customize" class="button" href="javaScript:void(0);" onclick="customPath();"><?php echo $text_customize; ?></a>
          </div>
        <?php if ($minimum > 1) { ?>
        <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
      </div>
      <?php if ($review_status) { ?>
      <div class="review">
        <div class="share"><!-- AddThis Button BEGIN -->
          <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
          <!-- AddThis Button END --> 
        </div>
      </div>
      <?php } ?>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}
});
//--></script> 
<style>
.colorplatethumb{
	height:30px; width:30px;float:left; margin-left:10px; border:1px solid; cursor:pointer;
	
	}
</style>
<script type="text/javascript">
function changeColor(a)
	{
		$('.left').hide();
		$('#color'+a).show();
		$('#colorid').val(a);
	}

function customPath()
{
	var a = "<?php echo str_replace('&amp;','&',$customize);?>";
	window.location.href = a+'&rawProductColorId='+document.getElementById("colorid").value;
}

function changeViewImage(a,b)
{
	$("#thumbimg"+b).attr('src',a);
	$("#thumb"+b).attr('href',a);
}	
</script>

<?php echo $footer; ?>