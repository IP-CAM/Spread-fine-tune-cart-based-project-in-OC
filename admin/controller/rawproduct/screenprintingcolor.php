<?php 
class ControllerRawproductScreenprintingcolor extends Controller { 
	private $error = array();
 
	public function index() {
		$this->language->load('rawproduct/screenprintingcolor');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('rawproduct/screenprintingcolor');
		 
		$this->getList();
	}

	public function insert() {
		$this->language->load('rawproduct/screenprintingcolor');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('rawproduct/screenprintingcolor');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
	
			
			$this->model_rawproduct_screenprintingcolor->addColor($this->request->post,$_FILES);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('rawproduct/screenprintingcolor', 'token=' . $this->session->data['token'] . $url, 'SSL')); 
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('rawproduct/screenprintingcolor');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('rawproduct/screenprintingcolor');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->model_rawproduct_screenprintingcolor->editColor($this->request->get['color_id'], $this->request->post,$_FILES);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('rawproduct/screenprintingcolor', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('rawproduct/screenprintingcolor');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('rawproduct/screenprintingcolor');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $color_id) {
				$this->model_rawproduct_screenprintingcolor->deletecolor($color_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('rawproduct/screenprintingcolor', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		
		$this->getList();
	}
	
	
	
	protected function getList() {
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
						
   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('rawproduct/screenprintingcolor', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
									
		$this->data['insert'] = $this->url->link('rawproduct/screenprintingcolor/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('rawproduct/screenprintingcolor/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		//$this->data['repair'] = $this->url->link('rawproduct/screenprintingcolor/repair', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['categories'] = array();
		
		$data = array(
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
				
		$category_total = $this->model_rawproduct_screenprintingcolor->getTotalColors();
		
		$results = $this->model_rawproduct_screenprintingcolor->getColors($data);

		foreach ($results as $result) {
			$action = array();
						
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('rawproduct/screenprintingcolor/update', 'token=' . $this->session->data['token'] . '&color_id=' . $result['color_id'] . $url, 'SSL')
			);

			$this->data['fonts'][] = array(
				'color_id' => $result['color_id'],
				'name'        => $result['name'],
				'code'        => $result['code'],
				'is_default'        => ($result['is_default']==1)?'Yes':'No',
				'sort_order'  => $result['sort_order'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['color_id'], $this->request->post['selected']),
				'action'      => $action
			);
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_code'] = $this->language->get('column_code');
		$this->data['column_default'] = $this->language->get('column_default');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
 		$this->data['button_repair'] = $this->language->get('button_repair');
 
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
		
		$pagination = new Pagination();
		$pagination->total = $category_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('rawproduct/screenprintingcolor', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();
		
		$this->template = 'rawproduct/screenprintingcolor_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_percent'] = $this->language->get('text_percent');
		$this->data['text_amount'] = $this->language->get('text_amount');
				
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_parent'] = $this->language->get('entry_parent');
		$this->data['entry_filter'] = $this->language->get('entry_filter');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_top'] = $this->language->get('entry_top');
		$this->data['entry_column'] = $this->language->get('entry_column');		
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

    	$this->data['tab_general'] = $this->language->get('tab_general');
    	$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_design'] = $this->language->get('tab_design');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
	
 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('rawproduct/screenprintingcolor', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (!isset($this->request->get['color_id'])) {
			$this->data['action'] = $this->url->link('rawproduct/screenprintingcolor/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('rawproduct/screenprintingcolor/update', 'token=' . $this->session->data['token'] . '&color_id=' . $this->request->get['color_id'], 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('rawproduct/screenprintingcolor', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['color_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$color_info = $this->model_rawproduct_screenprintingcolor->getColor($this->request->get['color_id']);
			
    	}
		
		$this->data['token'] = $this->session->data['token'];
		
		
	

				
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($color_info)) {
			$this->data['sort_order'] = $color_info['sort_order'];
		} else {
			$this->data['sort_order'] = 0;
		}
		
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} elseif (!empty($color_info)) {
			$this->data['name'] = $color_info['name'];
		} else {
			$this->data['name'] = '';
		}
		if (isset($this->request->post['code'])) {
			$this->data['code'] = $this->request->post['code'];
		} elseif (!empty($color_info)) {
			$this->data['code'] = $color_info['code'];
		} else {
			$this->data['code'] = '';
		}
		
		if (isset($this->request->post['is_default'])) {
			$this->data['sort_order'] = $this->request->post['is_default'];
		} elseif (!empty($color_info)) {
			$this->data['is_default'] = $color_info['is_default'];
		} else {
			$this->data['is_default'] = 0;
		}
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($color_info)) {
			$this->data['status'] = $color_info['status'];
		} else {
			$this->data['status'] = 1;
		}
				

						
		$this->template = 'rawproduct/screenprintingcolor_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'rawproduct/screenprintingcolor')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
     $post =$this->request->post;
	  if (!$post['name']) {
			$this->error['warning'] = 'Please Enter Color Name';
		}
		
		 if (!$post['code']) {
			$this->error['warning'] = 'Please Enter Color Code';
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
					
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'rawproduct/screenprintingcolor')) {
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