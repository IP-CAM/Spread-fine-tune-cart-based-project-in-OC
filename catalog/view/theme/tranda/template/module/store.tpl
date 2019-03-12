<!-- START STORE -->
<div class="module-store global-module">
    <h6><?php echo $heading_title; ?></h6>
    <div class="content-store">
        <p><?php echo $text_store; ?></p>
        <ul class="list-global-module static-list-global-module">
            <?php foreach ($stores as $store) { ?>
            <?php if ($store['store_id'] == $store_id) { ?>
            <li><a class="active" href="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
        <ul>
    </div>
</div>
<!-- END STORE -->