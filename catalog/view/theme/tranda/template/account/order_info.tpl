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
            <?php echo $content_top; ?> 
            <!-- START ACCOUNT PAGE -->
        	<div class="account-page">
                <div class="order-history-info">
                    <table class="list">
                    <thead>
                      <tr>
                        <td class="left" colspan="2"><?php echo $text_order_detail; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="left" style="width: 50%;"><?php if ($invoice_no) { ?>
                          <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
                          <?php } ?>
                          <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
                          <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
                        <td class="left" style="width: 50%;"><?php if ($payment_method) { ?>
                          <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
                          <?php } ?>
                          <?php if ($shipping_method) { ?>
                          <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
                          <?php } ?></td>
                      </tr>
                    </tbody>
                    </table>
                    <table class="list">
                    <thead>
                      <tr>
                        <td class="left"><?php echo $text_payment_address; ?></td>
                        <?php if ($shipping_address) { ?>
                        <td class="left"><?php echo $text_shipping_address; ?></td>
                        <?php } ?>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="left"><?php echo $payment_address; ?></td>
                        <?php if ($shipping_address) { ?>
                        <td class="left"><?php echo $shipping_address; ?></td>
                        <?php } ?>
                      </tr>
                    </tbody>
                    </table>
                    <table class="list">
                    <thead>
                      <tr>
                        <td class="left"><?php echo $column_name; ?></td>
                        <td class="left"><?php echo $column_model; ?></td>
                        <td class="right"><?php echo $column_quantity; ?></td>
                        <td class="right"><?php echo $column_price; ?></td>
                        <td class="right"><?php echo $column_total; ?></td>
                        <?php if ($products) { ?>
                        <td style="width: 1px;"></td>
                        <?php } ?>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($products as $product) { ?>
                      <tr>
                        <td class="left"><?php echo $product['name']; ?>
                          <?php foreach ($product['option'] as $option) { ?>
                          <br />
                          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                          <?php } ?></td>
                        <td class="left"><?php echo $product['model']; ?></td>
                        <td class="right"><?php echo $product['quantity']; ?></td>
                        <td class="right"><?php echo $product['price']; ?></td>
                        <td class="right"><?php echo $product['total']; ?></td>
                        <td class="right"><a href="<?php echo $product['return']; ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_return; ?>"><i class="icon-undo"></i></a></td>
                      </tr>
                      <?php } ?>
                      <?php foreach ($vouchers as $voucher) { ?>
                      <tr>
                        <td class="left"><?php echo $voucher['description']; ?></td>
                        <td class="left"></td>
                        <td class="right">1</td>
                        <td class="right"><?php echo $voucher['amount']; ?></td>
                        <td class="right"><?php echo $voucher['amount']; ?></td>
                        <?php if ($products) { ?>
                        <td></td>
                        <?php } ?>
                      </tr>
                      <?php } ?>
                    </tbody>
                    <tfoot>
                      <?php foreach ($totals as $total) { ?>
                      <tr>
                        <td colspan="4" class="right"><b><?php echo $total['title']; ?>:</b></td>
                        <td class="right"><?php echo $total['text']; ?></td>
                        <?php if ($products) { ?>
                        <td></td>
                        <?php } ?>
                      </tr>
                      <?php } ?>
                    </tfoot>
                    </table>
                    <?php if ($comment) { ?>
                    <table class="list">
                    <thead>
                      <tr>
                        <td class="left"><?php echo $text_comment; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="left"><?php echo $comment; ?></td>
                      </tr>
                    </tbody>
                    </table>
                    <?php } ?>
                    <?php if ($histories) { ?>
                    <h2><?php echo $text_history; ?></h2>
                    <table class="list">
                    <thead>
                      <tr>
                        <td class="left"><?php echo $column_date_added; ?></td>
                        <td class="left"><?php echo $column_status; ?></td>
                        <td class="left"><?php echo $column_comment; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($histories as $history) { ?>
                      <tr>
                        <td class="left"><?php echo $history['date_added']; ?></td>
                        <td class="left"><?php echo $history['status']; ?></td>
                        <td class="left"><?php echo $history['comment']; ?></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                    </table>
                    <?php } ?>
                    <div class="buttons">
                        <div class="right"><a href="<?php echo $continue; ?>" class="button"><i class="icon-share-alt"></i><?php echo $button_continue; ?></a></div>
                    </div>
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