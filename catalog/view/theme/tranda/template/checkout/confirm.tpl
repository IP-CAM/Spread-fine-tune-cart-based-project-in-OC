<?php if (!isset($redirect)) { ?>
<div class="checkout-product">
  <table>
    <thead>
      <tr>
        <td class="name"><?php echo $column_name; ?></td>
        <td class="quantity"><?php echo $column_quantity; ?></td>
        <td class="total"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        <p class="model"><b><?php echo $column_model; ?>:</b> <?php echo $product['model']; ?></p>
          <?php foreach ($product['option'] as $option) { ?>
          <small>- <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
          <?php } ?></td>
        <td class="quantity"><?php echo $product['quantity']; ?></td>
        <td class="total"><?php echo $product['total']; ?><p class="price"><?php echo $column_price; ?>: <?php echo $product['price']; ?></p></td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="name"><?php echo $voucher['description']; ?></td>
        <td class="quantity">1</td>
        <td class="total"><?php echo $voucher['amount']; ?><p class="price"><?php echo $column_price; ?>: <?php echo $voucher['amount']; ?></p></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="2" class="price"><?php echo $total['title']; ?>:</td>
        <td class="total"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
</div>
<div class="payment"><?php echo $payment; ?></div>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script> 
<?php } ?>