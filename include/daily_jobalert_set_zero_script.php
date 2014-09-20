<?php
date_default_timezone_set('NZ');
include_once"../common/mysqli_connect.php";
require_once('PHPMailer_5.2.4/class.phpmailer.php'); 
 mysqli_query($dbc, "UPDATE job_alert SET is_received='0' ");
 
?>