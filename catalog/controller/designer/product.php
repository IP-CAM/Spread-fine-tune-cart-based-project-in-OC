<?php  
class ControllerDesignerProduct extends Controller {
	private $error = array(); 
	
	public function index() { 
		$this->language->load('designer/product');
	
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),			
			'separator' => false
		);
		
		
	
		
		if (isset($this->request->get['productId'])) {
			$productId = (int)$this->request->get['productId'];
		} else {
			$productId = 0;
		}	
	
		
		$this->template =  $this->config->get('config_template') . '/template/designer/product.tpl';
		
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
						
			$this->response->setOutput($this->render());
  	}
	
	
}
?>