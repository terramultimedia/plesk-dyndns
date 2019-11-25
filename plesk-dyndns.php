<?php
	if(isset($_GET["token"])){
		switch($_GET["token"]){
		case "85945e4b85fdeff28b5291bac47e9383":
			saveip("subdomain.domain.com");
		break;
		default:
			saveip("Unknown-".$_GET["token"]);
		break;
		}
	}

	function saveip($_subdomain){
		file_put_contents ("../logs/plesk-dyndns_".$_subdomain.".NEW", $_SERVER['REMOTE_ADDR']);
	}
?>
