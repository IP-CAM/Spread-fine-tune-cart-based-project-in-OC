<!-- START JCAROUSEL -->
<div id="carousel<?php echo $module; ?>" class="module-jcarousel global-module">
    <ul class="jcarousel-skin-tranda">
        <?php foreach ($banners as $banner) { ?>
        <li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $banner['title']; ?>" /></a></li>
        <?php } ?>
    </ul>
    <script type="text/javascript"><!--
    $('#carousel<?php echo $module; ?> ul').jcarousel({
        buttonNextHTML: '<div><i class="<?php if($this->config->get('tranda_icon_carnext') != '') { ?><?php echo $this->config->get('tranda_icon_carnext'); ?><?php } else { ?>icon-double-angle-right<?php } ?>"></i></div>',
        buttonPrevHTML: '<div><i class="<?php if($this->config->get('tranda_icon_carback') != '') { ?><?php echo $this->config->get('tranda_icon_carback'); ?><?php } else { ?>icon-double-angle-left<?php } ?>"></i></div>',
        vertical: false,
        visible: <?php echo $limit; ?>,
        scroll: <?php echo $scroll; ?>
    });
    //--></script>
</div>
<!-- END JCAROUSEL -->