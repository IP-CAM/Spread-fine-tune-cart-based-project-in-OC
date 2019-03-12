<?php 
if ($modules) { ?>
<div id="column-left">

  <div class="box">
  <div class="box-heading">Categories</div>
  <div class="box-content">
    <ul class="box-category">
       <?php foreach ($modules as $module) { ?>
       <li><a href="<?php echo $module['href']; ?>"><?php echo $module['name']; ?></a></li>
       <?php } ?>
    </ul>
  </div>
</div>
</div>

<?php } ?> 

