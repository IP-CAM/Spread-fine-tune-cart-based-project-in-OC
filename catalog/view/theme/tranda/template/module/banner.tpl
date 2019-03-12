<!-- START BANNER -->
<div class="global-module module-banner">
  <?php foreach ($banners as $banner) { ?>
  <div>
  <?php if ($banner['link']) { ?>
  <a class="banner-shop" href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" /></a>
  <?php } else { ?>
  <img class="banner-shop" src="<?php echo $banner['image']; ?>" />
  <?php } ?>
  </div>
  <?php } ?>
</div>
<!-- END BANNER -->