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
      <h1><img src="view/image/product.png" alt="" /> <?php echo 'Product Inventory'; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-design"><?php echo $tab_design; ?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div>
    
          
          
     
            <table class="list">
             <thead>
              <tr>
                <td></td>
                <?php
                if(!empty($sizes)){
				
              foreach($sizes as $size){
				  ?>
				      <td><?php echo $size['name'];?></td>
					  <?php
				  }
			
          
					}?>
       
              </tr>
              </thead>
              <tbody>

                 <?php
                if(!empty($colors)){
				
              foreach($colors as $color){
				  ?> <tr>
				      <td><?php echo '<span style=" display: block; background-color: #'.$color['color_code'].';width:100px; height:28px; ">&nbsp; </span>';?><?php echo $color['name'];?></td>
				<?php
                if(!empty($sizes)){
                
                foreach($sizes as $size){
					//echo $product_quantity[$color['id']][$size['id']];
					$quant= (!empty($product_quantity[$color['id']][$size['id']]))?$product_quantity[$color['id']][$size['id']]:0;
                ?>
                <td><input type="text" size="4"  name="CS_<?php echo $color['id'];?>_<?php echo $size['id'];?>" id="CS_<?php echo $color['id'];?>_<?php echo $size['id'];?>" value="<?php echo $quant;?>"/></td>
                <?php
                }
                
                
                }?>


                       </tr>
					  <?php
				  }
			
          
					}?>
               
            
             </tbody>

              
            </table>
          </div>
                  </div>
        
      </form>
    </div>
  </div>
</div>


<?php echo $footer; ?>