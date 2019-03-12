<?php echo $header; ?><?php //echo $column_left; ?><?php //echo $column_right; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<iframe src="//inkfi.com/demo/spreadshirt/alaskar/index.html?mainProductId=<?=$_GET['mainProductId']?>" frameborder="0" border="0" width="1000" height="780" id="confomat8"></iframe>
  
  
  </div>

<?php echo $footer; ?>