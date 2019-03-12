<!-- START CATEGORY -->
<div class="module-category global-module">
    <h6><?php echo $heading_title; ?></h6>
    <ul class="list-global-module static-list-global-module">
        <?php foreach ($categories as $category) { ?>
        <li>
            <?php if ($category['category_id'] == $category_id) { ?>
            <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            <?php } ?>
            <?php if ($category['children']) { ?>
            <ul>
                <?php foreach ($category['children'] as $child) { ?>
                <li>
                    <?php if ($child['category_id'] == $child_id) { ?>
                    <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                    <?php } ?>
                </li>
                <?php } ?>
            </ul>
            <?php } ?>
        </li>
        <?php } ?>
    </ul>
</div>
<!-- END CATEGORY -->