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
    
          
          
     
            <table class="form fonttypecon">
              <tr>
                <td><span class="required">*</span> Color Name</td>
                <td><input type="text" value="<?php echo $name; ?>" name="name" id="name"/>
                 </td>
              </tr>
                 <tr>
                <td><span class="required">*</span> Color Code</td>
                <td><input type="text" value="<?php echo $code; ?>" name="code" id="color_code"/>
                 </td>
              </tr>
      
              
              <tr>
              <td>Default:</td>
              <td>
                <input type="checkbox" name="is_default" value="1" <?=($is_default=='1')?'checked="checked"':''?> />
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
        
      </form>
    </div>
  </div>
</div>
<link rel="stylesheet" media="screen" type="text/css" href="<?php echo HTTP_SERVER; ?>css/colorpicker.css" />
<script type="text/javascript" src="<?php echo HTTP_SERVER; ?>js/colorpicker.js"></script>
 <script language="javascript" type="text/javascript" >
            jQuery(document).ready(function(){ 
			$('#color_code').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});
           
			jQuery("#formID").validationEngine({
			   	promptPosition: "topRight"
			});	
				
            });
   
</script> 

<?php echo $footer; ?>