<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <ul id="currency" class="list-options-currency">
        <li class="title"><i class="<?php if($this->config->get('tranda_icon_currency') != '') { ?><?php echo $this->config->get('tranda_icon_currency'); ?><?php } else { ?>icon-money<?php } ?>"></i><?php echo $text_currency; ?></li>
        <?php foreach ($currencies as $currency) { ?>
        <?php if ($currency['code'] == $currency_code) { ?>
        <?php if ($currency['symbol_left']) { ?>
        <li><a><span><i class="icon-check"></i></span><?php echo $currency['title']; ?></a></li>
        <?php } else { ?>
        <li><a><span><i class="icon-check"></i></span><?php echo $currency['title']; ?></a></li>
        <?php } ?>
        <?php } else { ?>
        <?php if ($currency['symbol_left']) { ?>
        <li onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();"><a><span><?php echo $currency['symbol_left']; ?></span><?php echo $currency['title']; ?></a></li>
        <?php } else { ?>
        <li onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();"><a><span><?php echo $currency['symbol_right']; ?></span><?php echo $currency['title']; ?></a></li>
        <?php } ?>
        <?php } ?>
        <?php } ?>
    </ul> 
    <div id="currency" class="options-responsive">
        <?php foreach ($currencies as $currency) { ?>
        <?php if ($currency['code'] == $currency_code) { ?>
        <?php if ($currency['symbol_left']) { ?>
        <b><?php echo $currency['symbol_left']; ?></b>
        <?php } else { ?>
        <b><?php echo $currency['symbol_right']; ?></b>
        <?php } ?>
        <?php } else { ?>
        <?php if ($currency['symbol_left']) { ?>
        <a onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();"><?php echo $currency['symbol_left']; ?></a>
        <?php } else { ?>
        <a onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();"><?php echo $currency['symbol_right']; ?></a>
        <?php } ?>
        <?php } ?>
        <?php } ?>
    </div>
<input type="hidden" name="currency_code" value="" />
<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>