<div class="form-content">
    <div id="login" class="left-form-content login-form-box">
        <!-- START -->
        <div class="gpu_box_form">
            <p class="title"><b><?php echo $text_returning_customer; ?></b></p>
            <div class="gpu_form">
                <p><span class="required">*</span> <?php echo $entry_email; ?></p>
                <div><input type="text" name="email" value="" /></div>
            </div>
            <div class="gpu_form">
                <p><span class="required">*</span> <?php echo $entry_password; ?></p>
                <div><input type="password" name="password" value="" /></div>
            </div>
            <div class="buttons">
                <div class="left"><a id="button-login" class="button but_green"><i class="icon-signin"></i><?php echo $button_login; ?></a></div>
                <a class="forgotten" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
            </div>
        </div>
        <!-- END -->
    </div>
    <div class="right-form-content">
        <!-- START -->
        <div class="gpu_box_form">
            <p class="title"><b><?php echo $text_new_customer; ?></b></p>
            <div class="new-customer-box">
                <span><?php echo $text_checkout; ?></span>
                <div class="gpu_form">
                    <div>
                    	<label for="register">
                            <?php if ($account == 'register') { ?>
                            <input type="radio" name="account" value="register" id="register" checked="checked" />
                            <?php } else { ?>
                            <input type="radio" name="account" value="register" id="register" />
                            <?php } ?>
                            <?php echo $text_register; ?>
                        </label>
                        <?php if ($guest_checkout) { ?>
                    	<label for="guest">
                            <?php if ($account == 'guest') { ?>
                            <input type="radio" name="account" value="guest" id="guest" checked="checked" />
                            <?php } else { ?>
                            <input type="radio" name="account" value="guest" id="guest" />
                            <?php } ?>
                            <?php echo $text_guest; ?>
                        </label>
                        <?php } ?>
                    </div>
                </div>
                <p><?php echo $text_register_account; ?></p>
            </div>
            <div class="buttons">
                <div class="right"><a id="button-account" class="button but_black"><i class="icon-edit"></i><?php echo $button_continue; ?></a></div>
            </div>
        </div>
        <!-- END -->
    </div>
</div>