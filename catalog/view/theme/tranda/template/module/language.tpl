<?php if (count($languages) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <ul id="language" class="list-options-language">
        <li class="title"><i class="<?php if($this->config->get('tranda_icon_language') != '') { ?><?php echo $this->config->get('tranda_icon_language'); ?><?php } else { ?>icon-globe<?php } ?>"></i><?php echo $text_language; ?></li>
        <?php foreach ($languages as $language) { ?>
        <li onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $(this).parent().parent().submit();" ><a rel="tooltip" data-placement="top" data-original-title="<?php echo $language['name']; ?>"><img src="image/flags/<?php echo $language['image']; ?>" /></a></li>
        <?php } ?>
    </ul>
    <div id="language" class="options-responsive">
        <?php foreach ($languages as $language) { ?>
        <a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $(this).parent().parent().submit();" ><img src="image/flags/<?php echo $language['image']; ?>" /></a>
        <?php } ?>
    </div>
<input type="hidden" name="language_code" value="" />
<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>