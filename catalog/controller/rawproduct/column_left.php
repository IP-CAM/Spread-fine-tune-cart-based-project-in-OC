<?php  

class ControllerRawproductColumnLeft extends Controller {

	protected function index() {

		$this->language->load('rawproduct/category');

		$results = $this->model_catalog_rawproduct->getAllCategories($category_id);
			
			foreach ($results as $result) {
				$data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);
				
				
				$this->data['modules'][] = array(
					'name'  => $result['name'],
					'href'  => $this->url->link('rawproduct/category', 'path='. $result['category_id'] . $url)
				);
			}
		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/rawproduct/column_left.tpl')) {

			$this->template = $this->config->get('config_template') . '/template/rawproduct/column_left.tpl';

		} else {

			$this->template = 'default/template/rawproduct/column_left.tpl';

		}

								

		$this->render();

	}

}

?>