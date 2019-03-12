<?php
class ControllerRawproductProduct extends Controller {
	private $error = array();

	public function index() {
		$this -> language -> load('rawproduct/product');

		$this -> document -> setTitle($this -> language -> get('heading_title'));

		$this -> load -> model('rawproduct/product');
		//echo "nafees";
		$this -> getList();
	}

	public function insert() {
		$this -> language -> load('rawproduct/product');

		$this -> document -> setTitle($this -> language -> get('heading_title'));

		$this -> load -> model('rawproduct/product');

		if (($this -> request -> server['REQUEST_METHOD'] == 'POST') && $this -> validateForm()) {
			$this -> model_rawproduct_product -> addProduct($this -> request -> post, $_FILES);

			$this -> session -> data['success'] = $this -> language -> get('text_success');

			$url = '';

			if (isset($this -> request -> get['sort'])) {
				$url .= '&sort=' . $this -> request -> get['sort'];
			}

			if (isset($this -> request -> get['order'])) {
				$url .= '&order=' . $this -> request -> get['order'];
			}

			if (isset($this -> request -> get['page'])) {
				$url .= '&page=' . $this -> request -> get['page'];
			}

			$this -> redirect($this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL'));
		}

		$this -> getForm();
	}

	public function update() {
		$this -> language -> load('rawproduct/product');

		$this -> document -> setTitle($this -> language -> get('heading_title'));

		$this -> load -> model('rawproduct/product');

		if (($this -> request -> server['REQUEST_METHOD'] == 'POST') && $this -> validateForm()) {
			$this -> model_rawproduct_product -> editProduct($this -> request -> get['raw_product_id'], $this -> request -> post, $_FILES);

			$this -> session -> data['success'] = $this -> language -> get('text_success');

			$url = '';

			if (isset($this -> request -> get['sort'])) {
				$url .= '&sort=' . $this -> request -> get['sort'];
			}

			if (isset($this -> request -> get['order'])) {
				$url .= '&order=' . $this -> request -> get['order'];
			}

			if (isset($this -> request -> get['page'])) {
				$url .= '&page=' . $this -> request -> get['page'];
			}

			$this -> redirect($this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL'));
		}

		$this -> getFormEdit();
	}

	public function inventory() {
		$this -> language -> load('rawproduct/product');

		$this -> document -> setTitle($this -> language -> get('heading_title'));

		$this -> load -> model('rawproduct/product');

		if (($this -> request -> server['REQUEST_METHOD'] == 'POST')) {
			$this -> model_rawproduct_product -> setInventory($this -> request -> get['raw_product_id'], $this -> request -> post);

			$this -> session -> data['success'] = $this -> language -> get('text_success');

			$url = '';

			if (isset($this -> request -> get['sort'])) {
				$url .= '&sort=' . $this -> request -> get['sort'];
			}

			if (isset($this -> request -> get['order'])) {
				$url .= '&order=' . $this -> request -> get['order'];
			}

			if (isset($this -> request -> get['page'])) {
				$url .= '&page=' . $this -> request -> get['page'];
			}

			$this -> redirect($this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL'));
		}

		$this -> getFormInventory();
	}

	public function delete() {
		$this -> language -> load('rawproduct/product');

		$this -> document -> setTitle($this -> language -> get('heading_title'));

		$this -> load -> model('rawproduct/product');

		if (isset($this -> request -> post['selected']) && $this -> validateDelete()) {
			foreach ($this->request->post['selected'] as $raw_product_id) {
				$this -> model_rawproduct_product -> deleteProduct($raw_product_id);
			}

			$this -> session -> data['success'] = $this -> language -> get('text_success');

			$url = '';

			if (isset($this -> request -> get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this -> request -> get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this -> request -> get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this -> request -> get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this -> request -> get['filter_price'])) {
				$url .= '&filter_price=' . $this -> request -> get['filter_price'];
			}

			if (isset($this -> request -> get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this -> request -> get['filter_quantity'];
			}

			if (isset($this -> request -> get['filter_status'])) {
				$url .= '&filter_status=' . $this -> request -> get['filter_status'];
			}

			if (isset($this -> request -> get['sort'])) {
				$url .= '&sort=' . $this -> request -> get['sort'];
			}

			if (isset($this -> request -> get['order'])) {
				$url .= '&order=' . $this -> request -> get['order'];
			}

			if (isset($this -> request -> get['page'])) {
				$url .= '&page=' . $this -> request -> get['page'];
			}

			$this -> redirect($this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL'));
		}

		$this -> getList();
	}

	public function designer() {
		$this -> language -> load('rawproduct/product');

		$this -> document -> setTitle($this -> language -> get('heading_title'));

		$this -> load -> model('rawproduct/product');

		if (($this -> request -> server['REQUEST_METHOD'] == 'POST') && $this -> validateForm()) {
		}

		$this -> getFormDesigner();

	}

	protected function getList() {

		if (isset($this -> request -> get['sort'])) {
			$sort = $this -> request -> get['sort'];
		} else {
			$sort = 'pd.name';
		}

		if (isset($this -> request -> get['order'])) {
			$order = $this -> request -> get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this -> request -> get['page'])) {
			$page = $this -> request -> get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this -> request -> get['sort'])) {
			$url .= '&sort=' . $this -> request -> get['sort'];
		}

		if (isset($this -> request -> get['order'])) {
			$url .= '&order=' . $this -> request -> get['order'];
		}

		if (isset($this -> request -> get['page'])) {
			$url .= '&page=' . $this -> request -> get['page'];
		}

		$this -> data['breadcrumbs'] = array();

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home', 'token=' . $this -> session -> data['token'], 'SSL'), 'separator' => false);

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('heading_title'), 'href' => $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL'), 'separator' => ' :: ');

		$this -> data['insert'] = $this -> url -> link('rawproduct/product/insert', 'token=' . $this -> session -> data['token'] . $url, 'SSL');
		//$this->data['copy'] = $this->url->link('rawproduct/product/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this -> data['delete'] = $this -> url -> link('rawproduct/product/delete', 'token=' . $this -> session -> data['token'] . $url, 'SSL');

		$this -> data['products'] = array();

		$product_total = $this -> model_rawproduct_product -> getTotalProducts();

		$results = $this -> model_rawproduct_product -> getProducts();

		foreach ($results as $result) {
			$action = array();

			$action[] = array('text' => $this -> language -> get('text_edit'), 'href' => $this -> url -> link('rawproduct/product/update', 'token=' . $this -> session -> data['token'] . '&raw_product_id=' . $result['raw_product_id'] . $url, 'SSL'));

			$action[] = array('text' => 'Inventory', 'href' => $this -> url -> link('rawproduct/product/inventory', 'token=' . $this -> session -> data['token'] . '&raw_product_id=' . $result['raw_product_id'] . $url, 'SSL'));

			$special = false;

			$this -> data['products'][] = array('raw_product_id' => $result['raw_product_id'], 'name' => $result['name'], 'model' => $result['model'], 'price' => $result['price'], 'image' => $result['image'], 'is_screen_printing' => $result['is_screen_printing'], 'status' => ($result['status'] ? $this -> language -> get('text_enabled') : $this -> language -> get('text_disabled')), 'selected' => isset($this -> request -> post['selected']) && in_array($result['raw_product_id'], $this -> request -> post['selected']), 'action' => $action);
		}

		$this -> data['heading_title'] = $this -> language -> get('heading_title');

		$this -> data['text_enabled'] = $this -> language -> get('text_enabled');
		$this -> data['text_disabled'] = $this -> language -> get('text_disabled');
		$this -> data['text_no_results'] = $this -> language -> get('text_no_results');
		$this -> data['text_image_manager'] = $this -> language -> get('text_image_manager');
		$this -> data['text_yes'] = $this -> language -> get('text_yes');
		$this -> data['text_no'] = $this -> language -> get('text_no');

		$this -> data['column_image'] = $this -> language -> get('column_image');
		$this -> data['column_name'] = $this -> language -> get('column_name');
		$this -> data['column_model'] = $this -> language -> get('column_model');
		$this -> data['column_price'] = $this -> language -> get('column_price');
		$this -> data['column_quantity'] = $this -> language -> get('column_quantity');
		$this -> data['column_status'] = $this -> language -> get('column_status');
		$this -> data['column_action'] = $this -> language -> get('column_action');
		$this -> data['column_is_screen_printing'] = $this -> language -> get('column_is_screen_printing');

		$this -> data['button_copy'] = $this -> language -> get('button_copy');
		$this -> data['button_insert'] = $this -> language -> get('button_insert');
		$this -> data['button_delete'] = $this -> language -> get('button_delete');
		$this -> data['button_filter'] = $this -> language -> get('button_filter');

		$this -> data['token'] = $this -> session -> data['token'];

		if (isset($this -> error['warning'])) {
			$this -> data['error_warning'] = $this -> error['warning'];
		} else {
			$this -> data['error_warning'] = '';
		}

		if (isset($this -> session -> data['success'])) {
			$this -> data['success'] = $this -> session -> data['success'];

			unset($this -> session -> data['success']);
		} else {
			$this -> data['success'] = '';
		}

		$url = '';

		$url = '';

		$pagination = new Pagination();
		$pagination -> total = $product_total;
		$pagination -> page = $page;
		$pagination -> limit = $this -> config -> get('config_admin_limit');
		$pagination -> text = $this -> language -> get('text_pagination');
		$pagination -> url = $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url . '&page={page}', 'SSL');

		$this -> data['pagination'] = $pagination -> render();

		$this -> template = 'rawproduct/product_list.tpl';
		$this -> children = array('common/header', 'common/footer');

		$this -> response -> setOutput($this -> render());
	}

	protected function getFormInventory() {

		$this -> data['heading_title'] = $this -> language -> get('heading_title');

		$this -> data['text_inventory'] = 'Inventory';

		$this -> data['button_save'] = $this -> language -> get('button_save');
		$this -> data['button_cancel'] = $this -> language -> get('button_cancel');
		$this -> data['button_add_attribute'] = $this -> language -> get('button_add_attribute');
		$this -> data['button_add_option'] = $this -> language -> get('button_add_option');
		$this -> data['button_add_option_value'] = $this -> language -> get('button_add_option_value');
		$this -> data['button_add_discount'] = $this -> language -> get('button_add_discount');
		$this -> data['button_add_special'] = $this -> language -> get('button_add_special');
		$this -> data['button_add_image'] = $this -> language -> get('button_add_image');
		$this -> data['button_remove'] = $this -> language -> get('button_remove');

		if (isset($this -> error['warning'])) {
			$this -> data['error_warning'] = $this -> error['warning'];
		} else {
			$this -> data['error_warning'] = '';
		}

		if (isset($this -> error['name'])) {
			$this -> data['error_name'] = $this -> error['name'];
		} else {
			$this -> data['error_name'] = array();
		}

		$url = '';

		if (isset($this -> request -> get['sort'])) {
			$url .= '&sort=' . $this -> request -> get['sort'];
		}

		if (isset($this -> request -> get['order'])) {
			$url .= '&order=' . $this -> request -> get['order'];
		}

		if (isset($this -> request -> get['page'])) {
			$url .= '&page=' . $this -> request -> get['page'];
		}

		$this -> data['breadcrumbs'] = array();

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home', 'token=' . $this -> session -> data['token'], 'SSL'), 'separator' => false);

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('heading_title'), 'href' => $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL'), 'separator' => ' :: ');

		$this -> data['action'] = $this -> url -> link('rawproduct/product/inventory', 'token=' . $this -> session -> data['token'] . '&raw_product_id=' . $this -> request -> get['raw_product_id'] . $url, 'SSL');

		$this -> data['cancel'] = $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL');

		if (isset($this -> request -> get['raw_product_id']) && ($this -> request -> server['REQUEST_METHOD'] != 'POST')) {
			//$product_info = $this->model_rawproduct_product->getInventory($this->request->get['raw_product_id']);
		}

		$this -> data['token'] = $this -> session -> data['token'];

		// Color
		$colors = $this -> model_rawproduct_product -> getProductColors($this -> request -> get['raw_product_id']);
		$this -> data['colors'] = $colors;

		// Size

		$sizes = $this -> model_rawproduct_product -> getProductSizes($this -> request -> get['raw_product_id']);
		$this -> data['sizes'] = $sizes;

		$product_quantity = $this -> model_rawproduct_product -> getProductQuantity($this -> request -> get['raw_product_id']);
		// print_r($product_quantity);
		$this -> data['product_quantity'] = $product_quantity;

		$this -> template = 'rawproduct/product_form_inventory.tpl';
		$this -> children = array('common/header', 'common/footer');

		$this -> response -> setOutput($this -> render());

	}

	protected function getForm() {
		$this -> data['heading_title'] = $this -> language -> get('heading_title');

		$this -> data['text_enabled'] = $this -> language -> get('text_enabled');
		$this -> data['text_disabled'] = $this -> language -> get('text_disabled');
		$this -> data['text_none'] = $this -> language -> get('text_none');
		$this -> data['text_yes'] = $this -> language -> get('text_yes');
		$this -> data['text_no'] = $this -> language -> get('text_no');
		$this -> data['text_plus'] = $this -> language -> get('text_plus');
		$this -> data['text_minus'] = $this -> language -> get('text_minus');
		$this -> data['text_default'] = $this -> language -> get('text_default');
		$this -> data['text_image_manager'] = $this -> language -> get('text_image_manager');
		$this -> data['text_browse'] = $this -> language -> get('text_browse');
		$this -> data['text_clear'] = $this -> language -> get('text_clear');
		$this -> data['text_option'] = $this -> language -> get('text_option');
		$this -> data['text_option_value'] = $this -> language -> get('text_option_value');
		$this -> data['text_select'] = $this -> language -> get('text_select');
		$this -> data['text_none'] = $this -> language -> get('text_none');
		$this -> data['text_percent'] = $this -> language -> get('text_percent');
		$this -> data['text_amount'] = $this -> language -> get('text_amount');

		$this -> data['entry_name'] = $this -> language -> get('entry_name');
		$this -> data['entry_meta_description'] = $this -> language -> get('entry_meta_description');
		$this -> data['entry_meta_keyword'] = $this -> language -> get('entry_meta_keyword');
		$this -> data['entry_description'] = $this -> language -> get('entry_description');
		$this -> data['entry_store'] = $this -> language -> get('entry_store');
		$this -> data['entry_keyword'] = $this -> language -> get('entry_keyword');
		$this -> data['entry_model'] = $this -> language -> get('entry_model');
		$this -> data['entry_sku'] = $this -> language -> get('entry_sku');
		$this -> data['entry_upc'] = $this -> language -> get('entry_upc');
		$this -> data['entry_ean'] = $this -> language -> get('entry_ean');
		$this -> data['entry_jan'] = $this -> language -> get('entry_jan');
		$this -> data['entry_isbn'] = $this -> language -> get('entry_isbn');
		$this -> data['entry_mpn'] = $this -> language -> get('entry_mpn');
		$this -> data['entry_location'] = $this -> language -> get('entry_location');
		$this -> data['entry_minimum'] = $this -> language -> get('entry_minimum');
		$this -> data['entry_manufacturer'] = $this -> language -> get('entry_manufacturer');
		$this -> data['entry_shipping'] = $this -> language -> get('entry_shipping');
		$this -> data['entry_date_available'] = $this -> language -> get('entry_date_available');
		$this -> data['entry_quantity'] = $this -> language -> get('entry_quantity');
		$this -> data['entry_stock_status'] = $this -> language -> get('entry_stock_status');
		$this -> data['entry_price'] = $this -> language -> get('entry_price');
		$this -> data['entry_tax_class'] = $this -> language -> get('entry_tax_class');
		$this -> data['entry_points'] = $this -> language -> get('entry_points');
		$this -> data['entry_option_points'] = $this -> language -> get('entry_option_points');
		$this -> data['entry_subtract'] = $this -> language -> get('entry_subtract');
		$this -> data['entry_weight_class'] = $this -> language -> get('entry_weight_class');
		$this -> data['entry_weight'] = $this -> language -> get('entry_weight');
		$this -> data['entry_dimension'] = $this -> language -> get('entry_dimension');
		$this -> data['entry_length'] = $this -> language -> get('entry_length');
		$this -> data['entry_image'] = $this -> language -> get('entry_image');
		$this -> data['entry_download'] = $this -> language -> get('entry_download');
		$this -> data['entry_category'] = $this -> language -> get('entry_category');
		$this -> data['entry_filter'] = $this -> language -> get('entry_filter');
		$this -> data['entry_related'] = $this -> language -> get('entry_related');
		$this -> data['entry_attribute'] = $this -> language -> get('entry_attribute');
		$this -> data['entry_text'] = $this -> language -> get('entry_text');
		$this -> data['entry_option'] = $this -> language -> get('entry_option');
		$this -> data['entry_option_value'] = $this -> language -> get('entry_option_value');
		$this -> data['entry_required'] = $this -> language -> get('entry_required');
		$this -> data['entry_sort_order'] = $this -> language -> get('entry_sort_order');
		$this -> data['entry_status'] = $this -> language -> get('entry_status');
		$this -> data['entry_customer_group'] = $this -> language -> get('entry_customer_group');
		$this -> data['entry_date_start'] = $this -> language -> get('entry_date_start');
		$this -> data['entry_date_end'] = $this -> language -> get('entry_date_end');
		$this -> data['entry_priority'] = $this -> language -> get('entry_priority');
		$this -> data['entry_tag'] = $this -> language -> get('entry_tag');
		$this -> data['entry_customer_group'] = $this -> language -> get('entry_customer_group');
		$this -> data['entry_reward'] = $this -> language -> get('entry_reward');
		$this -> data['entry_layout'] = $this -> language -> get('entry_layout');
		$this -> data['entry_is_screen_printing'] = $this -> language -> get('entry_is_screen_printing');

		$this -> data['button_save'] = $this -> language -> get('button_save');
		$this -> data['button_cancel'] = $this -> language -> get('button_cancel');
		$this -> data['button_add_attribute'] = $this -> language -> get('button_add_attribute');
		$this -> data['button_add_option'] = $this -> language -> get('button_add_option');
		$this -> data['button_add_option_value'] = $this -> language -> get('button_add_option_value');
		$this -> data['button_add_discount'] = $this -> language -> get('button_add_discount');
		$this -> data['button_add_special'] = $this -> language -> get('button_add_special');
		$this -> data['button_add_image'] = $this -> language -> get('button_add_image');
		$this -> data['button_remove'] = $this -> language -> get('button_remove');

		$this -> data['tab_general'] = $this -> language -> get('tab_general');
		$this -> data['tab_data'] = $this -> language -> get('tab_data');
		$this -> data['tab_attribute'] = $this -> language -> get('tab_attribute');
		$this -> data['tab_option'] = $this -> language -> get('tab_option');
		$this -> data['tab_discount'] = $this -> language -> get('tab_discount');
		$this -> data['tab_special'] = $this -> language -> get('tab_special');
		$this -> data['tab_image'] = $this -> language -> get('tab_image');
		$this -> data['tab_links'] = $this -> language -> get('tab_links');
		$this -> data['tab_reward'] = $this -> language -> get('tab_reward');
		$this -> data['tab_design'] = $this -> language -> get('tab_design');

		if (isset($this -> error['warning'])) {
			$this -> data['error_warning'] = $this -> error['warning'];
		} else {
			$this -> data['error_warning'] = '';
		}

		if (isset($this -> error['name'])) {
			$this -> data['error_name'] = $this -> error['name'];
		} else {
			$this -> data['error_name'] = array();
		}

		if (isset($this -> error['meta_description'])) {
			$this -> data['error_meta_description'] = $this -> error['meta_description'];
		} else {
			$this -> data['error_meta_description'] = array();
		}

		if (isset($this -> error['description'])) {
			$this -> data['error_description'] = $this -> error['description'];
		} else {
			$this -> data['error_description'] = array();
		}

		if (isset($this -> error['model'])) {
			$this -> data['error_model'] = $this -> error['model'];
		} else {
			$this -> data['error_model'] = '';
		}

		if (isset($this -> error['date_available'])) {
			$this -> data['error_date_available'] = $this -> error['date_available'];
		} else {
			$this -> data['error_date_available'] = '';
		}

		$url = '';

		if (isset($this -> request -> get['sort'])) {
			$url .= '&sort=' . $this -> request -> get['sort'];
		}

		if (isset($this -> request -> get['order'])) {
			$url .= '&order=' . $this -> request -> get['order'];
		}

		if (isset($this -> request -> get['page'])) {
			$url .= '&page=' . $this -> request -> get['page'];
		}

		$this -> data['breadcrumbs'] = array();

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home', 'token=' . $this -> session -> data['token'], 'SSL'), 'separator' => false);

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('heading_title'), 'href' => $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL'), 'separator' => ' :: ');

		if (!isset($this -> request -> get['raw_product_id'])) {
			$this -> data['action'] = $this -> url -> link('rawproduct/product/insert', 'token=' . $this -> session -> data['token'] . $url, 'SSL');
		} else {
			$this -> data['action'] = $this -> url -> link('rawproduct/product/update', 'token=' . $this -> session -> data['token'] . '&raw_product_id=' . $this -> request -> get['raw_product_id'] . $url, 'SSL');
		}

		$this -> data['cancel'] = $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL');

		if (isset($this -> request -> get['raw_product_id']) && ($this -> request -> server['REQUEST_METHOD'] != 'POST')) {
			$product_info = $this -> model_rawproduct_product -> getProduct($this -> request -> get['raw_product_id']);
		}

		$this -> data['token'] = $this -> session -> data['token'];

		$this -> load -> model('localisation/language');

		$this -> data['languages'] = $this -> model_localisation_language -> getLanguages();

		if (isset($this -> request -> post['raw_product_description'])) {
			$this -> data['raw_product_description'] = $this -> request -> post['raw_product_description'];
		} elseif (isset($this -> request -> get['raw_product_id'])) {
			$this -> data['raw_product_description'] = $this -> model_rawproduct_product -> getProductDescriptions($this -> request -> get['raw_product_id']);
		} else {
			$this -> data['raw_product_description'] = array();
		}

		if (isset($this -> request -> post['model'])) {
			$this -> data['model'] = $this -> request -> post['model'];
		} elseif (!empty($product_info)) {
			$this -> data['model'] = $product_info['model'];
		} else {
			$this -> data['model'] = '';
		}

		if (isset($this -> request -> post['keyword'])) {
			$this -> data['keyword'] = $this -> request -> post['keyword'];
		} elseif (!empty($product_info)) {
			$this -> data['keyword'] = $product_info['keyword'];
		} else {
			$this -> data['keyword'] = '';
		}

		if (isset($this -> request -> post['price'])) {
			$this -> data['price'] = $this -> request -> post['price'];
		} elseif (!empty($product_info)) {
			$this -> data['price'] = $product_info['price'];
		} else {
			$this -> data['price'] = 0;
		}

		if (isset($this -> request -> post['minimum'])) {
			$this -> data['minimum'] = $this -> request -> post['minimum'];
		} elseif (!empty($product_info)) {
			$this -> data['minimum'] = $product_info['minimum'];
		} else {
			$this -> data['minimum'] = 1;
		}

		if (isset($this -> request -> post['status'])) {
			$this -> data['status'] = $this -> request -> post['status'];
		} elseif (!empty($product_info)) {
			$this -> data['status'] = $product_info['status'];
		} else {
			$this -> data['status'] = 1;
		}

		if (isset($this -> request -> post['weight'])) {
			$this -> data['weight'] = $this -> request -> post['weight'];
		} elseif (!empty($product_info)) {
			$this -> data['weight'] = $product_info['weight'];
		} else {
			$this -> data['weight'] = '';
		}

		if (isset($this -> request -> post['length'])) {
			$this -> data['length'] = $this -> request -> post['length'];
		} elseif (!empty($product_info)) {
			$this -> data['length'] = $product_info['length'];
		} else {
			$this -> data['length'] = '';
		}

		if (isset($this -> request -> post['width'])) {
			$this -> data['width'] = $this -> request -> post['width'];
		} elseif (!empty($product_info)) {
			$this -> data['width'] = $product_info['width'];
		} else {
			$this -> data['width'] = '';
		}

		if (isset($this -> request -> post['height'])) {
			$this -> data['height'] = $this -> request -> post['height'];
		} elseif (!empty($product_info)) {
			$this -> data['height'] = $product_info['height'];
		} else {
			$this -> data['height'] = '';
		}

		// Color
		$this -> load -> model('rawproduct/color');
		$colors = $this -> model_rawproduct_color -> getColors();
		$this -> data['colors'] = $colors;

		// View

		$views = $this -> model_rawproduct_product -> getViews();
		$this -> data['views'] = $views;

		// Size

		$sizes = $this -> model_rawproduct_product -> getSizes();
		$this -> data['sizes'] = $sizes;

		// Categories
		$categories = $this -> model_rawproduct_product -> getCategories();
		$this -> data['categories'] = $categories;

		// Manufacturers
		$manufacturers = $this -> model_rawproduct_product -> getManufacturers();
		$this -> data['manufacturers'] = $manufacturers;

		$this -> template = 'rawproduct/product_form.tpl';
		$this -> children = array('common/header', 'common/footer');

		$this -> response -> setOutput($this -> render());
	}

	protected function getFormEdit() {
		$this -> data['heading_title'] = $this -> language -> get('heading_title');

		$this -> data['text_enabled'] = $this -> language -> get('text_enabled');
		$this -> data['text_disabled'] = $this -> language -> get('text_disabled');
		$this -> data['text_none'] = $this -> language -> get('text_none');
		$this -> data['text_yes'] = $this -> language -> get('text_yes');
		$this -> data['text_no'] = $this -> language -> get('text_no');
		$this -> data['text_plus'] = $this -> language -> get('text_plus');
		$this -> data['text_minus'] = $this -> language -> get('text_minus');
		$this -> data['text_default'] = $this -> language -> get('text_default');
		$this -> data['text_image_manager'] = $this -> language -> get('text_image_manager');
		$this -> data['text_browse'] = $this -> language -> get('text_browse');
		$this -> data['text_clear'] = $this -> language -> get('text_clear');
		$this -> data['text_option'] = $this -> language -> get('text_option');
		$this -> data['text_option_value'] = $this -> language -> get('text_option_value');
		$this -> data['text_select'] = $this -> language -> get('text_select');
		$this -> data['text_none'] = $this -> language -> get('text_none');
		$this -> data['text_percent'] = $this -> language -> get('text_percent');
		$this -> data['text_amount'] = $this -> language -> get('text_amount');

		$this -> data['entry_name'] = $this -> language -> get('entry_name');
		$this -> data['entry_meta_description'] = $this -> language -> get('entry_meta_description');
		$this -> data['entry_meta_keyword'] = $this -> language -> get('entry_meta_keyword');
		$this -> data['entry_description'] = $this -> language -> get('entry_description');
		$this -> data['entry_store'] = $this -> language -> get('entry_store');
		$this -> data['entry_keyword'] = $this -> language -> get('entry_keyword');
		$this -> data['entry_model'] = $this -> language -> get('entry_model');
		$this -> data['entry_sku'] = $this -> language -> get('entry_sku');
		$this -> data['entry_upc'] = $this -> language -> get('entry_upc');
		$this -> data['entry_ean'] = $this -> language -> get('entry_ean');
		$this -> data['entry_jan'] = $this -> language -> get('entry_jan');
		$this -> data['entry_isbn'] = $this -> language -> get('entry_isbn');
		$this -> data['entry_mpn'] = $this -> language -> get('entry_mpn');
		$this -> data['entry_location'] = $this -> language -> get('entry_location');
		$this -> data['entry_minimum'] = $this -> language -> get('entry_minimum');
		$this -> data['entry_manufacturer'] = $this -> language -> get('entry_manufacturer');
		$this -> data['entry_shipping'] = $this -> language -> get('entry_shipping');
		$this -> data['entry_date_available'] = $this -> language -> get('entry_date_available');
		$this -> data['entry_quantity'] = $this -> language -> get('entry_quantity');
		$this -> data['entry_stock_status'] = $this -> language -> get('entry_stock_status');
		$this -> data['entry_price'] = $this -> language -> get('entry_price');
		$this -> data['entry_tax_class'] = $this -> language -> get('entry_tax_class');
		$this -> data['entry_points'] = $this -> language -> get('entry_points');
		$this -> data['entry_option_points'] = $this -> language -> get('entry_option_points');
		$this -> data['entry_subtract'] = $this -> language -> get('entry_subtract');
		$this -> data['entry_weight_class'] = $this -> language -> get('entry_weight_class');
		$this -> data['entry_weight'] = $this -> language -> get('entry_weight');
		$this -> data['entry_dimension'] = $this -> language -> get('entry_dimension');
		$this -> data['entry_length'] = $this -> language -> get('entry_length');
		$this -> data['entry_image'] = $this -> language -> get('entry_image');
		$this -> data['entry_download'] = $this -> language -> get('entry_download');
		$this -> data['entry_category'] = $this -> language -> get('entry_category');
		$this -> data['entry_filter'] = $this -> language -> get('entry_filter');
		$this -> data['entry_related'] = $this -> language -> get('entry_related');
		$this -> data['entry_attribute'] = $this -> language -> get('entry_attribute');
		$this -> data['entry_text'] = $this -> language -> get('entry_text');
		$this -> data['entry_option'] = $this -> language -> get('entry_option');
		$this -> data['entry_option_value'] = $this -> language -> get('entry_option_value');
		$this -> data['entry_required'] = $this -> language -> get('entry_required');
		$this -> data['entry_sort_order'] = $this -> language -> get('entry_sort_order');
		$this -> data['entry_status'] = $this -> language -> get('entry_status');
		$this -> data['entry_customer_group'] = $this -> language -> get('entry_customer_group');
		$this -> data['entry_date_start'] = $this -> language -> get('entry_date_start');
		$this -> data['entry_date_end'] = $this -> language -> get('entry_date_end');
		$this -> data['entry_priority'] = $this -> language -> get('entry_priority');
		$this -> data['entry_tag'] = $this -> language -> get('entry_tag');
		$this -> data['entry_customer_group'] = $this -> language -> get('entry_customer_group');
		$this -> data['entry_reward'] = $this -> language -> get('entry_reward');
		$this -> data['entry_layout'] = $this -> language -> get('entry_layout');
		$this -> data['entry_is_screen_printing'] = $this -> language -> get('entry_is_screen_printing');

		$this -> data['button_save'] = $this -> language -> get('button_save');
		$this -> data['button_cancel'] = $this -> language -> get('button_cancel');
		$this -> data['button_add_attribute'] = $this -> language -> get('button_add_attribute');
		$this -> data['button_add_option'] = $this -> language -> get('button_add_option');
		$this -> data['button_add_option_value'] = $this -> language -> get('button_add_option_value');
		$this -> data['button_add_discount'] = $this -> language -> get('button_add_discount');
		$this -> data['button_add_special'] = $this -> language -> get('button_add_special');
		$this -> data['button_add_image'] = $this -> language -> get('button_add_image');
		$this -> data['button_remove'] = $this -> language -> get('button_remove');

		$this -> data['tab_general'] = $this -> language -> get('tab_general');
		$this -> data['tab_data'] = $this -> language -> get('tab_data');
		$this -> data['tab_attribute'] = $this -> language -> get('tab_attribute');
		$this -> data['tab_option'] = $this -> language -> get('tab_option');
		$this -> data['tab_discount'] = $this -> language -> get('tab_discount');
		$this -> data['tab_special'] = $this -> language -> get('tab_special');
		$this -> data['tab_image'] = $this -> language -> get('tab_image');
		$this -> data['tab_links'] = $this -> language -> get('tab_links');
		$this -> data['tab_reward'] = $this -> language -> get('tab_reward');
		$this -> data['tab_design'] = $this -> language -> get('tab_design');

		if (isset($this -> error['warning'])) {
			$this -> data['error_warning'] = $this -> error['warning'];
		} else {
			$this -> data['error_warning'] = '';
		}

		if (isset($this -> error['name'])) {
			$this -> data['error_name'] = $this -> error['name'];
		} else {
			$this -> data['error_name'] = array();
		}

		if (isset($this -> error['meta_description'])) {
			$this -> data['error_meta_description'] = $this -> error['meta_description'];
		} else {
			$this -> data['error_meta_description'] = array();
		}

		if (isset($this -> error['description'])) {
			$this -> data['error_description'] = $this -> error['description'];
		} else {
			$this -> data['error_description'] = array();
		}

		if (isset($this -> error['model'])) {
			$this -> data['error_model'] = $this -> error['model'];
		} else {
			$this -> data['error_model'] = '';
		}

		if (isset($this -> error['date_available'])) {
			$this -> data['error_date_available'] = $this -> error['date_available'];
		} else {
			$this -> data['error_date_available'] = '';
		}

		$url = '';

		if (isset($this -> request -> get['sort'])) {
			$url .= '&sort=' . $this -> request -> get['sort'];
		}

		if (isset($this -> request -> get['order'])) {
			$url .= '&order=' . $this -> request -> get['order'];
		}

		if (isset($this -> request -> get['page'])) {
			$url .= '&page=' . $this -> request -> get['page'];
		}

		$this -> data['breadcrumbs'] = array();

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home', 'token=' . $this -> session -> data['token'], 'SSL'), 'separator' => false);

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('heading_title'), 'href' => $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL'), 'separator' => ' :: ');

		if (!isset($this -> request -> get['raw_product_id'])) {
			$this -> data['action'] = $this -> url -> link('rawproduct/product/insert', 'token=' . $this -> session -> data['token'] . $url, 'SSL');
		} else {
			$this -> data['action'] = $this -> url -> link('rawproduct/product/update', 'token=' . $this -> session -> data['token'] . '&raw_product_id=' . $this -> request -> get['raw_product_id'] . $url, 'SSL');
		}

		$this -> data['cancel'] = $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL');

		if (isset($this -> request -> get['raw_product_id']) && ($this -> request -> server['REQUEST_METHOD'] != 'POST')) {
			$product_info = $this -> model_rawproduct_product -> getProduct($this -> request -> get['raw_product_id']);
		}

		$this -> data['token'] = $this -> session -> data['token'];

		$this -> load -> model('localisation/language');

		$this -> data['languages'] = $this -> model_localisation_language -> getLanguages();

		if (isset($this -> request -> post['raw_product_description'])) {
			$this -> data['raw_product_description'] = $this -> request -> post['raw_product_description'];
		} elseif (isset($this -> request -> get['raw_product_id'])) {
			$this -> data['raw_product_description'] = $this -> model_rawproduct_product -> getProductDescriptions($this -> request -> get['raw_product_id']);
		} else {
			$this -> data['raw_product_description'] = array();
		}

		if (isset($this -> request -> post['model'])) {
			$this -> data['model'] = $this -> request -> post['model'];
		} elseif (!empty($product_info)) {
			$this -> data['model'] = $product_info['model'];
		} else {
			$this -> data['model'] = '';
		}

		if (isset($this -> request -> post['category_id'])) {
			$this -> data['category_id'] = $this -> request -> post['category_id'];
		} elseif (!empty($product_info)) {
			$this -> data['category_id'] = $this -> model_rawproduct_product -> getProductCategories($product_info['raw_product_id']);
		} else {
			$this -> data['category_id'] = '';
		}

		if (isset($this -> request -> post['manufacturer_id'])) {
			$this -> data['manufacturer_id'] = $this -> request -> post['manufacturer_id'];
		} elseif (!empty($product_info)) {
			$this -> data['manufacturer_id'] = $product_info['manufacturer_id'];
		} else {
			$this -> data['manufacturer_id'] = '';
		}

		if (isset($this -> request -> post['keyword'])) {
			$this -> data['keyword'] = $this -> request -> post['keyword'];
		} elseif (!empty($product_info)) {
			$this -> data['keyword'] = $product_info['keyword'];
		} else {
			$this -> data['keyword'] = '';
		}

		if (isset($this -> request -> post['price'])) {
			$this -> data['price'] = $this -> request -> post['price'];
		} elseif (!empty($product_info)) {
			$this -> data['price'] = $product_info['price'];
		} else {
			$this -> data['price'] = 0;
		}

		if (isset($this -> request -> post['minimum'])) {
			$this -> data['minimum'] = $this -> request -> post['minimum'];
		} elseif (!empty($product_info)) {
			$this -> data['minimum'] = $product_info['minimum'];
		} else {
			$this -> data['minimum'] = 1;
		}

		if (isset($this -> request -> post['status'])) {
			$this -> data['status'] = $this -> request -> post['status'];
		} elseif (!empty($product_info)) {
			$this -> data['status'] = $product_info['status'];
		} else {
			$this -> data['status'] = 1;
		}

		if (isset($this -> request -> post['is_screen_printing'])) {
			$this -> data['is_screen_printing'] = $this -> request -> post['is_screen_printing'];
		} elseif (!empty($product_info)) {
			$this -> data['is_screen_printing'] = $product_info['is_screen_printing'];
		} else {
			$this -> data['is_screen_printing'] = 0;
		}

		if (isset($this -> request -> post['weight'])) {
			$this -> data['weight'] = $this -> request -> post['weight'];
		} elseif (!empty($product_info)) {
			$this -> data['weight'] = $product_info['weight'];
		} else {
			$this -> data['weight'] = '';
		}

		if (isset($this -> request -> post['length'])) {
			$this -> data['length'] = $this -> request -> post['length'];
		} elseif (!empty($product_info)) {
			$this -> data['length'] = $product_info['length'];
		} else {
			$this -> data['length'] = '';
		}

		if (isset($this -> request -> post['width'])) {
			$this -> data['width'] = $this -> request -> post['width'];
		} elseif (!empty($product_info)) {
			$this -> data['width'] = $product_info['width'];
		} else {
			$this -> data['width'] = '';
		}

		if (isset($this -> request -> post['height'])) {
			$this -> data['height'] = $this -> request -> post['height'];
		} elseif (!empty($product_info)) {
			$this -> data['height'] = $product_info['height'];
		} else {
			$this -> data['height'] = '';
		}

		// Color
		$this -> load -> model('rawproduct/color');
		$colors = $this -> model_rawproduct_color -> getColors();
		$this -> data['colors'] = $colors;

		// Size

		$sizes = $this -> model_rawproduct_product -> getSizes();
		$this -> data['sizes'] = $sizes;

		// View

		$views = $this -> model_rawproduct_product -> getProductViews($this -> request -> get['raw_product_id'], '0');
		$this -> data['views'] = $views;

		$product_sizes = $this -> model_rawproduct_product -> getProductSizesEdit($this -> request -> get['raw_product_id']);
		$this -> data['product_sizes'] = $product_sizes;

		$product_colors = $this -> model_rawproduct_product -> getProductcolorsEdit($this -> request -> get['raw_product_id']);
		$this -> data['product_colors'] = $product_colors;

		$dis_view = $this -> model_rawproduct_product -> getProductViews($this -> request -> get['raw_product_id'], '1');
		//print_r($dis_view);
		$this -> data['dis_view'] = $dis_view;

		// Categories
		$categories = $this -> model_rawproduct_product -> getCategories();
		$this -> data['categories'] = $categories;

		// Manufacturers
		$manufacturers = $this -> model_rawproduct_product -> getManufacturers();
		$this -> data['manufacturers'] = $manufacturers;

		$this -> template = 'rawproduct/product_form_edit.tpl';
		$this -> children = array('common/header', 'common/footer');

		$this -> response -> setOutput($this -> render());
	}

	protected function validateForm() {
		if (!$this -> user -> hasPermission('modify', 'rawproduct/product')) {
			$this -> error['warning'] = $this -> language -> get('error_permission');
		}

		foreach ($this->request->post['raw_product_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
				$this -> error['name'][$language_id] = $this -> language -> get('error_name');
			}
		}

		if ((utf8_strlen($this -> request -> post['model']) < 1) || (utf8_strlen($this -> request -> post['model']) > 64)) {
			$this -> error['model'] = $this -> language -> get('error_model');
		}

		if ($this -> error && !isset($this -> error['warning'])) {
			$this -> error['warning'] = $this -> language -> get('error_warning');
		}

		if (!$this -> error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this -> user -> hasPermission('modify', 'rawproduct/product')) {
			$this -> error['warning'] = $this -> language -> get('error_permission');
		}

		if (!$this -> error) {
			return true;
		} else {
			return false;
		}
	}

	protected function getFormDesigner() {

		$this -> data['heading_title'] = $this -> language -> get('heading_title');

		$this -> data['text_inventory'] = 'Product Designer';

		$this -> data['button_save'] = $this -> language -> get('button_save');
		$this -> data['button_cancel'] = $this -> language -> get('button_cancel');
		$this -> data['button_add_attribute'] = $this -> language -> get('button_add_attribute');
		$this -> data['button_add_option'] = $this -> language -> get('button_add_option');
		$this -> data['button_add_option_value'] = $this -> language -> get('button_add_option_value');
		$this -> data['button_add_discount'] = $this -> language -> get('button_add_discount');
		$this -> data['button_add_special'] = $this -> language -> get('button_add_special');
		$this -> data['button_add_image'] = $this -> language -> get('button_add_image');
		$this -> data['button_remove'] = $this -> language -> get('button_remove');

		if (isset($this -> error['warning'])) {
			$this -> data['error_warning'] = $this -> error['warning'];
		} else {
			$this -> data['error_warning'] = '';
		}

		if (isset($this -> error['name'])) {
			$this -> data['error_name'] = $this -> error['name'];
		} else {
			$this -> data['error_name'] = array();
		}

		$url = '';

		if (isset($this -> request -> get['sort'])) {
			$url .= '&sort=' . $this -> request -> get['sort'];
		}

		if (isset($this -> request -> get['order'])) {
			$url .= '&order=' . $this -> request -> get['order'];
		}

		if (isset($this -> request -> get['page'])) {
			$url .= '&page=' . $this -> request -> get['page'];
		}

		$this -> data['breadcrumbs'] = array();

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home', 'token=' . $this -> session -> data['token'], 'SSL'), 'separator' => false);

		$this -> data['breadcrumbs'][] = array('text' => $this -> language -> get('heading_title'), 'href' => $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL'), 'separator' => ' :: ');

		$this -> data['action'] = '';

		$this -> data['cancel'] = $this -> url -> link('rawproduct/product', 'token=' . $this -> session -> data['token'] . $url, 'SSL');

		$this -> data['token'] = $this -> session -> data['token'];

		/*	// Color
		 $colors = $this->model_rawproduct_product->getProductColors($this->request->get['raw_product_id']);
		 $this->data['colors'] = $colors;

		 // Size

		 $sizes = $this->model_rawproduct_product->getProductSizes($this->request->get['raw_product_id']);
		 $this->data['sizes'] = $sizes;

		 $product_quantity = $this->model_rawproduct_product->getProductQuantity($this->request->get['raw_product_id']);
		 // print_r($product_quantity);
		 $this->data['product_quantity'] = $product_quantity;*/

		$this -> template = 'rawproduct/product_form_designer.tpl';
		$this -> children = array('common/header', 'common/footer');

		$this -> response -> setOutput($this -> render());

	}

}
?>
