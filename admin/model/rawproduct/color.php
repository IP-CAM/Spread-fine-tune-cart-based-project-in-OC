<?php
class ModelRawproductColor extends Model {
	public function addColor($post,$file) {
		
        $is_default=(isset($post['is_default']) ? (int)$post['is_default'] : 0);
        $queryInsert = "insert into " . DB_PREFIX . "color set  name ='" . $post['name'] . "',code ='" . $post['code'] . "', is_default = '". $is_default."', sort_order = '".(int)$post['sort_order'] ."',  status='" . (int)$post['status'] . "', date_modified = NOW(), date_added = NOW() ";
			$this->db->query($queryInsert);

		$color_id = $this->db->getLastId();
        if($is_default==1)
		{
			$this->db->query("UPDATE  " . DB_PREFIX . "color SET  is_default = '0' WHERE color_id !='".$color_id."' ");
			
			}

  $query = $this->db->query("SELECT sys_value FROM " . DB_PREFIX . "system_config  WHERE  	sys_name = 'COLOR_OPTION'");
		
		$sys_config= $query->row;

    $this->db->query("INSERT INTO  " . DB_PREFIX . "option_value SET  option_id = '".$sys_config['sys_value']."', sort_order = '".(int)$post['sort_order'] ."'");
	
	$option_value_id = $this->db->getLastId();
	
	 $this->db->query("INSERT INTO  " . DB_PREFIX . "option_value_description SET  option_value_id 	 = '".$option_value_id."', option_id = '".$sys_config['sys_value']."', name = '".$post['name'] ."' , language_id = '" . (int)$this->config->get('config_language_id') . "' ");
	 
	  $this->db->query("INSERT INTO  " . DB_PREFIX . "color_option SET  color_id = '".(int)$color_id."', option_value_id = '".(int)$option_value_id."'");
	
    $this->cache->delete('color');
	}
	
	public function editColor($color_id, $post) {
		

	
        $is_default=(isset($post['is_default']) ? (int)$post['is_default'] : 0);
        $queryInsert = "UPDATE  " . DB_PREFIX . "color set  name ='" . $post['name'] . "',code ='" . $post['code'] . "', is_default = '". $is_default."', sort_order = '".(int)$post['sort_order'] ."',  status='" . (int)$post['status'] . "', date_modified = NOW() WHERE color_id ='".$color_id."'";
	 
	  $this->db->query($queryInsert);

		
        if($is_default==1)
		{
			$this->db->query("UPDATE  " . DB_PREFIX . "color SET  is_default = '0' WHERE color_id !='".$color_id."' ");
			
			}

  $query = $this->db->query("SELECT sys_value FROM " . DB_PREFIX . "system_config  WHERE  	sys_name = 'COLOR_OPTION'");
		
		$sys_config= $query->row;

    
	  $queryopt = $this->db->query("SELECT option_value_id FROM " . DB_PREFIX . "color_option  WHERE  	color_id ='".$color_id."'");
		
	 $opt= $queryopt->row;
	
	$option_value_id = $opt['option_value_id'];
	
	 $this->db->query("UPDATE  " . DB_PREFIX . "option_value_description SET  name = '".$post['name'] ."' WHERE  language_id = '" . (int)$this->config->get('config_language_id') . "' AND option_value_id 	 = '".$option_value_id."' AND option_id = '".$sys_config['sys_value']."'");
	 
	
    $this->cache->delete('color');
	
		}
	
	public function deletecolor($color_id) {
		
//echo "SELECT option_value_id FROM " . DB_PREFIX . "color_option  WHERE  	color_id ='".$color_id."'";
       $queryopt = $this->db->query("SELECT option_value_id FROM " . DB_PREFIX . "color_option  WHERE  	color_id ='".$color_id."'");
		
	 $opt= $queryopt->row;
	
	$option_value_id = $opt['option_value_id'];
	
	   $this->db->query("DELETE FROM " . DB_PREFIX . "option_value WHERE option_value_id = '" . (int)$option_value_id . "'");

	   $this->db->query("DELETE FROM " . DB_PREFIX . "option_value_description WHERE option_value_id = '" . (int)$option_value_id . "'");
	
		$this->db->query("DELETE FROM " . DB_PREFIX . "color_option WHERE color_id = '" . (int)$color_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "color WHERE color_id = '" . (int)$color_id . "'");
		
		$this->cache->delete('font');
	} 

	
			
	public function getColor($color_id) {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "color  WHERE color_id = '" . (int)$color_id . "'");
		
		return $query->row;
	} 
	
	public function getColors($data= array()) {
		$sql = "SELECT * from " . DB_PREFIX . "color  where 1 ";
	
		
		if (!empty($data['filter_name'])) {
			$sql .= " AND name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY color_id ORDER BY name";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		 
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
						
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
				
	public function getColorValue($color_id) {
		$font_value = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "color_value WHERE color_id = '" . (int)$color_id . "'");
		
		foreach ($query->rows as $result) {
			$font_value[] =$result;
		}
		
		return $font_value;
	}	
	
	
		
	public function getTotalColors() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "color");
		
		return $query->row['total'];
	}	
		
		
}
?>