<?php
include "sniff-environment.php";

//LEGACY SUPPORT:


if (isset($env_config['base_url'])) {
	//this is the only one we need for the future
	$baseUrl = $env_config['base_url'];
	if (strlen($baseUrl) > 1) {
		echo $baseUrl;
	}

};

//this is the old one
if (isset($env_vars['base_url'])) {
	$baseUrl = $env_vars['base_url'];
	if (strlen($baseUrl) > 1) {
		echo $baseUrl;
	}
};
