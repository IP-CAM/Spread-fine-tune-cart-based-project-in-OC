<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a>
      <a href="#tab-data"><?php echo $tab_data; ?></a>
      <a href="#tab-option"><?php echo $tab_option; ?></a>
       <a href="#tab-image"><?php echo 'Images'; ?></a>
    </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="language<?php echo $language['language_id']; ?>">
            <table class="form">
              <tr>
                <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                <td><input type="text" name="raw_product_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($raw_product_description[$language['language_id']]) ? $raw_product_description[$language['language_id']]['name'] : ''; ?>" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_description; ?></td>
                <td><textarea name="raw_product_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($raw_product_description[$language['language_id']]) ? $raw_product_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_keyword; ?></td>
                <td><textarea name="raw_product_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($raw_product_description[$language['language_id']]) ? $raw_product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_description; ?></td>
                <td><textarea name="raw_product_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($raw_product_description[$language['language_id']]) ? $raw_product_description[$language['language_id']]['description'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_tag; ?></td>
                <td><input type="text" name="raw_product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($raw_product_description[$language['language_id']]) ? $raw_product_description[$language['language_id']]['tag'] : ''; ?>" size="80" /></td>
              </tr>
            </table>
          </div>
          <?php } ?>
        </div>
        <div id="tab-data">
          <table class="form">
            <tr>
              <td><?php echo $entry_is_screen_printing; ?></td>
              <td><select name="is_screen_printing">
                  <?php if ($is_screen_printing) { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <option value="0"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_yes; ?></option>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            
            <tr>
              <td><span class="required">*</span> <?php echo $entry_model; ?></td>
              <td><input type="text" name="model" value="<?php echo $model; ?>" />
                <?php if ($error_model) { ?>
                <span class="error"><?php echo $error_model; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_manufacturer; ?></td>
              <td>
              <select id="manufacturer_id" name="manufacturer_id">
              <?php
              foreach($manufacturers as $manufacturer){
				  $select=($manufacturer_id==$manufacturer['manufacturer_id'] && $manufacturer_id!='')?'selected="selected"':'';
				  ?>
				      <option value="<?php echo $manufacturer['manufacturer_id'] ?>" <?php echo $select;?>><?php echo $manufacturer['name'] ?></option>
					  <?php
				  }
			  ?>
          
              </select></td>
            </tr>
           <tr>
              <td><span class="required">*</span> <?php echo $entry_category; ?></td>
              <td>
              <select id="category_id" name="category_id">
              <?php
              foreach($categories as $category){
				   $select=($category_id==$category['category_id'] && $category_id!='')?'selected="selected"':'';
				  ?>
				      <option value="<?php echo $category['category_id'] ?>" <?php echo $select; ?>><?php echo $category['name'] ?></option>
					  <?php
				  }
			  ?>
          
              </select></td>
            </tr>
     
            <tr>
              <td><?php echo $entry_price; ?></td>
              <td><input type="text" name="price" value="<?php echo $price; ?>" /></td>
            </tr>
     
            <tr>
              <td><?php echo $entry_minimum; ?></td>
              <td><input type="text" name="minimum" value="<?php echo $minimum; ?>" size="2" /></td>
            </tr>
          
           
           
           
            <tr>
              <td><?php echo $entry_dimension; ?></td>
              <td><input type="text" name="length" value="<?php echo $length; ?>" size="4" />
                <input type="text" name="width" value="<?php echo $width; ?>" size="4" />
                <input type="text" name="height" value="<?php echo $height; ?>" size="4" /></td>
            </tr>
           
            <tr>
              <td><?php echo $entry_weight; ?></td>
              <td><input type="text" name="weight" value="<?php echo $weight; ?>" /></td>
            </tr>
            
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
           
          </table>
        </div>
        
       <div id="tab-option">
          <table class="form">
            <tr>
              <td valign="top"><span class="required">*</span><?php echo ' Color'; ?></td>
              <td valign="top" align="left">
              <div style="width: 100%; max-height: 250px; overflow-y: auto;">
              <table style="width:100%" class="list">
              <thead>
              <tr>
              <td>Default</td>
              <td></td>
              <td>Color</td>
              <td>Name</td>
              <td>Price</td>
              </tr>
              </thead>
              <tbody>
              <?php
			  
			  if($colors){
				 
				  foreach($colors as $color){
					  $checkedbox=(in_array($color['color_id'],$product_colors['id']))?'checked="checked"':'';
					  $checkedradio=($color['color_id']==$product_colors['default'])?'checked="checked"':'';
			   ?>
              <tr>
              <td><input type="radio" name="color_default" value="<?php echo $color['color_id'];?>" id="color_default<?php echo $color['color_id'];?>" data-id='<?php echo $color['color_id'];?>' onclick="checkselectcolor('<?php echo $color['color_id'];?>')" <?=$checkedradio?> /></td>
              <td><input type="checkbox" name="color_ids[]" value="<?php echo $color['color_id'];?>" id="color_id<?php echo $color['color_id'];?>" data-id='<?php echo $color['color_id'];?>'   data-name='<?php echo $color['name']; ?>' onclick="makeview()" class="procolor" <?=$checkedbox?>  /></td>
              <td id='colorcode<?php echo $color['color_id'];?>'><?php echo '<span style=" display: block; background-color: #'.$color['code'].';width:100px; height:28px; ">&nbsp; </span>';?></td>
              <td><?php echo $color['name'];?></td>
              <td><input type="text" name="color_price<?php echo $color['color_id'];?>" value="<?=(!empty($product_colors['price'][$color['color_id']]))?$product_colors['price'][$color['color_id']]:0;?>" size="4" />
              <input type="hidden" name="color_code<?php echo $color['color_id'];?>" value="<?php echo $color['code'];?>" size="4" /></td>
              </tr>
              <?php }
			  }
			  ?>
              </tbody>
              </table>
              </div>
              </td>
            </tr>
           
            <tr>
              <td valign="top"><span class="required">*</span><?php echo ' View'; ?></td>
             <td valign="top" align="left">
              <div style="width: 100%; max-height: 250px; overflow-y: auto;">
              <table style="width:100%" class="list">
              <thead>
              <tr>
              <td>Name</td>
              <td>Price</td>
              </tr>
              </thead>
              <tbody>
              <?php
			  if($dis_view){
				  foreach($dis_view as $view){
			   ?>
              <tr>
              
              <td>
			  <input type="hidden" name="view_default" value="<?php echo $view['view_id'];?>" id="view_default<?php echo $view['view_id'];?>" data-id='<?php echo $view['view_id'];?>'  onclick="checkselectview('<?php echo $view['view_id'];?>')"  />
              <input type="hidden" name="view_ids[]" value="<?php echo $view['view_id'];?>" id="view_id<?php echo $view['view_id'];?>" data-id='<?php echo $view['view_id'];?>' data-name='<?php echo $view['name']; ?>'  onclick="makeview()" class='proview'  /><?php echo $view['name'];?></td>
               <td><input type="text" name="view_price<?php echo $view['view_id'];?>" value="<?=($view['price']>0)?$view['price']:0;?>" size="4" /></td>
              </tr>
              <?php }
			  }
			  ?>
              </tbody>
              </table>
              <?php
              	  if($views){
				  foreach($views as $view){
					  ?>
                      <input type="hidden" name="OLDCV_<?=$view['color_id']?>_<?=$view['view_id']?>" value="<?=$view['image']?>" id="OLDCV_<?=$view['color_id']?>_<?=$view['view_id']?>" />
                      
				  <?php }
				  }?>
              </div>
              </td>
            </tr>
     
            <tr>
              <td valign="top"><span class="required">*</span><?php echo ' Size'; ?></td>
                <td valign="top" align="left">
              <div style="width: 100%; max-height: 250px; overflow-y: auto;">
              <table style="width:100%" class="list">
              <thead>
              <tr>
           
              <td></td>
              <td>Name</td>
              <td>Price</td>
              </tr>
              </thead>
              <tbody>
              <?php
			  if($sizes){
				  foreach($sizes as $size){
					  $checked=(in_array($size['size_id'],$product_sizes['id']))?'checked="checked"':'';
			   ?>
              <tr>
             
              <td><input type="checkbox" name="size_ids[]" value="<?php echo $size['size_id'];?>" id="size_id<?php echo $size['size_id'];?>" data='<?php echo $size['size_id'];?>' <?php echo $checked?>  /></td>
              <td><?php echo $size['name'];?></td>
              <td><input type="text" name="size_price<?php echo $size['size_id'];?>" value="<?=(!empty($product_sizes['price'][$size['size_id']]))?$product_sizes['price'][$size['size_id']]:0;?>" size="4" /></td>
              </tr>
              <?php }
			  }
			  ?>
              </tbody>
              </table>
              </div></td>
            </tr>
          
           
           
          
          </table>
        </div>
        <div id="tab-image">
       
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 

<script type="text/javascript"><!--
var RAWPRODUCT_41x41='<?php echo RAWPRODUCT_41x41;?>'
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
$('#vtab-option a').tabs();

$(document).ready(function(){
	makeview();
	})

function checkselectcolor(id){
	
	if($('#color_default'+id).is(":checked")){
		$('#color_id'+id).attr('checked','checked');
		makeview();
		}
	
	}
	function checkselectview(id){
	
	if($('#view_default'+id).is(":checked")){
		$('#view_id'+id).attr('checked','checked');
		makeview();
		}
	
	}
function makeview(){
	
	var color=new Array();
	var view=new Array();
	$('#tab-image').html('');
	$('.procolor:checked').each(function() {
        color.push($(this).data("id"));
       

 });
 	$('.proview').each(function() {
        view.push($(this).data("id"));
       

 });
 
 if(color > '0' && view > '0'){

$.each(color, function(index, value) {
		
		

		var color_id='color_id'+value;
	var htm='<table class="form">\
        <tr>\
        <td valign="top">\
		'+$('#colorcode'+value).html()+'\
		 '+$('#'+color_id).data('name')+'</td>\
        <td valign="top" align="left">\
		<table class="list">';
		$.each(view, function(viewindex, viewvalue) {
		var view_id='view_id'+viewvalue;
		htm=htm+'<tr>\
		<td>'+$('#'+view_id).data('name')+'</td>\
		<td>';
		var imgid='OLDCV_'+value+'_'+viewvalue;
		if($('#'+imgid).length>0)
		{
		htm=htm+'<img src="'+RAWPRODUCT_41x41+$('#'+imgid).val()+'" style="padding: 1px; border: 1px solid #DDDDDD;" />';
		}
		htm=htm+'<input type="file" name="CV_'+value+'_'+viewvalue+'" value=""></td>\
		</tr>';
		})
		htm=htm+'</table>\
        </td>\
        </tr>\
        </table>';
		
		$('#tab-image').append(htm);
		htm='';
	});
 }
 
	}
//--></script> 
<?php echo $footer; ?>