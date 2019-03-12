<?php
class ModelRawproductProduct extends Model {
	public function findexts($filename) {
		$filename = strtolower($filename);

		$exts = @explode(".", $filename);

		$n = count($exts) - 1;

		return $exts[$n];
	}

	public function addProduct($data, $file) {
		$this -> db -> query("INSERT INTO " . DB_PREFIX . "raw_product SET
				model = '" . $this -> db -> escape($data['model']) . "', 
				minimum = '" . (int)$data['minimum'] . "', 
				manufacturer_id = '" . (int)$data['manufacturer_id'] . "',
				price = '" . (float)$data['price'] . "', 
				weight = '" . (float)$data['weight'] . "',
				length = '" . (float)$data['length'] . "',
				width = '" . (float)$data['width'] . "',
				height = '" . (float)$data['height'] . "',
				status = '" . (int)$data['status'] . "',
				is_screen_printing = '" . (int)$data['is_screen_printing'] . "', 
				date_added = NOW()");

		$raw_product_id = $this -> db -> getLastId();

		foreach ($data['raw_product_description'] as $language_id => $value) {
			$this -> db -> query("INSERT INTO " . DB_PREFIX . "raw_product_description SET raw_product_id = '" . (int)$raw_product_id . "', language_id = '" . (int)$language_id . "', name = '" . $this -> db -> escape($value['name']) . "', meta_keyword = '" . $this -> db -> escape($value['meta_keyword']) . "', meta_description = '" . $this -> db -> escape($value['meta_description']) . "', description = '" . $this -> db -> escape($value['description']) . "', tag = '" . $this -> db -> escape($value['tag']) . "'");
		}

		$this -> db -> query("INSERT INTO " . DB_PREFIX . "raw_product_category SET
						raw_product_id 	 = '" . (int)$raw_product_id . "', 
						category_id = '" . (int)$data['category_id'] . "'");

		/*if(count($data['color_ids'])>0)
		 {
		 $qcolor="INSERT INTO " . DB_PREFIX . "raw_product_color (raw_product_id,color_code,color_id, 	color_price,is_default) values ";
		 $qc='';
		 foreach($data['color_ids'] as $key => $val){
		 $is_default=($data['color_default'])?$data['color_default']:0;
		 $qc.="('" . (int)$raw_product_id . "','" . $data['color_code'.$val] . "','" . $val. "','" . $data['color_price'.$val] . "','".$is_default."'),";
		 }
		 if($qc!='')
		 {
		 $qcolor=$qcolor.rtrim($qc,',');
		 $this->db->query($qcolor);
		 }
		 }*/
		if (count($data['size_ids']) > 0) {
			$qsize = "INSERT INTO " . DB_PREFIX . "raw_product_size (raw_product_id,size_id,price,status) values ";
			$qs = '';
			foreach ($data['size_ids'] as $key => $val) {

				$qs .= "('" . (int)$raw_product_id . "','" . $val . "','" . $data['size_price' . $val] . "','1'),";
			}
			if ($qs != '') {
				$qsize = $qsize . rtrim($qs, ',');
				$this -> db -> query($qsize);
			}
		}

		if (count($data['view_ids']) > 0) {
			foreach ($data['view_ids'] as $key => $view_id) {
				if ($data['view_default'] == $view_id) {
					$isdft = 1;

				} else {
					$isdft = 0;
				}
				$query2 = "insert into " . DB_PREFIX . "raw_product_view set
						    raw_product_id = '" . (int)$raw_product_id . "',
							view_id = '" . $view_id . "',
							price = '" . $data['view_price' . $view_id] . "',
							is_default ='" . $isdft . "'";

				$this -> db -> query($query2);
			}
		}

		if (count($data['color_ids']) > 0) {

			foreach ($data['color_ids'] as $key => $color_id) {

				$qcolor = "INSERT INTO " . DB_PREFIX . "raw_product_color (raw_product_id,color_code,color_id, color_price,is_default) values ";
				$cis_default = ($data['color_default'] == $color_id) ? 1 : 0;
				$qc = "('" . (int)$raw_product_id . "','" . $data['color_code' . $color_id] . "','" . $color_id . "','" . $data['color_price' . $color_id] . "','" . $cis_default . "')";
				$this -> db -> query($qcolor . $qc);
				$inserted_color_id = $this -> db -> getLastId();

				if (count($data['view_ids']) > 0) {
					foreach ($data['view_ids'] as $key => $view_id) {
						$imageName = 'CV_' . $color_id . '_' . $view_id;
						if ($file[$imageName]['name']) {
							$filename = stripslashes($file[$imageName]['name']);
							$extension = $this -> findexts($filename);
							$extension = strtolower($extension);

							$image_name = date("Ymdhis") . time() . rand() . '.' . $extension;
							$target = _RAWPRODUCTORIGINAL_ . $image_name;

							$filestatus = move_uploaded_file($file[$imageName]['tmp_name'], $target);
							@chmod($target, 0777);
							if ($filestatus) {
								$imgSource = $target;

								$tinyThumbImage = _RAWPRODUCTTHUMB_ . $image_name;
								$Image41x41 = _RAWPRODUCT_41x41_ . $image_name;
								$Image500x500 = _RAWPRODUCT_500x500_ . $image_name;

								@chmod(_RAWPRODUCTTHUMB_, 0777);
								@chmod(_RAWPRODUCT_41x41_, 0777);
								@chmod(_RAWPRODUCT_500x500_, 0777);

								exec(IMAGEMAGICPATH . " $imgSource -thumbnail 80x80 $tinyThumbImage");
								exec(IMAGEMAGICPATH . " $imgSource -thumbnail 41x41 $Image41x41");
								exec(IMAGEMAGICPATH . " $imgSource -thumbnail 500x500 $Image500x500");

								if ($data['view_default'] == $view_id) {
									$isdft = 1;

								} else {
									$isdft = 0;
								}
								$query2 = "insert into " . DB_PREFIX . "raw_product_color_view set
						    raw_product_id = '" . (int)$raw_product_id . "',
						 	raw_product_color_id = '" . $inserted_color_id . "', 
							view_id = '" . $view_id . "',
							price = '" . $data['view_price' . $view_id] . "',
							image = '" . addslashes($image_name) . "',
							is_default ='" . $isdft . "'";

								$this -> db -> query($query2);

								if ($data['color_default'] == $color_id && $data['view_default'] == $view_id) {
									$this -> db -> query("UPDATE " . DB_PREFIX . "raw_product SET image = '" . addslashes($image_name) . "' WHERE  raw_product_id = '" . (int)$raw_product_id . "'");
								}
							}

						}
					}
				}
			}
		}

		$this -> cache -> delete('product');
	}

	public function editProduct($raw_product_id, $data, $file) {

		$this -> db -> query("UPDATE " . DB_PREFIX . "raw_product SET
				model = '" . $this -> db -> escape($data['model']) . "', 
				minimum = '" . (int)$data['minimum'] . "', 
				manufacturer_id = '" . (int)$data['manufacturer_id'] . "',
				price = '" . (float)$data['price'] . "', 
				weight = '" . (float)$data['weight'] . "',
				length = '" . (float)$data['length'] . "',
				width = '" . (float)$data['width'] . "',
				height = '" . (float)$data['height'] . "',
				status = '" . (int)$data['status'] . "',
				is_screen_printing = '" . (int)$data['is_screen_printing'] . "'
				WHERE raw_product_id='" . $raw_product_id . "'");

		foreach ($data['raw_product_description'] as $language_id => $value) {

			$this -> db -> query("DELETE FROM " . DB_PREFIX . "raw_product_description WHERE raw_product_id = '" . (int)$raw_product_id . "'");

			$this -> db -> query("INSERT INTO " . DB_PREFIX . "raw_product_description SET raw_product_id = '" . (int)$raw_product_id . "', language_id = '" . (int)$language_id . "', name = '" . $this -> db -> escape($value['name']) . "', meta_keyword = '" . $this -> db -> escape($value['meta_keyword']) . "', meta_description = '" . $this -> db -> escape($value['meta_description']) . "', description = '" . $this -> db -> escape($value['description']) . "', tag = '" . $this -> db -> escape($value['tag']) . "'");
		}

		//$this->db->query("DELETE FROM " . DB_PREFIX . "raw_product_description WHERE raw_product_id = '" . (int)$raw_product_id . "'");
		$this -> db -> query("UPDATE " . DB_PREFIX . "raw_product_category SET 
						category_id = '" . (int)$data['category_id'] . "' 
						WHERE raw_product_id 	 = '" . (int)$raw_product_id . "'");

		if (count($data['size_ids']) > 0) {
			$this -> db -> query("DELETE FROM " . DB_PREFIX . "raw_product_size WHERE raw_product_id = '" . (int)$raw_product_id . "'");
			$qsize = "INSERT INTO " . DB_PREFIX . "raw_product_size (raw_product_id,size_id,price,status) values ";
			$qs = '';
			foreach ($data['size_ids'] as $key => $val) {

				$qs .= "('" . (int)$raw_product_id . "','" . $val . "','" . $data['size_price' . $val] . "','1'),";
			}
			if ($qs != '') {
				$qsize = $qsize . rtrim($qs, ',');
				$this -> db -> query($qsize);
			}
		}

		if (count($data['view_ids']) > 0) {
			foreach ($data['view_ids'] as $key => $view_id) {
				if ($data['view_default'] == $view_id) {
					$isdft = 1;

				} else {
					$isdft = 0;
				}
				$query2 = "UPDATE  " . DB_PREFIX . "raw_product_view set
							price = '" . $data['view_price' . $view_id] . "',
							is_default ='" . $isdft . "' WHERE  raw_product_id = '" . (int)$raw_product_id . "' AND
							view_id = '" . $view_id . "'";

				$this -> db -> query($query2);
			}
		}

		if (count($data['color_ids']) > 0) {

			foreach ($data['color_ids'] as $key => $color_id) {
				$raw_product_color_id = '';

				$rpc = $this -> db -> query("select id from " . DB_PREFIX . "raw_product_color where raw_product_id='" . (int)$raw_product_id . "' and  color_id='" . $color_id . "'");

				$rpcrst = $rpc -> row;
				if (!empty($rpcrst)) {
					$raw_product_color_id = $rpcrst['id'];
				}
				$cis_default = ($data['color_default'] == $color_id) ? 1 : 0;
				//echo $raw_product_color_id."|-".$color_id."-|";
				if ($raw_product_color_id == '') {

					$qcolor = "INSERT INTO " . DB_PREFIX . "raw_product_color (raw_product_id,color_code,color_id, color_price,is_default) values ";

					$qc = "('" . (int)$raw_product_id . "','" . $data['color_code' . $color_id] . "','" . $color_id . "','" . $data['color_price' . $color_id] . "','" . $cis_default . "')";
					//echo $qcolor.$qc;
					$this -> db -> query($qcolor . $qc);
					$inserted_color_id = $this -> db -> getLastId();

				} else {

					$this -> db -> query("UPDATE " . DB_PREFIX . "raw_product_color SET
	color_code='" . $data['color_code' . $color_id] . "',
	color_price='" . $data['color_price' . $color_id] . "',
	is_default='" . $cis_default . "'
	WHERE id='" . $raw_product_color_id . "'
	");
					$inserted_color_id = $raw_product_color_id;
				}

				if (count($data['view_ids']) > 0) {
					foreach ($data['view_ids'] as $key => $view_id) {
						$imageName = 'CV_' . $color_id . '_' . $view_id;
						$oldimageName = !empty($data['OLDCV_' . $color_id . '_' . $view_id]) ? $data['OLDCV_' . $color_id . '_' . $view_id] : '';
						if ($file[$imageName]['name']) {
							$filename = stripslashes($file[$imageName]['name']);
							$extension = $this -> findexts($filename);
							$extension = strtolower($extension);

							$image_name = date("Ymdhis") . time() . rand() . '.' . $extension;
							$target = _RAWPRODUCTORIGINAL_ . $image_name;

							$filestatus = move_uploaded_file($file[$imageName]['tmp_name'], $target);
							@chmod($target, 0777);
							if ($filestatus) {
								$imgSource = $target;

								$tinyThumbImage = _RAWPRODUCTTHUMB_ . $image_name;
								$Image41x41 = _RAWPRODUCT_41x41_ . $image_name;
								$Image500x500 = _RAWPRODUCT_500x500_ . $image_name;

								@chmod(_RAWPRODUCTTHUMB_, 0777);
								@chmod(_RAWPRODUCT_41x41_, 0777);
								@chmod(_RAWPRODUCT_500x500_, 0777);

								exec(IMAGEMAGICPATH . " $imgSource -thumbnail 80x80 $tinyThumbImage");
								exec(IMAGEMAGICPATH . " $imgSource -thumbnail 41x41 $Image41x41");
								exec(IMAGEMAGICPATH . " $imgSource -thumbnail 500x500 $Image500x500");

								if ($data['view_default'] == $view_id) {
									$isdft = 1;

								} else {
									$isdft = 0;
								}
								if ($raw_product_color_id == '') {
									$query2 = "insert into " . DB_PREFIX . "raw_product_color_view set
						    raw_product_id = '" . (int)$raw_product_id . "',
						 	raw_product_color_id = '" . $inserted_color_id . "', 
							view_id = '" . $view_id . "',
							price = '" . $data['view_price' . $view_id] . "',
							image = '" . addslashes($image_name) . "',
							is_default ='" . $isdft . "'";

									$this -> db -> query($query2);
								} else {
									$query2 = "UPDATE " . DB_PREFIX . "raw_product_color_view SET
						
							image = '" . addslashes($image_name) . "'
							WHERE raw_product_id = '" . (int)$raw_product_id . "'AND
						 	raw_product_color_id = '" . $raw_product_color_id . "'AND 
							view_id = '" . $view_id . "'";

									$this -> db -> query($query2);
									if ($oldimageName != '') {
										@unlink(_RAWPRODUCTTHUMB_ . $oldimageName);
										@unlink(_RAWPRODUCT_41x41_ . $oldimageName);
										@unlink(_RAWPRODUCT_500x500_ . $oldimageName);
									}

								}

							}

						}
					}
				}

				if ($data['color_default'] == $color_id) {
					$defaultview = '';
					$dv = $this -> db -> query("select image from " . DB_PREFIX . "raw_product_color_view   where raw_product_id='" . (int)$raw_product_id . "' and  raw_product_color_id = '" . $inserted_color_id . "' and view_id='" . $data['view_default'] . "'");

					$dvrst = $dv -> row;
					if (!empty($dvrst)) {
						$defaultview = $dvrst['image'];
					}
					$this -> db -> query("UPDATE " . DB_PREFIX . "raw_product SET image = '" . addslashes($defaultview) . "' WHERE  raw_product_id = '" . (int)$raw_product_id . "'");
				}

			}
			$allcolors = implode(',', $data['color_ids']);

			$deletecolor = $this -> db -> query("select id  FROM " . DB_PREFIX . "raw_product_color WHERE raw_product_id = '" . (int)$raw_product_id . "' AND  color_id NOT IN (" . $allcolors . ")");

			if (count($deletecolor) > 0) {
				foreach ($deletecolor->rows as $dc) {

					$this -> db -> query("DELETE FROM " . DB_PREFIX . "raw_product_color WHERE id = '" . (int)$dc['id'] . "'");
					$this -> db -> query("DELETE FROM " . DB_PREFIX . "raw_product_color_view WHERE raw_product_color_id = '" . (int)$dc['id'] . "' AND raw_product_id = '" . (int)$raw_product_id . "'");

				}

			}

		}

		$this -> cache -> delete('product');
	}

	public function deleteProduct($raw_product_id) {
		$this -> db -> query("UPDATE  " . DB_PREFIX . "raw_product SET  is_deleted='1' WHERE raw_product_id = '" . (int)$raw_product_id . "'");
		/*$this->db->query("DELETE FROM " . DB_PREFIX . "raw_product WHERE raw_product_id = '" . (int)$raw_product_id . "'");

		 $this->db->query("DELETE FROM " . DB_PREFIX . "raw_product_description WHERE raw_product_id = '" . (int)$raw_product_id . "'");

		 $this->db->query("DELETE FROM " . DB_PREFIX . "raw_product_color WHERE raw_product_id = '" . (int)$raw_product_id . "'");
		 $this->db->query("DELETE FROM " . DB_PREFIX . "raw_product_size WHERE raw_product_id = '" . (int)$raw_product_id . "'");
		 $this->db->query("DELETE FROM " . DB_PREFIX . "raw_product_color_view WHERE raw_product_id = '" . (int)$raw_product_id . "'");
		 $this->db->query("DELETE FROM " . DB_PREFIX . "raw_product_category WHERE raw_product_id = '" . (int)$raw_product_id . "'");
		 $this->db->query("DELETE FROM " . DB_PREFIX . "raw_product_color_size_quantity WHERE raw_product_id = '" . (int)$raw_product_id . "'");*/

		$this -> cache -> delete('product');
	}

	public function getProduct($raw_product_id) {
		$query = $this -> db -> query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'raw_product_id=" . (int)$raw_product_id . "') AS keyword FROM " . DB_PREFIX . "raw_product p LEFT JOIN " . DB_PREFIX . "raw_product_description pd ON (p.raw_product_id = pd.raw_product_id) WHERE p.raw_product_id = '" . (int)$raw_product_id . "' AND pd.language_id = '" . (int)$this -> config -> get('config_language_id') . "'");

		return $query -> row;
	}

	public function getProducts($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "raw_product p LEFT JOIN " . DB_PREFIX . "raw_product_description pd ON (p.raw_product_id = pd.raw_product_id)";

		$sql .= " WHERE pd.language_id = '" . (int)$this -> config -> get('config_language_id') . "' AND p.is_deleted='0'";

		$sql .= " GROUP BY p.raw_product_id";

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY pd.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this -> db -> query($sql);

		return $query -> rows;
	}

	public function getProductDescriptions($raw_product_id) {
		$product_description_data = array();

		$query = $this -> db -> query("SELECT * FROM " . DB_PREFIX . "raw_product_description WHERE raw_product_id = '" . (int)$raw_product_id . "'");

		foreach ($query->rows as $result) {
			$product_description_data[$result['language_id']] = array('name' => $result['name'], 'description' => $result['description'], 'meta_keyword' => $result['meta_keyword'], 'meta_description' => $result['meta_description'], 'tag' => $result['tag']);
		}

		return $product_description_data;
	}

	public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.raw_product_id) AS total FROM " . DB_PREFIX . "raw_product p LEFT JOIN " . DB_PREFIX . "raw_product_description pd ON (p.raw_product_id = pd.raw_product_id)";

		$sql .= " WHERE pd.language_id = '" . (int)$this -> config -> get('config_language_id') . "' AND p.is_deleted='0'";

		$query = $this -> db -> query($sql);

		return $query -> row['total'];
	}

	public function getViews() {
		$query = $this -> db -> query("SELECT sys_value FROM " . DB_PREFIX . "system_config  WHERE  	sys_name = 'VIEW_OPTION'");

		$sys_config = $query -> row;
		$option_id = $sys_config['sys_value'];
		$query = $this -> db -> query("SELECT option_value_id as view_id, name FROM " . DB_PREFIX . "option_value_description WHERE option_id = '" . (int)$option_id . "' AND language_id = '" . (int)$this -> config -> get('config_language_id') . "'");
		$view_ids = array();
		foreach ($query->rows as $result) {
			$view_ids[] = $result;
		}
		return $view_ids;
	}

	public function getSizes() {
		$query = $this -> db -> query("SELECT sys_value FROM " . DB_PREFIX . "system_config  WHERE  	sys_name = 'SIZE_OPTION'");

		$sys_config = $query -> row;
		$option_id = $sys_config['sys_value'];
		$query = $this -> db -> query("SELECT option_value_id as size_id, name FROM " . DB_PREFIX . "option_value_description WHERE option_id = '" . (int)$option_id . "' AND language_id = '" . (int)$this -> config -> get('config_language_id') . "'");
		$size_ids = array();
		foreach ($query->rows as $result) {
			$size_ids[] = $result;
		}
		return $size_ids;
	}

	public function getCategories() {

		$query = $this -> db -> query('select c.category_id,cd.name from ' . DB_PREFIX . 'category as c left join ' . DB_PREFIX . 'category_description as cd on cd.category_id=c.category_id where cd.language_id="' . (int)$this -> config -> get('config_language_id') . '" and c.parent_id="0" order by c.sort_order ');
		$category_ids = array();
		foreach ($query->rows as $result) {
			$category_ids[] = $result;
		}
		return $category_ids;
	}

	public function getManufacturers() {

		$query = $this -> db -> query('select manufacturer_id ,name from ' . DB_PREFIX . 'manufacturer where 1 ');
		$manufacturer_ids = array();
		foreach ($query->rows as $result) {
			$manufacturer_ids[] = $result;
		}
		return $manufacturer_ids;
	}

	public function getProductSizes($raw_product_id) {
		$query = $this -> db -> query("SELECT ps.*,ovd.name FROM " . DB_PREFIX . "raw_product_size  as ps left join  " . DB_PREFIX . "option_value_description as ovd on ovd.option_value_id =ps.size_id  WHERE   ps.raw_product_id='" . $raw_product_id . "' AND  ovd.language_id='" . (int)$this -> config -> get('config_language_id') . "' ");

		$sizes = array();
		foreach ($query->rows as $result) {
			$sizes[] = $result;
		}
		return $sizes;
	}

	public function getProductColors($raw_product_id) {
		$query = $this -> db -> query("SELECT pc.*,c.name FROM " . DB_PREFIX . "raw_product_color as pc left join  " . DB_PREFIX . "color as c on c.color_id=pc.color_id where  pc.raw_product_id='" . $raw_product_id . "' AND pc.status='1'");

		$colors = array();
		foreach ($query->rows as $result) {
			$colors[] = $result;
		}
		return $colors;
	}

	public function getProductQuantity($raw_product_id) {
		$query = $this -> db -> query("SELECT * FROM " . DB_PREFIX . "raw_product_color_size_quantity where  raw_product_id='" . $raw_product_id . "'");

		$quantity = array();
		foreach ($query->rows as $result) {
			$quantity[$result['raw_product_color_id']][$result['raw_product_size_id']] = $result['quantity'];
		}
		return $quantity;
	}

	public function setInventory($raw_product_id, $data) {
		//echo 'ddddd';
		$sizes = $this -> getProductSizes($raw_product_id);
		$colors = $this -> getProductColors($raw_product_id);
		//echo 'wwwwwwwwww';
		if (!empty($colors)) {

			$this -> db -> query("DELETE FROM " . DB_PREFIX . "raw_product_color_size_quantity WHERE raw_product_id = '" . (int)$raw_product_id . "'");

			$query = "INSERT INTO " . DB_PREFIX . "raw_product_color_size_quantity (raw_product_id,raw_product_color_id,raw_product_size_id,quantity) values ";
			$qr = '';
			foreach ($colors as $color) {

				if (!empty($sizes)) {

					foreach ($sizes as $size) {
						$fieldname = 'CS_' . $color['id'] . '_' . $size['id'];
						$quantity = $data[$fieldname];
						$qr .= "('" . $raw_product_id . "','" . $color['id'] . "','" . $size['id'] . "','" . $quantity . "'),";
					}

				}
			}
			$query = $query . rtrim($qr, ',');
			$this -> db -> query($query);

		}

	}

	public function getProductCategories($raw_product_id) {
		$query = $this -> db -> query("SELECT category_id FROM " . DB_PREFIX . "raw_product_category where  raw_product_id='" . $raw_product_id . "'");

		$cat = $query -> row;
		/*foreach ($query->rows as $result) {
		 $quantity[$result['raw_product_color_id']][$result['raw_product_size_id']] = $result['quantity'];
		 }*/
		$category = $cat['category_id'];
		return $category;
	}

	public function getProductViews($raw_product_id, $distinct) {
		$cond = '';
		//echo $distinct;
		if ($distinct == '1') {
			$qr = 'select pv.*,ovd.name from  ' . DB_PREFIX . 'raw_product_view as pv left join ' . DB_PREFIX . 'option_value_description as ovd on ovd.option_value_id =pv.view_id where  pv.raw_product_id="' . $raw_product_id . '" AND  ovd.language_id="' . (int)$this -> config -> get('config_language_id') . '" ';
		} else {
			$qr = 'select pv.*,ovd.name,pc.color_id from  ' . DB_PREFIX . 'raw_product_color_view as pv left join ' . DB_PREFIX . 'option_value_description as ovd on ovd.option_value_id =pv.view_id left join ' . DB_PREFIX . 'raw_product_color as pc on pc.id=pv.raw_product_color_id  where  pv.raw_product_id="' . $raw_product_id . '" AND  ovd.language_id="' . (int)$this -> config -> get('config_language_id') . '" ';
		}
		//echo $qr;
		$query = $this -> db -> query($qr);

		$view_ids = array();
		foreach ($query->rows as $result) {
			$view_ids[] = $result;
		}
		return $view_ids;
	}

	public function getProductSizesEdit($raw_product_id) {

		$qr = 'select * from  ' . DB_PREFIX . 'raw_product_size where  raw_product_id="' . $raw_product_id . '" ';

		$query = $this -> db -> query($qr);

		$view_ids = array();
		$view_ids['id'] = array();
		$view_ids['price'] = array();
		foreach ($query->rows as $result) {
			$view_ids['id'][] = $result['size_id'];
			$view_ids['price'][$result['size_id']] = $result['price'];
		}
		return $view_ids;
	}

	public function getProductcolorsEdit($raw_product_id) {

		$qr = 'select * from ' . DB_PREFIX . 'raw_product_color  where  raw_product_id="' . $raw_product_id . '"';
		$query = $this -> db -> query($qr);

		$color_ids = array();
		$color_ids['id'] = array();
		$color_ids['price'] = array();
		$color_ids['default'] = '';
		foreach ($query->rows as $result) {
			$color_ids['id'][] = $result['color_id'];
			$color_ids['price'][$result['color_id']] = $result['color_price'];
			if ($result['is_default'] == 1) {
				$color_ids['default'] = $result['color_id'];
			}
		}
		return $color_ids;
	}

	public function getOrderproduct($pid) {

		//echo "SELECT  *  FROM " . DB_PREFIX . "main_product WHERE product_id = '" . (int)$pid . "'";
		$query = $this -> db -> query("SELECT  *  FROM " . DB_PREFIX . "main_product WHERE product_id = '" . (int)$pid . "'");

		if (count($query -> row) > 0) {
			return $query -> row;
		} else {
			return 0;
		}
	}

	public function getOrderproductviews($view_id, $raw_product_id) {

		$querys = 'select pv.*,ovd.name from  ' . DB_PREFIX . 'raw_product_view as pv left join ' . DB_PREFIX . 'option_value_description as ovd on ovd.option_value_id =pv.view_id where  pv.raw_product_id="' . $raw_product_id . '"  AND pv.view_id ="' . $view_id . '" AND  ovd.language_id="' . (int)$this -> config -> get('config_language_id') . '" ';

		$query = $this -> db -> query($querys);

		if (count($query -> row) > 0) {
			return $query -> row;
		} else {
			return 0;
		}
	}

}
?>
