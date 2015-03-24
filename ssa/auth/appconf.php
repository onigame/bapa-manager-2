<?php session_start();

require_once('../../load_ini.php');

/*==========================================*\
|| ##########################################||
|| # SONHLAB.com - SONHlab Social Auth v2 #
|| ##########################################||
\*==========================================*/


if ( $_SESSION['app'] == 'facebook' ) { // Facebook App

	// App ID
	$_SESSION['fb_appid'] = $inifile[FACEBOOKID];
	// App Secret
	$_SESSION['fb_appsecret'] = $inifile[FACEBOOKSECRET];
	
}
elseif ( $_SESSION['app'] == 'twitter' ) { // Twitter App

	// Consumer Key
	$_SESSION['tt_key'] = '<replace-your-consumer-key-here>';
	// Consumer Secret
	$_SESSION['tt_secret'] = '<replace-your-consumer-secret-here>';

}
elseif ( $_SESSION['app'] == 'google' ) { // Google App
	
	// Client ID
	$_SESSION['gg_appid'] = $inifile[GOOGLEID];
	// Client Secret
	$_SESSION['gg_appsecret'] = $inifile[GOOGLESECRET];
	
}
