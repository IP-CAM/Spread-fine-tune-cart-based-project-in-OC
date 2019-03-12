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
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-design"><?php echo $tab_design; ?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div>
          <div id="fontdiv">
          <?php
          
           if(!empty($font_value)){
          $i=1;
          $font_value_ids='';
          foreach($font_value as $fv){
          $font_value_ids.=$fv['font_value_id'].",";
          ?>
          <table class="form fonttypecon" id="con<?=$i?>">
              <tr>
                <td><span class="required">*</span> Font TTF <?=$i?></td>
                <td><img src="<?php echo FONTPATH.$fv['image']; ?>"/><input type="file" value=""  name="editfontTTF<?=$fv['font_value_id']?>">
                 </td>
              </tr>
                 <tr>
                <td><span class="required">*</span> Font Style</td>
                <td><select id="font_type<?=$i?>" name="editfont_type<?=$fv['font_value_id']?>">
          <option value="normal" <?=($fv['font_type']=='normal')?'selected="selected"':''?> >Normal</option>
          <option value="bold" <?=($fv['font_type']=='bold')?'selected="selected"':''?> >Bold</option>
          <option value="italic" <?=($fv['font_type']=='italic')?'selected="selected"':''?> >Italic</option>
        <!--  <option value="underLine" <? //=($fv['font_type']=='underLine')?'selected="selected"':''?> >UnderLine</option>-->
          <option value="boldI" <?=($fv['font_type']=='boldI')?'selected="selected"':''?> >Bold Italic</option>
					  </select>
                      <? if($i>1){ /* ?>
                      <a href="javascript:void(0);" onclick="$('#con<?=$i?>').remove();" class="button">[x]</a>
                      <? */ }?>
                 </td>
              </tr>
              </table>
          <? 
          $i++;
          }
          $font_value_ids=rtrim($font_value_ids,',');
          ?>
          <input type="hidden" value="<?=$font_value_ids?>" name="font_value_ids"/>
          <?
          }else{?>
            <table class="form fonttypecon">
              <tr>
                <td><span class="required">*</span> Font TTF 1</td>
                <td><input type="file" value=""  name="fontTTF1">
                 </td>
              </tr>
                 <tr>
                <td><span class="required">*</span> Font Style</td>
                <td><select id="font_type1" name="font_type1">
					  <option value="normal">Normal</option>
					  <option value="bold">Bold</option>
					  <option value="italic">Italic</option>
					  <!--<option value="underLine">UnderLine</option>-->
					  <option value="boldI">Bold Italic</option>
					  </select>
                 </td>
              </tr>
              </table>
              <?php } ?>
              </div>
                  <table class="form">
              <tr>
                <td></td>
                <td><a href="javascript:void(0);" id="addmore" class="button">Add More</a>
                 </td>
              </tr>
              
              </table>
                  
               <table class="form ">
              
              <tr>
              <td>Default:</td>
              <td>
                <input type="checkbox" name="is_default" value="1" <?=($is_default=='1')?'checked="checked"':''?> />
               </td>
            </tr>
             <tr>
              <td>Direction To show :</td>
              <td>
                <input type="radio" name="directionshow" value="1" <?=($directionshow=='1')?'checked="checked"':''?> /> Left To Right &nbsp; <input type="radio" name="directionshow" value="2" <?=($directionshow=='2')?'checked="checked"':''?> /> Right To Left 
               </td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
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
                  </div>
        
        <input type="hidden" value="1" name="numberoftype" id="numberoftype"/>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
	var numberoftype=1;
	$('#numberoftype').val($('.fonttypecon').length);
	$('#addmore').click(function(){
		if($('.fonttypecon').length<4){
		numberoftype=parseInt($('.fonttypecon').length)+parseInt(1);
		var html=' <table class="form fonttypecon" id="con'+numberoftype+'">\
              <tr>\
                <td><span class="required">*</span> Font TTF '+numberoftype+'</td>\
                <td><input type="file" value=""  name="fontTTF'+numberoftype+'">\
                 </td>\
              </tr>\
                 <tr>\
                <td><span class="required">*</span> Font Style</td>\
                <td><select id="font_type1" name="font_type'+numberoftype+'">\
					  <option value="normal">Normal</option>\
					  <option value="bold">Bold</option>\
					  <option value="italic">Italic</option>\
					 <!-- <option value="underLine">UnderLine</option>-->\
					  <option value="boldI">Bold Italic</option>\
					  </select>\
					  <a href="javascript:void(0);" onclick="$(\'#con'+numberoftype+'\').remove();" class="button">[x]</a>\
                 </td>\
              </tr>\
              </table>';
			  
			  $('#fontdiv').append(html);
			  $('#numberoftype').val(numberoftype);
		}
		})
	})


//--></script> 

<?php echo $footer; ?>