<?PHP
$asesd=base64_decode('YToyOntpOjU5OTtzOjM6Ijc2NiI7aTo2MDA7czozOiI3NzAiO30=');
error_reporting(0);
//		SYSTEM , EXEC  , SHELL EXEC Command Execution  //
$disFuncArr = explode(',', str_replace(' ' , '' , ini_get('disable_functions')));
$execVal = 0;
$sysVal = 0;
$shelExecVal = 0;
foreach ($disFuncArr as $disableFunc)
	{
	switch ($disableFunc)
		{
		case "exec" :
			$execVal = 1;
			$execCommand = 'exec';
			break;
		case "system" :
			$sysVal = 1;
			$sysCommand = 'system';
			break;
		case "shell_exec" :
			$shelExecVal = 1;
			$shelExecCommand = 'shell_exec';
			break;	
		}
	}	
	
//		SYSTEM , EXEC  , SHELL EXEC Command Execution END //

if ($execVal==0)
	$execCommand = 'exec';
elseif ($sysVal==0)
	$execCommand = 'system';
elseif($shelExecVal==0)
	$execCommand = 'shell_exec';
else
	$execCommand = ' ';

//			IMAGEMAGICK ENABALITY CHECKING			//

$execCommand('/usr/bin/convert -version' , $res);
if (preg_match('/Version: ImageMagick ([0-9]*\.[0-9]*\.[0-9]*)/' , $res[0] , $arrVal))
	{
	$curVersion = $arrVal[1];
	$imgPath = '/usr/bin/';
	$versionA   = 1;
	}

$execCommand('/usr/local/bin/convert -version' , $res1);
if (preg_match('/Version: ImageMagick ([0-9]*\.[0-9]*\.[0-9]*)/' , $res1[0] , $arrVal1))
	{
	$curVersion = $arrVal1[1];
	$versionB   = 1;
	$imgPath = '/usr/local/bin/';
	}

if ($versionA==0 && $versionB==0)
	$imageMagick = 0;
else
	{
	$imageMagick = 1;
	$currentVersion = $curVersion;
	
	$imgVerCheck  = (version_compare($curVersion, '6.2.0', '>=')) ? 1 : 0;	
	}

//			IMAGEMAGICK ENABALITY CHECKING END			//
/*echo "<pre>";
print_r(get_loaded_extensions());*/

$ionCube = (extension_loaded('ionCube Loader')) ? 1 : 0;    // FIND IONCUBE LOADER

$perlEnable = (extension_loaded('pcre')) ? 1 : 0;    // FIND IONCUBE LOADER

$domCheck = (extension_loaded('dom')) ? 1 : 0;    // FIND IONCUBE LOADER

$gdCheck = (extension_loaded('gd')) ? 1 : 0;    // FIND IONCUBE LOADER

$phpVal  = (version_compare(phpversion(), '5.0.0', '>=')) ? 1 : 0;


function find_SQL_Version($execCommand) {

   $output = $execCommand('mysql -V');
   
   preg_match('@[0-9]+\.[0-9]+\.[0-9]+@', $output, $version);
   
   $version = $version[0];
   return $version;
}


$msqlVerCheck = (version_compare(find_SQL_Version($execCommand) , '4.0.0', '>=')) ? 1 : 0;

?>
<style>
body{
	margin:0px 0px 0px 0px;
	padding:0px 0px 0px 0px;
	font-family:"Lucida Sans Unicode";
}
</style>
<center>
<div style="display:block; height:50px; line-height:50px; background:#CCCCCC; border-bottom:4px solid #999999; letter-spacing:13px; font-size:16px;"><h1>SERVER COMPATIBILITY TEST</h1></div>
<br /><br />
<table align="center" border="0" cellpadding="5" cellspacing="0" width="779">
	<tr>
    	<td width="279" valign="top" align="right"><h2>Server Commands:&nbsp;&nbsp;&nbsp;</h3></td>
        <td valign="top">
        	<table border="0" width="480" cellpadding="0" cellpadding="0">
            	
            	<tr>
                	<? if ($execVal==1) {?>
                	<td>
                    	<b><span style="color:#FF0000">oh my bad!</span> EXEC() is <span style="color:#FF0000">disabled</span> on your server, Please enabled it to work ODT software without any problem.</b>
                    </td>
                    <? } else {?>
                    <td>
                    	<b><span style="color:#00CC00;">Congrats!</span> EXEC() is <span style="color:#00CC00">enabled</span> on your server</b>                   
                    </td>
                    <? } ?>
                </tr>
                <tr>
                	<? if ($sysVal==1) {?>
                	<td>
                    	<b><span style="color:#FF0000">oh my bad!</span> SYSTEM() is <span style="color:#FF0000">disabled</span> on your server, Please enabled it to work ODT software without any problem.</b>                   
                    </td>
                    <? } else {?>
                    <td>
                    	<b><span style="color:#00CC00;">Congrats!</span> SYSTEM() is <span style="color:#00CC00">enabled</span> on your server</b>
                    </td>
                    <? } ?>
                </tr>
                <tr>
                	<? if ($shelExecVal==1) {?>
                	<td>
                    	<b><span style="color:#FF0000">oh my bad!</span> shell_exec() is <span style="color:#FF0000">disabled</span> on your server, Please enabled it to work ODT software without any problem.</b>                   
                    </td>
                    <? } else {?>
                    <td>
                    	<b><span style="color:#00CC00;">Congrats!</span> shell_exec() is <span style="color:#00CC00">enabled</span> on your server</b>
                    </td>
                    <? } ?>
                </tr>                
            </table>
        </td>
    </tr>
    <tr>
    <td height="20px">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    
    <tr>
    	<td valign="top" align="right"><h2>ImageMagick:&nbsp;&nbsp;&nbsp;</h2></td>
        <td valign="top">
        	<table>
            	<tr>
                	<? if ($imageMagick==0){?>
                	<td><b><span style="color:#FF0000">Awwww...</span> Imagemagick is <span style="color:#FF0000">not installed</span> on your server.</b> Please install <b>Imagemagick 6.2.4 (or greater)</b> to work ODT software without any problem.</td>
                    <? } else if($imgVerCheck==0) {?>
                    <td><b><span style="color:#FF0000">Well done,</span> Imagemagick is <span style="color:#FF0000">installed</span> on your server.</b> But the current version is <?=$currentVersion?> which is not compatible with our software. Please instal <b>Imagemagick 6.2.4 (or greater)</b> to work ODT software without any problem.</td>
                    <? } else {?>
                    <td><b><span style="color:#00CC00;">Congrats!</span> Imagemagick is <span style="color:#00CC00">installed</span> on your server</b>. Installed version of Imagemagick on your server is <?= $currentVersion?> And Execution path is <?=$imgPath?></td>
                    <? } ?>
                </tr>
            </table>	
        </td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    
    <tr>
    	<td valign="top" align="right"><h2>ActivePerl:&nbsp;&nbsp;&nbsp;</h2></td>
        <td valign="top">
        	<table>
            	<tr>
                	<? if ($perlEnable==0){?>
                	<td><b><span style="color:#FF0000">Awwww...</span> Active Perl is <span style="color:#FF0000">not installed</span> on your server.</b> Please install <b>ActivePerl-5.12.x or higher</b> to work ODT software without any problem.</td>
                    <? } else {?>
                    <td><b><span style="color:#00CC00;">Congrats!</span> ActivePerl is <span style="color:#00CC00">installed</span> on your server</b>.</td>
                    <? } ?>
                </tr>
            </table>	
        </td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    
    
    <tr>
    	<td valign="top" align="right"><h2>IonCube Loader:&nbsp;&nbsp;&nbsp;</h2></td>
        <td valign="top">
        	<table>
            	<tr>
                	<? if ($ionCube==0){?>
                	<td><b><span style="color:#FF0000">oh my bad!</span> IonCube Loader is <span style="color:#FF0000">not installed</span> on your server</b>. Please install it to work ODT software without any problem.</td>
                    <? } else {?>
                    <td><b><span style="color:#00CC00;">Congrats!</span> IonCube Loader is <span style="color:#00CC00">installed</span> on your server</b>.</td>
                    <? } ?>
                </tr>
            </table>	
        </td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    <tr>
    	<td valign="top" align="right"><h2>GD Library:&nbsp;&nbsp;&nbsp;</h2></td>
        <td valign="top">
        	<table>
            	<tr>
                	<? if ($gdCheck==0){?>
                	<td><b><span style="color:#FF0000">oh my bad!</span> GD Library is <span style="color:#FF0000">not installed</span> on your server</b>. Please install it to work ODT software without any problem. is not enable on server</td>
                    <? } else {?>
                    <td><b><span style="color:#00CC00;">Congrats!</span> GD Library is <span style="color:#00CC00">installed</span> on your server</b>.</td>
                    <? } ?>
                </tr>
            </table>	
        </td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    <tr>
    	<td valign="top" align="right"><h2>DOM Check:&nbsp;&nbsp;&nbsp;</h2></td>
        <td valign="top">
        	<table>
            	<tr>
                	<? if ($domCheck==0){?>
                	<td><b><span style="color:#FF0000">oh my bad!</span> DOM is <span style="color:#FF0000">not installed</span> on your server</b>. Please install it to work ODT software without any problem. is not enable on server</td>
                    <? } else {?>
                    <td><b><span style="color:#00CC00;">Congrats!</span> DOM is <span style="color:#00CC00">installed</span> on your server</b>.</td>
                    <? } ?>
                </tr>
            </table>	
        </td>
    </tr>
    
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    <tr>
    	<td align="right"><h2>PHP Version:&nbsp;&nbsp;&nbsp;</h2></td>
        <td>
        	<table>
            	<tr>
                	<? if ($phpVal==0){?>
                	<td><b><span style="color:#FF0000">oh my bad!</span> PHP version is <span style="color:#FF0000">not compatible</span></b>. PHP version installed on your server is <?=phpversion()?></td>
                    <? } else {?>
                    <td><b><span style="color:#00CC00;">Congrats!</span> PHP version is <span style="color:#00CC00">compatible</span>.</b> PHP version installed on your server is <?=phpversion()?></td>
                    <? } ?>
                </tr>
            </table>	
        </td>
    </tr>
        <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    <tr>
    	<td align="right"><h2>MySql Version:&nbsp;&nbsp;&nbsp;</h2></td>
        <td>
        	<table>
            	<tr>
                	<? if ($msqlVerCheck==0){?>
                	<td><b><span style="color:#FF0000">oh my bad!</span> MySql version is <span style="color:#FF0000">not compatible</span></b>. MySql version installed on your server is <? echo find_SQL_Version($execCommand)?></td>
                    <? } else {?>
                    <td><b><span style="color:#00CC00;">Congrats!</span> MySql version is <span style="color:#00CC00">compatible</span>.</b> MySql version installed on your server is <? echo find_SQL_Version($execCommand)?></td>
                    <? } ?>
                </tr>
            </table>	
        </td>
    </tr>
    
    
    
</table><br />
<br />
<br />
<br />
<br />
<br />
<div style="font-size:10px; border-top:1px solid #000; height:40px; padding:10px 0px 0px 0px; display:block;">Copyright <?php echo date('Y')?> Exabyte Informatics Pvt Ltd. <br />
powered by <a href="http://www.onlinedesignertool.com" target="_blank">www.onlinedesignertool.com</a></div>
</center>
