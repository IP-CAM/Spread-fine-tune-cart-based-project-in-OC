<?php

class ControllerModuleTranda extends Controller {
	
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/tranda');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('tranda', $this->request->post);	

			$this->session->data['success'] = $this->language->get('text_success');

                $this->redirect(HTTPS_SERVER . 'index.php?route=module/tranda&token=' . $this->session->data['token']);
		}
		
		$this->data['text_image_manager'] = 'Image manager';
		$this->data['token'] = $this->session->data['token'];		
		
		$text_strings = array(
				'heading_title',
				'button_save',
				'button_cancel',
				'tranda_tab_welcome',
				'tranda_tab_design',
				'tranda_tab_contact',
				'tranda_tab_payment',
				'tranda_tab_slideshow',
				'tranda_tab_available_icon',
				'tranda_vtab_phone',
				'tranda_vtab_email',
				'tranda_vtab_address',
				'tranda_vtab_gps',
				'tranda_vtab_schedule',
				'tranda_vtab_shipping',
				'tranda_vtab_header_info',
				'tranda_vtab_social_icon',
				'tranda_subtab_facebook',
				'tranda_subtab_twitter',
				'tranda_subtab_google',
				'tranda_subtab_github',
				'tranda_subtab_linkedin',
				'tranda_subtab_pinterest',
				'tranda_faqs_1',
				'tranda_faqs_2',
				'tranda_faqs_3',
				'tranda_faqs_4',
				'tranda_faqs_5',
				'tranda_faqs_6',
				'tranda_faqs_7',
				'tranda_faqs_8',
				'tranda_help_1',
				'tranda_help_2',
				'tranda_help_3',
				'tranda_help_4',
				'tranda_help_5',
				'tranda_help_6',
				'tranda_help_7',
				'tranda_help_8',
				'tranda_input_no',
				'tranda_input_yes',
				'tranda_input_title',
				'tranda_input_icon',
				'tranda_input_more_info',
				'tranda_input_text_info',
				'tranda_input_add_url',
				'tranda_input_add_phone',
				'tranda_input_add_email',
				'tranda_input_add_address',
				'tranda_input_add_gps',
				'tranda_input_latitude',
				'tranda_input_longitude',
				'tranda_input_add_schedule',
				'tranda_input_add_shipping'
		);
		
		foreach ($text_strings as $text) {
			$this->data[$text] = $this->language->get($text);
		}

		$config_data = array(
			'tranda_phone_title', 'tranda_phone_info_1', 'tranda_phone_info_2', 'tranda_phone_info_3', 'tranda_phone_icon', 'tranda_display_phone_h', 'tranda_display_phone_f', 'tranda_email_title', 'tranda_email_info_1', 'tranda_email_info_2', 'tranda_email_info_3', 'tranda_email_icon', 'tranda_display_email_h', 'tranda_display_email_f', 'tranda_address_title', 'tranda_address_info', 'tranda_address_icon', 'tranda_display_address_h', 'tranda_display_address_f', 'tranda_gps_title', 'tranda_gps_latitude', 'tranda_gps_longitude', 'tranda_gps_icon', 'tranda_display_gps_h', 'tranda_display_gps_f', 'tranda_schedule_title', 'tranda_schedule_icon', 'tranda_schedule_day1', 'tranda_schedule_hour1', 'tranda_schedule_minutes1', 'tranda_schedule_day2', 'tranda_schedule_hour2', 'tranda_schedule_minutes2', 'tranda_schedule_more_info', 'tranda_display_schedule_h', 'tranda_display_schedule_f', 'tranda_header_info_title', 'tranda_header_info_icon', 'tranda_header_info_info', 'tranda_display_header_info_h', 'tranda_shipping_title', 'tranda_shipping_icon', 'tranda_shipping_info', 'tranda_display_shipping_h', 'tranda_display_shipping_f', 'tranda_display_shipping_f2', 'tranda_facebook_title', 'tranda_facebook_url', 'tranda_facebook_icon', 'tranda_display_facebook_h', 'tranda_display_facebook_f', 'tranda_twitter_title', 'tranda_twitter_url', 'tranda_twitter_icon', 'tranda_display_twitter_h', 'tranda_display_twitter_f', 'tranda_google_title', 'tranda_google_url', 'tranda_google_icon', 'tranda_display_google_h', 'tranda_display_google_f', 'tranda_github_title', 'tranda_github_url', 'tranda_github_icon', 'tranda_display_github_h', 'tranda_display_github_f', 'tranda_linkedin_title', 'tranda_linkedin_url', 'tranda_linkedin_icon', 'tranda_display_linkedin_h', 'tranda_display_linkedin_f', 'tranda_pinterest_title', 'tranda_pinterest_url', 'tranda_pinterest_icon', 'tranda_display_pinterest_h', 'tranda_display_pinterest_f', 'tranda_display_american_express_f', 'tranda_display_cirrus_f', 'tranda_display_delta_f', 'tranda_display_direct_f', 'tranda_display_discover_f', 'tranda_display_maestro_f', 'tranda_display_mastercard_f', 'tranda_display_paypal_f', 'tranda_display_solo_f', 'tranda_display_switch_f', 'tranda_display_visa_f', 'tranda_display_visa_electron_f', 'tranda_display_western_union_f', 'tranda_american_express_url', 'tranda_cirrus_url', 'tranda_delta_url', 'tranda_direct_url', 'tranda_discover_url', 'tranda_maestro_url', 'tranda_mastercard_url', 'tranda_paypal_url', 'tranda_solo_url', 'tranda_switch_url', 'tranda_visa_url', 'tranda_visa_electron_url', 'tranda_western_union_url', 'tranda_set_skin', 'tranda_adjustment_skin', 'bg_html_color', 'bg_html_banner', 'bg_html_repeat', 'bg_html_attachment', 'bg_html_position', 'transparent_container_top', 'heading_page', 'breadcrumb_text', 'breadcrumb_link', 'breadcrumb_link_hover', 'tranda_responsive', 'tranda_header_bar', 'tranda_slideshow_effect', 'tranda_slideshow_animspeed', 'tranda_slideshow_pausetime', 'tranda_slideshow_directionnav', 'tranda_slideshow_directionnav', 'tranda_slideshow_pauseonhover', 'tranda_directionnav_position', 'tranda_directionnav_prev', 'tranda_directionnav_next', 'tranda_icon_menutab', 'tranda_icon_hometab', 'tranda_icon_accounttab', 'tranda_icon_submenu', 'tranda_icon_currency', 'tranda_icon_language', 'tranda_icon_certificatesale', 'tranda_text_certificatesale', 'tranda_icon_certificatenew', 'tranda_text_certificatenew', 'tranda_icon_secondgotop', 'tranda_icon_firstgotop', 'tranda_icon_cart', 'tranda_icon_compare', 'tranda_icon_wishlist', 'tranda_icon_grid', 'tranda_icon_list', 'tranda_icon_remove', 'tranda_icon_search', 'tranda_icon_checkout', 'tranda_icon_brand', 'tranda_icon_productcode', 'tranda_icon_rewardpoints', 'tranda_icon_availability', 'tranda_icon_tags', 'tranda_product_share', 'tranda_product_list_icon', 'tranda_icon_rating', 'tranda_icon_viewmore', 'tranda_text_viewmore', 'tranda_icon_quickview', 'tranda_text_quickview', 'tranda_text_addcompare', 'tranda_text_addwishlist', 'tranda_text_top', 'tranda_text_category', 'tranda_add_display', 'tranda_display_payment_banner', 'tranda_payment_banner', 'tranda_payment_banner_url', 'tranda_icon_carback', 'tranda_icon_carnext', 'bg_html_paddingtop', 'bg_html_paddingbottom', 'tranda_myicon1_title', 'tranda_myicon1_url', 'tranda_display_myicon1_h', 'tranda_display_myicon1_f', 'tranda_myicon1', 'tranda_myicon2_title', 'tranda_myicon2_url', 'tranda_display_myicon2_h', 'tranda_display_myicon2_f', 'tranda_myicon2', 'tranda_myicon3_title', 'tranda_myicon3_url', 'tranda_display_myicon3_h', 'tranda_display_myicon3_f', 'tranda_myicon3'
		);
		
		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$this->data[$conf] = $this->request->post[$conf];
			} else {
				$this->data[$conf] = $this->config->get($conf);
			}
		}

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/tranda', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/tranda', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->template = 'module/tranda.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/tranda')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>