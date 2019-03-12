<!-- START SLIDESHOW -->
<div class="slideshow theme-tranda<?php if ($width > '1220') { ?> slideshow-big-width<?php } else { ?> slideshow-small-width<?php } ?><?php if($this->config->get('tranda_directionnav_position') != '') { ?> <?php echo $this->config->get('tranda_directionnav_position'); ?><?php } else { ?> directionnav-left-right-center<?php } ?>">
    <div id="slider<?php echo $module; ?>" class="nivoSlider">
        <?php foreach ($banners as $banner) { ?>
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" /></a>
        <?php } else { ?>
        <img src="<?php echo $banner['image']; ?>" />
        <?php } ?>
        <?php } ?>
    </div>
    <script type="text/javascript"><!--
    $(document).ready(function() {
        $('#slider<?php echo $module; ?>').nivoSlider();
    });
    --></script>
    <script type="text/javascript"><!--
		$.fn.nivoSlider.defaults = {
			effect: '<?php echo $this->config->get('tranda_slideshow_effect'); ?>',
			slices: 15,
			boxCols: 8,
			boxRows: 4,
			animSpeed: <?php echo $this->config->get("tranda_slideshow_animspeed"); ?>,
			pauseTime: <?php echo $this->config->get("tranda_slideshow_pausetime"); ?>,
			startSlide: 0,
			directionNav: <?php echo $this->config->get("tranda_slideshow_directionnav"); ?>,
			controlNav: true,
			controlNavThumbs: false,
			pauseOnHover: <?php echo $this->config->get("tranda_slideshow_pauseonhover"); ?>,
			manualAdvance: false,
			prevText: '<i class="<?php if($this->config->get('tranda_directionnav_prev') != '') { ?><?php echo $this->config->get('tranda_directionnav_prev'); ?><?php } else { ?>icon-circle-arrow-left<?php } ?>"></i>',
			nextText: '<i class="<?php if($this->config->get('tranda_directionnav_next') != '') { ?><?php echo $this->config->get('tranda_directionnav_next'); ?><?php } else { ?>icon-circle-arrow-right<?php } ?>"></i>',
			randomStart: false,
			beforeChange: function(){},
			afterChange: function(){},
			slideshowEnd: function(){},
			lastSlide: function(){},
			afterLoad: function(){}
		};
    --></script>
</div>
<!-- END SLIDESHOW -->