<?php echo $header; ?>
<div class="container-top">
    <div class="gpc">
    	<!-- START CONTENT TOP -->
        <div class="content-top">
            <!-- START BREADCRUMB -->
            <h1 class="page_title"><?php echo $heading_title; ?></h1>
            <div class="breadcrumb">
            	<h2>
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                <?php } ?>
                </h2>
            </div>
            <!-- END BREADCRUMB -->
        </div>
        <!-- END CONTENT TOP -->
    </div>
</div>
<div class="container-bottom">
    <div class="gpc">
    	<?php echo $column_left; ?>
        <?php echo $column_right; ?>
        <!-- START COLUMN CENTER -->
        <div class="column-center">
            <div class="page_notification">
                <?php if ($success) { ?>
                <div class="success"><i class="icon-ok info_icon"></i><?php echo $success; ?></div>
                <?php } ?>
            </div>
            <?php echo $content_top; ?> 
            <!-- START ACCOUNT PAGE -->
        	<div class="account-page">
                <div class="admin-panel">
                    <h2><?php echo $text_my_account; ?></h2>
                    <ul>
                        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                    </ul>
                    <h2><?php echo $text_my_orders; ?></h2>
                    <ul>
                        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                        <?php if ($reward) { ?>
                        <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
                        <?php } ?>
                        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                    </ul>
                    <h2><?php echo $text_my_newsletter; ?></h2>
                    <ul>
                        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                    </ul>
                </div>
            </div>
            <!-- END ACCOUNT PAGE -->
        </div>
        <!-- END COLUMN CENTER -->
    	<!-- START CONTENT BOTTOM -->
        <div class="content-bottom">
            <?php echo $content_bottom; ?>
        </div>
        <!-- END CONTENT BOTTOM -->
    </div>
</div>
<?php echo $footer; ?>