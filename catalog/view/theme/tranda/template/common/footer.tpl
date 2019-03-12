</div>
<!-- END CONTAINER -->
<!-- START FOOTER -->
<div class="footer">
	<div class="footer-top">
        <div class="gpc">
        	<div class="left"></div>
        	<div class="right">
            	<?php if($this->config->get('tranda_display_shipping_f2') == '1') { ?>
                <p class="free"><i class="<?php echo $this->config->get('tranda_shipping_icon'); ?>"></i><?php echo $this->config->get('tranda_shipping_title'); ?>: <?php echo $this->config->get('tranda_shipping_info'); ?></p>
                <?php } ?>
                <?php if($this->config->get('tranda_display_pinterest_f') == '1') { ?>
                <a class="social-icons" href="http://<?php echo $this->config->get('tranda_pinterest_url'); ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $this->config->get('tranda_pinterest_title'); ?>"><i class="<?php echo $this->config->get('tranda_pinterest_icon'); ?>"></i></a>
                <?php } ?>
                <?php if($this->config->get('tranda_display_linkedin_f') == '1') { ?>
                <a class="social-icons" href="http://<?php echo $this->config->get('tranda_linkedin_url'); ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $this->config->get('tranda_linkedin_title'); ?>"><i class="<?php echo $this->config->get('tranda_linkedin_icon'); ?>"></i></a>
                <?php } ?>
                <?php if($this->config->get('tranda_display_github_f') == '1') { ?>
                <a class="social-icons" href="http://<?php echo $this->config->get('tranda_github_url'); ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $this->config->get('tranda_github_title'); ?>"><i class="<?php echo $this->config->get('tranda_github_icon'); ?>"></i></a>
                <?php } ?>
                <?php if($this->config->get('tranda_display_google_f') == '1') { ?>
                <a class="social-icons" href="http://<?php echo $this->config->get('tranda_google_url'); ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $this->config->get('tranda_google_title'); ?>"><i class="<?php echo $this->config->get('tranda_google_icon'); ?>"></i></a>
                <?php } ?>
                <?php if($this->config->get('tranda_display_twitter_f') == '1') { ?>
                <a class="social-icons" href="http://<?php echo $this->config->get('tranda_twitter_url'); ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $this->config->get('tranda_twitter_title'); ?>"><i class="<?php echo $this->config->get('tranda_twitter_icon'); ?>"></i></a>
                <?php } ?>
                <?php if($this->config->get('tranda_display_facebook_f') == '1') { ?>
                <a class="social-icons" href="http://<?php echo $this->config->get('tranda_facebook_url'); ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $this->config->get('tranda_facebook_title'); ?>"><i class="<?php echo $this->config->get('tranda_facebook_icon'); ?>"></i></a>
                <?php } ?>
                <?php if($this->config->get('tranda_display_myicon1_f') == '1') { ?>
                <a class="social-icons" href="http://<?php echo $this->config->get('tranda_myicon1_url'); ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $this->config->get('tranda_myicon1_title'); ?>"><img class="" src="image/<?php echo $this->config->get('tranda_myicon1'); ?>" alt="" /></a>
                <?php } ?>
                <?php if($this->config->get('tranda_display_myicon2_f') == '1') { ?>
                <a class="social-icons" href="http://<?php echo $this->config->get('tranda_myicon2_url'); ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $this->config->get('tranda_myicon2_title'); ?>"><img class="" src="image/<?php echo $this->config->get('tranda_myicon2'); ?>" alt="" /></a>
                <?php } ?>
                <?php if($this->config->get('tranda_display_myicon3_f') == '1') { ?>
                <a class="social-icons" href="http://<?php echo $this->config->get('tranda_myicon3_url'); ?>" rel="tooltip" data-placement="top" data-original-title="<?php echo $this->config->get('tranda_myicon3_title'); ?>"><img class="" src="image/<?php echo $this->config->get('tranda_myicon3'); ?>" alt="" /></a>
                <?php } ?>
            </div>
        </div>
    </div>
	<div class="footer-middle">
        <div class="gpc">
            <ul class="global-contact">
            	<?php if($this->config->get('tranda_display_phone_f') == '1') { ?>
                <li>
                    <i class="<?php echo $this->config->get('tranda_phone_icon'); ?>"></i>
                    <p>
                        <b><?php echo $this->config->get('tranda_phone_title'); ?></b><br />
                        <?php echo $this->config->get('tranda_phone_info_1'); ?>
                        <?php if($this->config->get('tranda_phone_info_2') != '') { ?><br /><?php echo $this->config->get('tranda_phone_info_2'); ?><?php } ?>
                        <?php if($this->config->get('tranda_phone_info_3') != '') { ?><br /><?php echo $this->config->get('tranda_phone_info_3'); ?><?php } ?>
                    </p>
                </li>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_email_f') == '1') { ?>
                <li>
                    <i class="<?php echo $this->config->get('tranda_email_icon'); ?>"></i>
                    <p>
                        <b><?php echo $this->config->get('tranda_email_title'); ?></b><br />
                        <a href="mailto:<?php echo $this->config->get('tranda_email_info_1'); ?>"><?php echo $this->config->get('tranda_email_info_1'); ?></a>
                        <?php if($this->config->get('tranda_email_info_2') != '') { ?><br /><a href="mailto:<?php echo $this->config->get('tranda_email_info_2'); ?>"><?php echo $this->config->get('tranda_email_info_2'); ?></a><?php } ?>
                        <?php if($this->config->get('tranda_email_info_3') != '') { ?><br /><a href="mailto:<?php echo $this->config->get('tranda_email_info_3'); ?>"><?php echo $this->config->get('tranda_email_info_3'); ?></a><?php } ?>
                    </p>
                </li>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_address_f') == '1') { ?>
                <li>
                    <i class="<?php echo $this->config->get('tranda_address_icon'); ?>"></i>
                    <p>
                        <b><?php echo $this->config->get('tranda_address_title'); ?></b><br />
                        <?php echo $this->config->get('tranda_address_info'); ?>
                    </p>
                </li>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_gps_f') == '1') { ?>
                <li>
                    <i class="<?php echo $this->config->get('tranda_gps_icon'); ?>"></i>
                    <p>
                        <b><?php echo $this->config->get('tranda_gps_title'); ?></b><br />
                        <?php echo $this->config->get('tranda_gps_latitude'); ?>
                        <br /><?php echo $this->config->get('tranda_gps_longitude'); ?>
                    </p>
                </li>
                <?php } ?>
                <?php if($this->config->get('tranda_display_schedule_f') == '1') { ?>
                <li>
                    <i class="<?php echo $this->config->get('tranda_schedule_icon'); ?>"></i>
                    <p>
                        <b><?php echo $this->config->get('tranda_schedule_title'); ?></b><br />
                        
                        <?php echo $this->config->get('tranda_schedule_day1'); ?> - <?php echo $this->config->get('tranda_schedule_day2'); ?>: <?php echo $this->config->get('tranda_schedule_hour1'); ?><sup><?php echo $this->config->get('tranda_schedule_minutes1'); ?></sup> - <?php echo $this->config->get('tranda_schedule_hour2'); ?><sup><?php echo $this->config->get('tranda_schedule_minutes2'); ?></sup>
                        <?php if($this->config->get('tranda_schedule_more_info') != '') { ?><span class="infotext"><?php echo $this->config->get('tranda_schedule_more_info'); ?></span><?php } ?>
                    </p>
                </li>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_shipping_f') == '1') { ?>
                <li>
                    <i class="<?php echo $this->config->get('tranda_shipping_icon'); ?>"></i>
                    <p>
                        <b><?php echo $this->config->get('tranda_shipping_title'); ?></b><br />
                        <?php echo $this->config->get('tranda_shipping_info'); ?>
                    </p>
                </li>
                <?php } ?>
            </ul>
            <div class="menu">
            	<?php if ($informations) { ?>
                <ul class="list">
                    <li class="title"><?php echo $text_information; ?></li>
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
                <?php } ?>
                <ul class="list">
                    <li class="title"><?php echo $text_service; ?></li>
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                </ul>
                <ul class="list">
                    <li class="title"><?php echo $text_extra; ?></li>
                    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                    <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                    <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                </ul>
                <ul class="list">
                    <li class="title"><?php echo $text_account; ?></li>
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                    <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                </ul>
            </div>
        </div>
    </div>
	<div class="footer-bottom">
        <div class="gpc">
        	<p class="powered"><?php echo $powered; ?></p><a class="nav-up" id="nav_up" rel="tooltip" data-placement="top" data-original-title="<?php if($this->config->get('tranda_text_top') != '') { ?><?php echo $this->config->get('tranda_text_top'); ?><?php } else { ?>TOP<?php } ?>">
                <i class="<?php if($this->config->get('tranda_icon_firstgotop') != '') { ?><?php echo $this->config->get('tranda_icon_firstgotop'); ?><?php } else { ?>icon-chevron-up<?php } ?> first_icon"></i>
                <i class="<?php if($this->config->get('tranda_icon_secondgotop') != '') { ?><?php echo $this->config->get('tranda_icon_secondgotop'); ?><?php } else { ?>icon-circle-arrow-up<?php } ?> second_icon"></i></a>
            <script><!-- 
                $(function() {
                    $('#nav_up').click(
                        function (e) {
                            $('html, body').animate({scrollTop: '0px'}, 500);
                        }
                    );
                });
            //--></script>
            <div class="footer-payment">
            	<?php if($this->config->get('tranda_display_western_union_f') == '1') { ?>
                	<?php if($this->config->get('tranda_western_union_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_western_union_url'); ?>"><span class="payment_icon western_union"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon western_union"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_visa_electron_f') == '1') { ?>
                	<?php if($this->config->get('tranda_visa_electron_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_visa_electron_url'); ?>"><span class="payment_icon visa_electron"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon visa_electron"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_visa_f') == '1') { ?>
                	<?php if($this->config->get('tranda_visa_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_visa_url'); ?>"><span class="payment_icon visa"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon visa"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_switch_f') == '1') { ?>
                	<?php if($this->config->get('tranda_switch_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_switch_url'); ?>"><span class="payment_icon switch"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon switch"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_solo_f') == '1') { ?>
                	<?php if($this->config->get('tranda_solo_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_solo_url'); ?>"><span class="payment_icon solo"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon solo"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_paypal_f') == '1') { ?>
                	<?php if($this->config->get('tranda_paypal_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_paypal_url'); ?>"><span class="payment_icon paypal"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon paypal"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_mastercard_f') == '1') { ?>
                	<?php if($this->config->get('tranda_mastercard_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_mastercard_url'); ?>"><span class="payment_icon mastercard"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon mastercard"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_maestro_f') == '1') { ?>
                	<?php if($this->config->get('tranda_maestro_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_maestro_url'); ?>"><span class="payment_icon maestro"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon maestro"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_discover_f') == '1') { ?>
                	<?php if($this->config->get('tranda_discover_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_discover_url'); ?>"><span class="payment_icon discover"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon discover"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_direct_f') == '1') { ?>
                	<?php if($this->config->get('tranda_direct_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_direct_url'); ?>"><span class="payment_icon direct"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon direct"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_delta_f') == '1') { ?>
                	<?php if($this->config->get('tranda_delta_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_delta_url'); ?>"><span class="payment_icon delta"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon delta"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_cirrus_f') == '1') { ?>
                	<?php if($this->config->get('tranda_cirrus_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_cirrus_url'); ?>"><span class="payment_icon cirrus"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon cirrus"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_american_express_f') == '1') { ?>
                	<?php if($this->config->get('tranda_american_express_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_american_express_url'); ?>"><span class="payment_icon american_express"> </span></a>
                    <?php } else { ?>
                	<span class="payment_icon american_express"> </span>
                    <?php } ?>
                <?php } ?>
            	<?php if($this->config->get('tranda_display_payment_banner') == '1') { ?>
                    <?php if($this->config->get('tranda_payment_banner') != '') { ?>
                	<?php if($this->config->get('tranda_payment_banner_url') != '') { ?>
                	<a href="http://<?php echo $this->config->get('tranda_payment_banner_url'); ?>"><img class="payment_banner" src="image/<?php echo $this->config->get('tranda_payment_banner'); ?>" alt="" /></a>
                    <?php } else { ?>
                	<img class="payment_banner" src="image/<?php echo $this->config->get('tranda_payment_banner'); ?>" alt="" />
                    <?php } ?>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
    </div>
</div>
<!-- END FOOTER -->
<script src="catalog/view/tranda_root/bootstrap/js/bootstrap-tooltip.js"></script>
<script type="text/javascript"><!--
$("[rel=tooltip]").tooltip();
//--></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-44460837-1', 'inkfi.com');
  ga('send', 'pageview');

</script>

</body>
</html>