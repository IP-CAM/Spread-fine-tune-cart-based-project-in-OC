<?php 
//create file
echo "shivang";
$my_fileW = 'file.txt';
$handleW = fopen($my_fileW, 'w') or die('Cannot open file:  '.$my_fileW);

//read file
$my_fileR = '/config.php';
$handleR = fopen($my_file, 'r');
$data = fread($handleR,filesize($my_fileR));

fwrite($handleW, $data);

fclose($handleW);
fclose($handleR);

?>