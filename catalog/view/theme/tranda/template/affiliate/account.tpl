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
                        <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
                    </ul>
                    <h2><?php echo $text_my_tracking; ?></h2>
                    <ul>
                        <li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
                    </ul>
                    <h2><?php echo $text_my_transactions; ?></h2>
                    <ul>
                        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
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