<?php 
error_reporting(0);
//echo phpinfo();

class ControllerRawproductGeneratepdf extends Controller { 
	private $error = array();
 
	public function index() {
		$this->language->load('rawproduct/color');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('rawproduct/color');
		 
		$this->getList();
	}
     function createFolder($dirName) {
        if (!is_dir($dirName)) {
			//echo $dirName.'<br><br>';
            mkdir($dirName);
            @chmod($dirName, 0777);
        }
    }
	
	        // end : Generate artwork pdf====================
// function for text image
  function getTextImage($value, $imageDestName, $imageGradientDest,$ratioW,$ratioH){
	  //print_r($value);
   
      $normalImage=$imageDestName;
      $image=$imageDestName;
      $gradientpath=$imageGradientDest;
      
    
              $posW = ($value->width * $ratioW);
              $posH = ($value->height * $ratioH);
      
      
        $font = '';
        $cond = '';
        $boldtype = $value->bold;
        $italictype = $value->italic;
   if ($boldtype == 1 && $italictype == 1)
		$cond = 'boldI';
		elseif ($boldtype == 1)
		$cond = 'bold';
		elseif ($italictype == 1)
		$cond = 'italic';
		else
		$cond='normal';

        $fontid = $value->fontId;
		
        $queryss = 'select font_ttf  from '.DB_PREFIX .'font_value where font_id="'.$fontid.'" and font_type ="'.$cond.'"';
		// echo "<br><br><br><br>";
		 $rstsss=mysql_query($queryss);
	   //$_SESSION['qqqq']= $query;
       $fontArr = mysql_fetch_object($rstsss);
	    $font = _FONTTTF_. $fontArr->font_ttf;
		
		$querydirection = 'select directionshow  from '.DB_PREFIX.'font where font_id="'.$fontid.'" ';
	   //$_SESSION['qqqq']= $query;
       $directionshw = mysql_fetch_object(mysql_query($querydirection));
	   $directionshow='';
	   if($directionshw->directionshow==2)
	   {
		   $directionshow=" -direction right-to-left ";
		   }
	 
		
  		$queryss='';

        // text color
        $txtColor =(!empty($value->color))?$value->color:'000000'; 
		
        $txt_color =(!empty($value->color))?$value->color:'000000';
        $strstrokecolor = '000000';
        $strstrokecolor .= $txt_color;
        $txtColor = substr($strstrokecolor, -6);

        /*if ($txtColor == '000000')
            $color = '000002';
        elseif ($txtColor == 'FFFFFF' || $txtColor == 'ffffff')
            $color = 'FDFFFF';
        else
            $color = $txtColor;*/
 		$color = $txtColor;			
        // for flip flop
     //   $flipStr = ($value->dataObj->flipV == 0) ? '' : '-flip';
     //   $flopStr = ($value->dataObj->flipH == 0) ? '' : '-flop';

       

        // outline text color
        $strokewidth = (!empty($value->outlineWidth))?$value->outlineWidth:0;
        $stro = (!empty($value->outlineColor))?$value->outlineColor:'000000';
        $strstroke = '000000';
        $strstroke .= $stro;
        $stroke = substr($strstroke, -6);
 		
   

      
        // rotation for text
 

        // gravity and kerning for text
   
        $gravity = "center";
       


        // text data

        $lines = preg_split("/\r\n|[\r\n]/", $value->text);
        $countLine = count($lines);
        $text = '';
        for ($i = 0; $i < $countLine; $i++) {
            $text = $text . $lines[$i];
            if ($i != $countLine - 1) {
                $text = $text . " \n ";
            }
        }
       $lancount=strlen($text);
		if($lancount<4)
		{
		$text='   '.$text.'  ';	
			}else{
		$text=' '.$text.' ';
			}


       /* $File = "TextFile.txt";
        $Handle = fopen($File, 'w');
        fwrite($Handle, $text);
        fclose($Handle);*/

        $shadowImage = '';

        $w = $posW;
        $h = $posH;


        $start = ' -background transparent -depth 8 ';//"' . $flipStr . '" "' . $flopStr . '" 

     $arc=(!empty($value->arc))?$value->arc:0;
        $abst=abs( $arc );
		
		$arctype=($abst==0)?1:$arc/$abst;
		 //echo "<br>";
		 $angle=$abst;
		$degree=($arctype==1)?0:180;  
		
             
      //echo "<br>"; echo "<br>";
         
		// exec(IMAGEMAGICPATH.$query);
		
	/*	if($w < 500 && $h < 500){
		$w1=500;
		$h1=500;
		$doresize=1;
		}else{
	    $w1=$h;
		$h1=$h;
		$doresize=0;
			}*/
      if($w>$h)
	  {
		$w1=$w;
		$h1=$w;
		$doresize=1;
		  }else{
	    $w1=$h;
		$h1=$h;
		$doresize=1;
			  }
	 $rtos=$w1/1000;
	//echo "<br>";
	 $strokewidth = $strokewidth * $rtos;
	 $cmdoutline='';
		 if($strokewidth  > 0 && $stroke!=''){
		 $cmdoutline =' -strokewidth '.$strokewidth.' -stroke "#'.$stroke.'" ';
		}	  
	  exec(IMAGEMAGICPATH.$start." ".$cmdoutline.' -font "'.$font.'" -encoding Unicode    -gravity "NorthWest" -fill "#'.$color.'" -size "'.$w1.'"x"'.$h1.'"\! '.$directionshow.' label:"'.$text.'" -rotate '.$degree.' -distort Arc "'.$angle.' '.$degree.'" -trim "'.$normalImage.'"');
//echo   IMAGEMAGICPATH.$start." ".$cmdoutline.' -font "'.$font.'" -encoding Unicode    -gravity "NorthWest" -fill "#'.$color.'" -size "'.$w1.'"x"'.$h1.'"\! '.$directionshow.' label:"'.$text.'" -rotate '.$degree.' -distort Arc "'.$angle.' '.$degree.'" -trim "'.$normalImage.'"';
	//echo "<br>".$w."x".$h;
	//die;
	   if($doresize==1){
	  exec(IMAGEMAGICPATH." $normalImage -resize ".$w."x".$h."! $normalImage");
	   }

	            
        return $image;          
   
		
	}
// end function for text image

      function DELETE_ALL_DIRS($dirname) {
        if (is_dir($dirname)) {
            $dir_handle = opendir($dirname);
            while ($file = readdir($dir_handle)) {
                if ($file != "." && $file != "..") {
                    if (!is_dir($dirname . "/" . $file)) {
                        unlink($dirname . "/" . $file);
                    } else {
                        $this->DELETE_ALL_DIRS($dirname . "/" . $file);
                        @rmdir($dirname . "/" . $file);
                    }
                }
            }
            closedir($dir_handle);
            @rmdir($dirname);
            return true;
        } else
            return false;
    }  
                          
// end function for image
	 function Pdfdelete(){
			error_reporting(0);
        $oid = $_GET['orderId'];
       $pid = $_GET['pId'];
         $zipname =_PDFPRODUCTION_.$_GET['zipname'] . ".zip";
        $fil=explode('_',$_GET['zipname']);
	//	echo "<br>";
         $pdfremove = _PDFPRODUCTION_ . $fil[0]. "/" . $fil[1]. "/" . $fil[2];
       
		mysql_query("Delete from " . DB_PREFIX . "order_product_pdf WHERE  order_id = '" . $oid . "' AND product_id = '" . $pid . "'");					
		if(file_exists($zipname)){				
        @unlink($zipname);
		}
        $this->DELETE_ALL_DIRS($pdfremove);

     
    $pdfhref= $this->url->link('rawproduct/generatepdf/PdfGenerate', 'token=' . $this->session->data['token'] . '&pId=' . $pid. '&orderId=' .  $oid, '');	
          
		    echo  "
              <a href='javascript:void(0);' data-hrefs='".$pdfhref."'  onclick=\"generatePDF('PDF_".$oid.$pid."','GPDF_".$oid.$pid."')\" id='GPDF_".$oid.$pid."'>Generate Output </a>";
        exit;
    }
	
	  function PdfGenerate() {
// config for PDF==================
		header('Content-Type: text/html', true);
		header('charset: utf-8', true);
		error_reporting(0);
		/*
		error_reporting(~E_DEPRECATED);*/
		//error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
		ini_set('memory_limit', '5000M');
		ini_set('max_execution_time', 9999999);
// config for PDF==================
        $oid = $_GET['orderId'];
       $pid = $_GET['pId'];
 	 $this->db->query('SET @@LOCAL.wait_timeout=9999999'); // REMOVING MYSQL TIMEOUT WORKED 
       $this->load->model('rawproduct/product');

        // create folder
        $productionPDF = "PDF";
        $dirName = _PDF_ . $productionPDF;
        $this->createFolder($dirName); // Create First Level Directory	

        $dirName = _PDF_ . $productionPDF . "/" . $oid;
        $this->createFolder($dirName); // Create First Level Directory	

        $dirName = _PDF_ . $productionPDF . "/" . $oid . "/" . $pid;
        $this->createFolder($dirName); // Create Second Level Directory	
        // Order detail query 
		$line_ = $this->model_rawproduct_product->getOrderproduct($pid);
        
        if ($line_  != 0) {
          

            $langId = 1;
            $colorId = $line_['raw_product_color_id'];
       
            $dirName = _PDF_ . $productionPDF . "/" . $oid . "/" . $pid . "/" . $colorId;
            $this->createFolder($dirName); // Create Second Level Directory
       
           
            $productionzipfile = array();
            

                // pdf parameters


                $rowProductId = $line_['raw_product_id'];
                $dataArr = unserialize( $line_['data_arr']);
				 // for data Array


                if ($dataArr != '') {
                 //   $jsonEncodedData = json_decode(utf8_encode($dataArr));
					  $jsonEncodedData =  $dataArr;
                   //echo "<pre>";
                  //  print_r( $jsonEncodedData);
				
                    $num = 1;
                    $drawArea = "drawArea";
					$printInc = 0;

                    foreach ($jsonEncodedData as $fvalue) {
						
                        
						// $perfect_dpi=300;
						  $perfect_dpi=118.125;
						   $viewId_ = $fvalue->viewId;
						 
						   $designAreaId=$fvalue->designAreaId;
						   
						 $views = $this->model_rawproduct_product->getOrderproductviews($viewId_,$line_['raw_product_id']);
						//  print_r($views);
						   $viewName=$views['name'];
                            $design_area = unserialize($views['design_area']);
                             $design_area =  $design_area->designArea;
							// print_r($design_area);
                             for($i=0;$i<count($design_area);$i++)
                             {
								// echo $design_area[$i]->id.'=='.$designAreaId;
                                if($design_area[$i]->id==$designAreaId)
                                 {
                                    $wArea = $design_area[$i]->width;
                                    $hArea = $design_area[$i]->height;
                                   /*  $pdfX = $design_area[$i]->x;
                                     $pdfY =$design_area[$i]->y;
									 $pdfWidth = $design_area[$i]->width;
                                    $pdfHeight = $design_area[$i]->height;
									 */
                                    $printWidth = ($design_area[$i]->printW/2.54);
                                    $printHeight = ($design_area[$i]->printH/2.54);
                                    
                                   
                                 }   
                                 
                             }
                            
                                              
                            
                            $printWidth = ($printWidth * $perfect_dpi);
                            $printHeight =($printHeight * $perfect_dpi);
                            
                           // $printWidth = ($printWidth * 72);
                           // $printHeight =($printHeight * 72);
                            
                            $ratioW = $printWidth / $wArea;
                            $ratioH = $printHeight / $hArea;
							
                            
                            $size = array($printWidth, $printHeight);
                            
                          

 
                            $pdf = new PDFOUTPUT("P", "pt", $size);
                            $pdf->AddPage();
							//echo '<br>-------------------------nafees------------------------<br>';//
							
                           // if ($printInc == 0) {

                           $designDirName1 = _PDF_ . $productionPDF . "/" . $oid . "/" . $pid . "/" . $colorId . "/" . $viewName;
                            $this->createFolder($designDirName1); // Create fourth Level Directory
                            //}

                            $designDirName = _PDF_ . $productionPDF . "/" . $oid . "/" . $pid . "/" . $colorId . "/" . $viewName . "/designimages";
                            $this->createFolder($designDirName); // Create fourth Level Directory

                            $inc = $printInc + 1;
                            $pdfFileName = $oid . "-" . $pid . "-" . $colorId . "-" . $viewName . "-" . $drawArea . "-" . $inc . ".pdf"; // pdf name	
                           
                            if (count($fvalue->dataArr) != '0') {

                                foreach ($fvalue->dataArr as $value) {

                                    // for text value

                                    if ($value->type == "text") {
//$value->angle=0;
                                        $time = rand();
                                        $imageDestName = $designDirName . "/" . $time . '.png';
                                        $imageGradientDest = $designDirName . "/" . $time . '_gradient.png';

                                        if (strlen(trim($value->text)) >= 1) {
                                            $image = $this->getTextImage($value, $imageDestName, $imageGradientDest,$ratioW,$ratioH);
                                            
                                            $rotation = (-($value->angle));
										
                                            $posX = ($value->pdfX * $ratioW);
                                            $posY = ($value->pdfY * $ratioH);
                                            $posW = ($value->pdfWidth * $ratioW);
                                            $posH = ($value->pdfHeight * $ratioH);
											
                                            $pdf->RotateImageOutput($image, $posX, $posY, $posW, $posH, $rotation);
											
                                            //@unlink($image);
                                          //  @unlink($imageGradientDest);
                                           
                                        }
                                    }  // end text if
                                    // for clipart and userimage
                                    if ($value->type == "clipart") {

										//echo "clipart---<br>";
									$rotation = (($value->angle));		
									$angle=($rotation*M_PI/180);	
									$l=0;
									
									$count_images = count((array)$value->images);
									for($im=0 ; $im<$count_images ; $im++){
									
							/*		echo $pdfX."-".$pdfY."-".$pdfWidth."-".	$pdfHeight;
									echo "<br>";echo "<br>";echo "<br>--------------------";
										$posX = (($pdfX) * $ratioW);
										$posY = (($pdfY) * $ratioH);
										$posW = ($pdfWidth * $ratioW);
										$posH = ($pdfHeight * $ratioH);*/
										
										      $posX = ($value->pdfX * $ratioW);
                                            $posY = ($value->pdfY * $ratioH);
                                            $posW = ($value->pdfWidth * $ratioW);
                                            $posH = ($value->pdfHeight * $ratioH);
								
										$colorCode = '';
										if($value->colorable == '1'){
											$colorCode = $value->images[$im]->color;
											$txtColor	= '#'.$colorCode;
										}else{
											$colorCode = $value->images[$im]->color;						
											$txtColor	= '#'.$colorCode;
										}
	//$value->angle=0;
										$red		= hexdec(substr($txtColor, 1, 2));
										$green		= hexdec(substr($txtColor, 3, 2));
										$blue		= hexdec(substr($txtColor, 5, 2));
											
										$rotation = (-($value->angle));
										$img=explode('/',$value->images[$im]->url);
										$designImgSource = _CLIPART_ORIGINAL_.end($img);
										 
										 $imagetype=(!empty($value->imagetype))?$value->imagetype:'';
										
										if($imagetype=='image'){
											$userdesignImgSource= _USERUPLOAD_ORIGINAL_.end($img);
									    $pdf->RotateImageOutput($userdesignImgSource, $posX, $posY, $posW, $posH, $rotation);
										$l++;
										}else{
										
										
										
										if ($value->colorable == '1')											
										{
									//	echo "<br>";echo "<br>";echo "<br>--------------------";	
										 $designImgSource = str_replace('.png' , '.eps' , $designImgSource);
										if(!file_exists($designImgSource)){
											$designImgSource = str_replace('.eps' , '.png' , $designImgSource);
											$pdf->RotateImageOutput($designImgSource, $posX, $posY, $posW, $posH, $rotation);
										}else{
				
	//	echo $designImgSource.", ".$posX.", ".$posY.", ".$posW.", ".$posH.", ".$rotation.", ".$txtColor;
		//	echo "<br>";echo "<br>";echo "<br>";echo "<br>";
								/*			$num=rand();
								   $firstImagePath = $designDirName . "/".$num.".png";
						
										
										exec(IMAGEMAGICPATH." -density 300 -channel RGBA -colorspace RGB -background none -fill '".$txtColor."' -dither None  ".$designImgSource." -resize '".$posW."'x'".$posH."'! $firstImagePath");*/	
										
											
											  //$colorStr = ' "' . $firstImagePath . '" -fill "' . $txtColor . '"  "' . $firstImagePath . '"';
                                               // exec(IMAGEMAGICPATH. $colorStr);
												
											//$pdf->RotateImageOutput($firstImagePath, $posX, $posY, $posW, $posH, $rotation);	
											$pdf->RotateEpsColorableOutput($designImgSource, $posX, $posY, $posW, $posH, $rotation, $txtColor);
										}
										}
										else	
										{
									//	echo "<br>";echo "<br>";echo "<br>";echo "<br>";	
										$designImgSource = str_replace('.png' , '.eps' , $designImgSource);
										if(!file_exists($designImgSource)){
											$designImgSource = str_replace('.eps' , '.png' , $designImgSource);

											$pdf->RotateImageOutput($designImgSource, $posX, $posY, $posW, $posH, $rotation);
										}else{
						
										$num=rand();
								   $firstImagePath = $designDirName . "/".$num.".png";
						//-channel RGBA -colorspace RGB -background none
								   exec(IMAGEMAGICPATH." -density 300  -channel RGBA -colorspace RGB -background none -fill none -dither None  ".$designImgSource." -resize '".$posW."'x'".$posH."'! $firstImagePath");			
									
								  $pdf->RotateImageOutput($firstImagePath, $posX, $posY, $posW, $posH, $rotation);	 //echo $designImgSource.", ".$posX.", ".$posY.", ".$posW.", ".$posH.", ".$rotation.", ".$txtColor;
				//echo "<br>";echo "<br>";echo "<br>";echo "<br>";
										
							//	$pdf->RotateEpsOutput($designImgSource, $posX, $posY, $posW, $posH, $rotation);
										}
											
										}
										$l++;
										}
										
									}// User Clipart
									
                                    } // end clipart and userimage
                                    $num++;
                                }
                                
                                $pdffileprodu = $designDirName1 . "/" . $pdfFileName;

                         

                            $pdf->Output($pdffileprodu);

                            $productionPng = str_replace('.pdf', '.png', $pdffileprodu);

                            exec('"' . IMAGEMAGICPATH . '" "' . $pdffileprodu . '" -transparent white "' . $productionPng . '"');

                            $productionzipfile[] = $productionPng;
                            $productionzipfile[] = $pdffileprodu;

                            // @unlink($pdffileprodu);

                         //   @rmdir($designDirName);
                            }

                        



                             
                     $printInc++;   
                    } // ending encoded data 
					    
                }
            

            $fileName = _PDF_ . $productionPDF . "/" . $oid . "_" . $pid . "_" . $colorId . ".zip";
            $fd = fopen($fileName, "wb");

            $createZip = new ZipFile($fd);
            foreach ($productionzipfile as $filzip) {
                $zipfileName=substr($filzip,strrpos($filzip,"/")+1); 
                $createZip->addFile($filzip, $zipfileName, true);
            }
            $createZip->close();


            $productZip = $oid . "_" . $pid . "_" . $colorId;

	      
            $this->db->query("INSERT INTO  " . DB_PREFIX . "order_product_pdf set  order_id = '" . $oid . "' , product_id = '" . $pid . "' , zipname='".$productZip."'");
       
	      $deleteurl=
		  $this->url->link('rawproduct/generatepdf/Pdfdelete', 'token=' . $this->session->data['token'] . '&pId=' . $pid. '&orderId=' .  $oid. '&zipname=' .  $productZip, '');
          
		    echo  "<a href='".PDFPRODUCTION.$productZip.".zip'>Download Output</a> &nbsp; 
              <a href='javascript:void(0);' data-hrefs='".$deleteurl."'  onclick=\"deletePDF('PDF_".$oid.$pid."','DPDF_".$oid.$pid."')\" id='DPDF_".$oid.$pid."'>Delete </a>";
       
            exit;
        }
    }
}
?>