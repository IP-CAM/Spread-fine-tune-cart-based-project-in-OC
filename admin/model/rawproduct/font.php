<?php
class ModelRawproductFont extends Model {
	public function addFont($post,$file) {
	
		include('ycTIN_TTF.php');	
        $is_default=(isset($post['is_default']) ? (int)$post['is_default'] : 0);
        $queryInsert = "insert into " . DB_PREFIX . "font set   is_default = '". $is_default."', sort_order = '".(int)$post['sort_order'] ."',  status='" . (int)$post['status'] . "',  directionshow='" . (int)$post['directionshow'] . "', date_modified = NOW(), date_added = NOW() ";
			$this->db->query($queryInsert);

		$inserted_id = $this->db->getLastId();
        if($is_default==1)
		{
			$this->db->query("UPDATE  " . DB_PREFIX . "font SET  is_default = '0' WHERE font_id !='".$inserted_id."' ");
			
			}


		for($i=1;$i<=$post['numberoftype'];$i++) {

			$imageName = "fontTTF".$i;

			$special = "font_type".$i;

			if($file[$imageName]['name']){

				$filename = stripslashes($file[$imageName]['name']);


				  $filename = strtolower($filename) ;
				
				  $exts = @split("[/\\.]", $filename) ;
				
				  $n = count($exts)-1;
				
				  $extension = $exts[$n];
				
			
				 

				$extension = strtolower($extension);

				

				$imgNewName = date("Ymdhis").time().rand();

				$image_name = $imgNewName.'.'.$extension;

				$png_image_name = $imgNewName.'.png';

				$target    = _FONTTTF_.$image_name;

				if($extension == "ttf") {	

					$filestatus = move_uploaded_file($file[$imageName]['tmp_name'], $target);

					chmod($target, 0777);

					if(!$filestatus) {				

						//$_SESSION['SESS_MSG'] = msgSuccessFail('fail',LANG_THERE_IS_SOME_ERROR_IN_UPLOADING_FILE);

					} else {

						

						$queryTTF 	= new ycTIN_TTF(); //create yctin_ttf object

						$objFont 	= $queryTTF->generateFontImage(_FONTTTF_.$image_name , $image_name);

					}					

				    if($post[$special])

						$con = ", font_type = '".$post[$special]."'";

					else

						$con = "";
   //, fontName = '".$objFont->fontStyle."',
					$query = "insert into " . DB_PREFIX . "font_value set  font_id  = '".$inserted_id."', font_ttf = '$image_name', image = '$png_image_name' $con ";


					$this->db->query($query);
					
					if($i==1)
					{
						$queryupdate = "UPDATE  " . DB_PREFIX . "font set  name  = '".$objFont->fontStyle."', image = '".$png_image_name."' where font_id='".$inserted_id."'";


					$this->db->query($queryupdate);
						
						}
					

				} else {

	
					$this->db->query("DELETE FROM `" . DB_PREFIX . "font` WHERE font_id = '" . (int)$inserted_id . "'");

				} 

			}else{
							$this->db->query("DELETE FROM `" . DB_PREFIX . "font` WHERE font_id = '" . (int)$inserted_id . "'");
		

			}	

								

		}	

		
		
		$this->cache->delete('font');
	}
	
	public function editFont($font_id, $post,$file) {
		
	    include('ycTIN_TTF.php');	
		$inserted_id = $font_id;
        $is_default=(isset($post['is_default']) ? (int)$post['is_default'] : 0);
        $queryInsert = "UPDATE  " . DB_PREFIX . "font set   is_default = '". $is_default."', sort_order = '".(int)$post['sort_order'] ."',  status='" . (int)$post['status'] . "',  directionshow='" . (int)$post['directionshow'] . "', date_modified = NOW() WHERE  font_id ='".$inserted_id."' ";
		$this->db->query($queryInsert);

		
        if($is_default==1)
		{
	$this->db->query("UPDATE  " . DB_PREFIX . "font SET  is_default = '0' WHERE font_id !='".$inserted_id."' ");
			
		}
        
		$font_value_ids = explode(",",$post['font_value_ids']);
$i=1;
		foreach($font_value_ids as $id){
			 $imageName = "editfontTTF".$id;

		 	$special = "editfont_type".$id;
			
				if($file[$imageName]['name']){

				$filename = stripslashes($file[$imageName]['name']);


				  $filename = strtolower($filename) ;
				
				  $exts = @split("[/\\.]", $filename) ;
				
				  $n = count($exts)-1;
				
				  $extension = $exts[$n];
				
			
				 

				$extension = strtolower($extension);

				

				$imgNewName = date("Ymdhis").time().rand();

				$image_name = $imgNewName.'.'.$extension;

				$png_image_name = $imgNewName.'.png';

				$target    = _FONTTTF_.$image_name;

				if($extension == "ttf") {	

					$filestatus = move_uploaded_file($file[$imageName]['tmp_name'], $target);

					chmod($target, 0777);

					if(!$filestatus) {				

						//$_SESSION['SESS_MSG'] = msgSuccessFail('fail',LANG_THERE_IS_SOME_ERROR_IN_UPLOADING_FILE);

					} else {

						

						$queryTTF 	= new ycTIN_TTF(); //create yctin_ttf object

						$objFont 	= $queryTTF->generateFontImage(_FONTTTF_.$image_name , $image_name);

					}					

				    if($post[$special])

						$con = ", font_type = '".$post[$special]."'";

					else

						$con = "";
   //, fontName = '".$objFont->fontStyle."',
					$query = "UPDATE " . DB_PREFIX . "font_value SET  font_id  = '".$inserted_id."', font_ttf = '$image_name', image = '$png_image_name' $con  WHERE font_value_id='".$id."'";


					$this->db->query($query);
					
					
					if($i==1)
					{
						$queryupdate = "UPDATE  " . DB_PREFIX . "font set  name  = '".$objFont->fontStyle."', image = '".$png_image_name."' where font_id='".$inserted_id."'";


					$this->db->query($queryupdate);
						
						}
					

				} 

			}
			$i++;
			}

		for($i=1;$i<=$post['numberoftype'];$i++) {

			$imageName = "fontTTF".$i;

			$special = "font_type".$i;

			if(!empty($file[$imageName]['name'])){

				$filename = stripslashes($file[$imageName]['name']);


				  $filename = strtolower($filename) ;
				
				  $exts = @split("[/\\.]", $filename) ;
				
				  $n = count($exts)-1;
				
				  $extension = $exts[$n];
				
			
				 

				$extension = strtolower($extension);

				

				$imgNewName = date("Ymdhis").time().rand();

				$image_name = $imgNewName.'.'.$extension;

				$png_image_name = $imgNewName.'.png';

				$target    = _FONTTTF_.$image_name;

				if($extension == "ttf") {	

					$filestatus = move_uploaded_file($file[$imageName]['tmp_name'], $target);

					chmod($target, 0777);

					if(!$filestatus) {				

						//$_SESSION['SESS_MSG'] = msgSuccessFail('fail',LANG_THERE_IS_SOME_ERROR_IN_UPLOADING_FILE);

					} else {

						

						$queryTTF 	= new ycTIN_TTF(); //create yctin_ttf object

						$objFont 	= $queryTTF->generateFontImage(_FONTTTF_.$image_name , $image_name);

					}					

				    if($post[$special])

						$con = ", font_type = '".$post[$special]."'";

					else

						$con = "";
   //, fontName = '".$objFont->fontStyle."',
					$query = "insert into " . DB_PREFIX . "font_value set  font_id  = '".$inserted_id."', font_ttf = '$image_name', image = '$png_image_name' $con ";


					$this->db->query($query);
					
					if($i==1)
					{
						$queryupdate = "UPDATE  " . DB_PREFIX . "font set  name  = '".$objFont->fontStyle."', image = '".$png_image_name."' where font_id='".$inserted_id."'";


					$this->db->query($queryupdate);
						
						}
					

				} 

			}

								

		}	
		
		
		
///////////////////////////////////////////////////////////////////////////////		
		
		
		
		$this->cache->delete('font');
	}
	
	public function deletefont($font_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "font WHERE font_id = '" . (int)$font_id . "'");
		//$this->db->query("DELETE FROM " . DB_PREFIX . "font_description WHERE font_id = '" . (int)$font_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "font_value WHERE font_id = '" . (int)$font_id . "'");
		
		$this->cache->delete('font');
	} 

	
			
	public function getFont($font_id) {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "font  WHERE font_id = '" . (int)$font_id . "'");
		
		return $query->row;
	} 
	
	public function getFonts($data) {
		$sql = "SELECT * from " . DB_PREFIX . "font  where 1 ";
	
		
		if (!empty($data['filter_name'])) {
			$sql .= " AND name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY font_id ORDER BY name";
		
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
				
	public function getFontValue($font_id) {
		$font_value = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "font_value WHERE font_id = '" . (int)$font_id . "'");
		
		foreach ($query->rows as $result) {
			$font_value[] =$result;
		}
		
		return $font_value;
	}	
	
	
		
	public function getTotalFonts() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "font");
		
		return $query->row['total'];
	}	
		
		
}
?>