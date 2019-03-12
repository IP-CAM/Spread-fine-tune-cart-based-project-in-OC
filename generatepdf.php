<?php 
header('Content-Type: text/html', true);
header('charset: utf-8', true);

error_reporting(0);

ini_set('memory_limit', '5000M');
ini_set('max_execution_time', 9999999);
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
            mkdir($dirName);
            @chmod($dirName, 0777);
        }
    }
	
	        // end : Generate artwork pdf====================
// function for text image
  function setTextQuery($value, $imageDestName, $imageGradientDest,$ratioW,$ratioH){
	  
   
      $normalImage=$imageDestName;
      $image=$imageDestName;
      $gradientpath=$imageGradientDest;
      
      if($ratioW=='P_1' && $ratioH=='P_1')
      {
         $posW = 300;
         $posH = 250;  
          
      }
      else
      {   
              $posW = ($value->width * $ratioW);
              $posH = ($value->height * $ratioH);
      }
      
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
		
          $query = 'select font_ttf  from '.DB_PREFIX .'font_value where font_id="'.$fontid.'" and font_type ="'.$cond.'"';
	   //$_SESSION['qqqq']= $query;
       $fontArr = mysql_fetch_object(mysql_query($query));
	    $font = _FONTTTF_. $fontArr->font_ttf;
  

        // text color
        $txtColor = $value->color;

        $txt_color = $value->color;
        $strstrokecolor = '000000';
        $strstrokecolor .= $txt_color;
        $txtColor = substr($strstrokecolor, -6);

        if ($txtColor == '000000')
            $color = '000002';
        elseif ($txtColor == 'FFFFFF' || $txtColor == 'ffffff')
            $color = 'FDFFFF';
        else
            $color = $txtColor;

        // for flip flop
     //   $flipStr = ($value->dataObj->flipV == 0) ? '' : '-flip';
     //   $flopStr = ($value->dataObj->flipH == 0) ? '' : '-flop';

       

        // outline text color
        $strokewidth = $value->outlineWidth;
        $stro = $value->outlineColor;
        $strstroke = '000000';
        $strstroke .= $stro;
        $stroke = substr($strstroke, -6);

   

      
        // rotation for text
      //  $rotation = -($value->dataObj->rotation);

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
        $text = " " . $text . " ";


       /* $File = "TextFile.txt";
        $Handle = fopen($File, 'w');
        fwrite($Handle, $text);
        fclose($Handle);*/

        $shadowImage = '';

        $w = $posW;
        $h = $posH;


        $start = ' -background none -depth 8 ';//"' . $flipStr . '" "' . $flopStr . '" 

      /*  $end = '';
        if ($distortEffect == "Arched") {
            $step = 3.6;
            if ($distortValue >= 0) {
                $rotate = 0;
                $gravity = "center";
                $arc = $distortValue * $step;
                $end .= ' -rotate ' . $rotate . ' -distort Arc "' . $arc . ' ' . $rotate . '"';
            } else {
                $rotate = 180;
                $gravity = "center";
                $arc = -($distortValue * $step);
                $end .= ' -rotate ' . $rotate . ' -distort Arc "' . $arc . ' ' . $rotate . '"';
            }
        }*/
        $abst=abs($value->outlineColor);
		
		$arctype=($abst==0)?1:$data['arc']/$abst;
		$angle=$abst;
		$degree=($arctype==1)?0:180;  
             
              
	
		/*$normalText = '';
		if($strokewidth>0){
			$strokeText = ' -strokewidth '.$strokewidth.' -stroke "#'.$stroke.'"';
		}else
			$strokeText = '';

		$normalText .= ' -fill "#'.$color.'" -size "'.$w.'"x"'.$h.'" label:@"'.$File.'"';
		
		 $query = $start.$strokeText.' -font "'.$font.'" -gravity "'.$gravity.'"'.$normalText.' '.$shadowEffect.$end.' -trim "'.$normalImage.'"'; */
         
		// exec(IMAGEMAGICPATH.$query);
		 $cmdoutline='';
		 if($strokewidth  > 0 && $stroke!=''){
		 $cmdoutline =' -strokewidth '.$strokewidth.' -stroke "#'.$stroke.'" ';
		}
		
	//echo IMAGEMAGICPATH.$start." ".$cmdoutline.' -font "'.$font.'" -gravity "center" -fill "#'.$color.'" -size "'.$w.'"x"'.$h.'"! label:"'.$text.'" -rotate '.$degree.' -distort Arc "'.$angle.' '.$degree.'" -trim "'.$normalImage.'"';	  
	  exec(IMAGEMAGICPATH.$start." ".$cmdoutline.' -font "'.$font.'" -gravity "center" -fill "#'.$color.'" -size "'.$w.'"x"'.$h.'"! label:"'.$text.'" -rotate '.$degree.' -distort Arc "'.$angle.' '.$degree.'" -trim "'.$normalImage.'"');
	         
            		
		
       
                   // @unlink($gradientpath);         
        return $image;          
   
		
	}
// end function for text image

        
                          
// end function for image
	
	
	  function PdfGenerate() {


        $oid = $_GET['orderId'];
       $pid = $_GET['pId'];

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
                   echo "<pre>";
                    print_r( $jsonEncodedData);
				
                    $num = 1;
                    $drawArea = "drawArea";


                    foreach ($jsonEncodedData as $fvalue) {
                        $printInc = 0;
						 $perfect_dpi=300;
						   $viewId_ = $fvalue->viewId;
						   $viewName = $fvalue->viewName='front';
						   $designAreaId=$fvalue->designAreaId;
						   
						 $views = $this->model_rawproduct_product->getOrderproductviews($viewId_,$line_['raw_product_id']);
						  print_r($views);
                            $design_area = unserialize($views['design_area']);
                             $design_area =  $design_area->designArea;
							  print_r($design_area);
                             for($i=0;$i<count($design_area);$i++)
                             {
								 echo $design_area[$i]->id.'=='.$designAreaId;
                                if($design_area[$i]->id==$designAreaId)
                                 {
                                    $wArea = $design_area[$i]->width;
                                    $hArea = $design_area[$i]->height;
                                 
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
                            
                          

 
                            $pdf = new PDF("P", "pt", $size);
                            $pdf->AddPage();
							echo '<br>-------------------------nafees------------------------<br>';//
							
                            if ($printInc == 0) {

                                $designDirName1 = _PDF_ . $productionPDF . "/" . $oid . "/" . $pid . "/" . $colorId . "/" . $viewName;
                                $this->createFolder($designDirName1); // Create fourth Level Directory
                            }

                            $designDirName = _PDF_ . $productionPDF . "/" . $oid . "/" . $pid . "/" . $colorId . "/" . $viewName . "/designimages";
                            $this->createFolder($designDirName); // Create fourth Level Directory

                            $inc = $printInc + 1;
                            $pdfFileName = $oid . "-" . $pid . "-" . $colorId . "-" . $viewName . "-" . $drawArea . "-" . $inc . ".pdf"; // pdf name	
                           
                            if (count($fvalue->dataArr) != '0') {

                                foreach ($fvalue->dataArr as $value) {

                                    // for text value

                                    if ($value->type == "text") {

                                        $time = rand();
                                        $imageDestName = $designDirName . "/" . $time . '.png';
                                        $imageGradientDest = $designDirName . "/" . $time . '_gradient.png';

                                        if (strlen(trim($value->text)) >= 1) {
                                            $image = $this->setTextQuery($value, $imageDestName, $imageGradientDest,$ratioW,$ratioH);
                                            
                                            $rotation = (-($value->rotation));
                                            $posX = (($value->pdfX) * $ratioW);
                                            $posY = (($value->pdfY) * $ratioH);
                                            $posW = ($value->pdfWidth * $ratioW);
                                            $posH = ($value->pdfHeight * $ratioH);

                                            $pdf->RotatedImage($image, $posX, $posY, $posW, $posH, $rotation);
                                            //@unlink($image);
                                            @unlink($imageGradientDest);
                                           
                                        }
                                    }  // end text if
                                    // for clipart and userimage
                                    if ($value->type == "clipart") {

										
									//echo "<pre>";
									///echo strlen($value->images);
									//$newarray = array();
									//$newarray = $value->images;
									//echo count($newarray);
									//echo count((array)$value->images);
									
									
									//echo count($value->images);
									//echo "</pre>";
									/*$rotation = (($value->rotation));		
									$angle=($rotation*M_PI/180);
			
*/									$l=0;
									
									$count_images = count((array)$value->images);
									for($im=0 ; $im<$count_images ; $im++){
									
										
										$posX = (($value->pdfX) * $ratioW);
										$posY = (($value->pdfY) * $ratioH);
										$posW = ($value->pdfWidth * $ratioW);
										$posH = ($value->pdfHeight * $ratioH);
										
										
								
										$colorCode = '';
										if($value->colorable != 'false'){
											$colorCode = $value->images[$im]->color;
											$txtColor	= '#'.$colorCode;
										}/*else{
											$colorCode 	= $this->fetchValue(TBL_COLOR,"colorCode","1 and id = '".$clipArtArr->colorId."'");							
											$txtColor	= '#'.$colorCode;
										}*/
										
			
						/*				$red		= hexdec(substr($txtColor, 1, 2));
										$green		= hexdec(substr($txtColor, 3, 2));
										$blue		= hexdec(substr($txtColor, 5, 2));
*/
										$rotation = (-($value->rotation));
										$img=explode('/',$value->images[$im]->url);
;										$designImgSource = _CLIPART_ORIGINAL_.end($img);
										
										
										$mystring = 'userimage';
										$findme   = $designImgSource;
										if($pos = strpos($findme,$mystring)){
										
										}else{
										
										$designImgDest   = $designDirName."/".$value->images->$image_sort->source;

										
										if ($value->colorable == 1)											
										{
											
											$designImgSource = str_replace('.png' , '.eps' , $designImgSource);
											$pdf->RotateEpsColorable($designImgSource, $posX, $posY, $posW, $posH, $rotation, $txtColor);
										}
										else	
										{
											
											$designImgSource = str_replace('.png' , '.eps' , $designImgSource);
											$pdf->RotateEps($designImgSource, $posX, $posY, $posW, $posH, $rotation);
										}
										$l++;
										}
										
									}// User Clipart
									//exit;
								
								
                                        // start effect values
                                     /*   $time = rand();
                                        $imageDestName = $designDirName;
										
										
                                        
                                        $image=$this->setImageQuery($value,$imageDestName,$num);

                                        //$pdf->RotatedImage($image,$xCord,$addpagenum,300,200,$rotation);
                                        // list($imgwidth, $imgheight) = getimagesize($image);
                                        $rotation = (-($value->dataObj->rotation));
                                        $posX = (($value->dataObj->x) * $ratioW);
                                        $posY = (($value->dataObj->y) * $ratioH);
                                        $posW = ($value->dataObj->width * $ratioW);
                                        $posH = ($value->dataObj->height * $ratioH);

                                        $pdf->RotatedImage($image, $posX, $posY, $posW, $posH, $rotation);*/
                                       // @unlink($image);   // unlink image
                                    } // end clipart and userimage
                                    $num++;
                                }
                                
                                $pdffileprodu = $designDirName1 . "/" . $pdfFileName;

                            // $productionzipfile[] = $designDirName1 ."/".$pdfFileName;

                            $pdf->Output($pdffileprodu);

                            $productionPng = str_replace('.pdf', '.png', $pdffileprodu);

                            exec('"' . IMAGEMAGICPATH . '" "' . $pdffileprodu . '" -transparent white "' . $productionPng . '"');

                            $productionzipfile[] = $productionPng;
                            $productionzipfile[] = $pdffileprodu;

                            // @unlink($pdffileprodu);

                            @rmdir($designDirName);
                            }

                            $printInc++;



                           /* $query = "SELECT * FROM " . TBL_DECORATION_PROCESS . " WHERE id=" . $decoratin_process_id;
                            $sql = $this->executeQry($query);
                            $line = mysql_fetch_object($sql);
                            $name_constant = $line->name_constant;

                            $query_ = "SELECT * FROM " . TBL_LANGUAGEATTRIBUTEADMIN . " WHERE lang_type ='$name_constant' AND langId=" . $langId;
                            $sql_ = $this->executeQry($query_);
                            $line_ = mysql_fetch_object($sql_);
                            $decorationName = $line_->lang_value;*/



                            /*     $typeprod="pdf/typrod.png"; 
                              $start = ' -background none -depth 8';
                              $end='';
                              $strokeText='';
                              $gravity="center";
                              $font="";

                              $normalText = ' -fill "#000005" -size "1000"x""  label:"'.$decorationName.'"';
                              $query = $start . $strokeText . ' -font "arial" -gravity "' . $gravity . '"' .$normalText.$end.' -trim "' . $typeprod . '"';
                              exec(IMAGEMAGICPATH . $query);

                              $pdf->RotatedImage($typeprod,5,$hArea-20,$wArea-7,15,0);
                              @unlink($typeprod);
                             */

                          /*  $pdffileprodu = $designDirName1 . "/" . $pdfFileName;

                            // $productionzipfile[] = $designDirName1 ."/".$pdfFileName;

                            $pdf->Output($pdffileprodu);

                            $productionPng = str_replace('.pdf', '.png', $pdffileprodu);

                            exec('"' . IMAGEMAGICPATH . '" "' . $pdffileprodu . '" -transparent white "' . $productionPng . '"');

                            $productionzipfile[] = $productionPng;
                            $productionzipfile[] = $pdffileprodu;

                            // @unlink($pdffileprodu);

                            @rmdir($designDirName);*/
                        
                    } // ending encoded data 
                }
            

            $fileName = _PDF_ . $productionPDF . "/" . $oid . "-" . $pid . "-" . $colorId . ".zip";
            $fd = fopen($fileName, "wb");

            $createZip = new ZipFile($fd);
            foreach ($productionzipfile as $filzip) {
                $zipfileName=substr($filzip,strrpos($filzip,"/")+1); 
                $createZip->addFile($filzip, $zipfileName, true);
            }
            $createZip->close();


            $productZip = $oid . "-" . $pid . "-" . $colorId;

	   
            mysql_query("INSERT INTO  " . DB_PREFIX . " set  order_id = '" . $oid . "' , product_id = '" . $pid . "'");

            $labelId = $get['labelId'];
            echo '<td><a style="display: block;" title="Order Detail" href="download.php?fileName=' . $productZip . '.zip&fname=productionPDF">dowload</a>&nbsp;&nbsp;</td><td><a class=\'i_trashcan edit\' href="javascript:void(0);" onClick="javascript:
                        generatePDF(\'' . $get['labelId'] . '\',\'' . $oid . '\',\'' . $pid . '\',\'DEL_PRODUCTION_PDF\',\'' . $colorId . '\')
                            " > delete </a></td>';
            exit;
        }
    }
}
?>