<!-- START INFORMATION -->
<div class="module-information global-module">
    <h6><?php echo $heading_title; ?></h6>
    <ul class="list-global-module static-list-global-module">
        <?php foreach ($informations as $information) { ?>
        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
        <?php } ?>
        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
        <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
</div>
<!-- END INFORMATION -->