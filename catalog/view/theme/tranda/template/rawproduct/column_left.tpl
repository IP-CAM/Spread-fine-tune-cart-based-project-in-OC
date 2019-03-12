<?php if ($modules) { ?>
<!-- START COLUMN LEFT -->
<div class="column-left">
<div class="module-category global-module">
    <h6>Categories</h6>
    <ul class="list-global-module static-list-global-module">
                
   <?php foreach ($modules as $module) { ?>
  	<li><a href="<?php echo $module['href']; ?>"><?php echo $module['name']; ?></a></li>
  <?php } ?>
               
            </ul>
</div>

 
</div>
<!-- END COLUMN LEFT -->
<?php } ?> 

