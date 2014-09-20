<?php 
	require('../common/connection.php');
	date_default_timezone_set('NZ');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Employer-Contact Applicant</title>
	<link href="css/formtt.css" rel="stylesheet" type="text/css" />
</head>

<body>

<?php


	$employer_id	= $_POST['employer_id'];
	$seeker_email	= $_POST['seeker_email'];
	$subject=$_POST['subject'];
	$message=$_POST['message'];



	/* Get the employer's email address */

	$conn = new createConnection();
	$conn->connectToDatabase();
	$conn->selectDatabase();	

	$sql = "SELECT EmailForApplication, AGENT_COMPANY_NAME from employer_agent_company where EMPLOYER_ID = $employer_id";

	var_dump($sql);

	$result = $conn->queryDatabase($sql);
	$employer_email = mysql_fetch_assoc($result['EmailForApplication']); 
	$employer_name = mysql_fetch_assoc($result['AGENT_COMPANY_NAME']); 

	$conn->closeConnection();


	/* Makign email contents */

	$to=$seeker_email;
	$subject="[Get-The-Job: ".$employer_name."] ".$subject;
	$message=
		"\n\n".
		"This email is from the Get-The-Job web site\n".
		"============================================================\n".
		"[From] \n\n".
		" Company (Agent) Name: $employer_name\n\n".
		" Employer Email: $employer_email\n\n".
		"============================================================\n".
		"[Message] \n\n".
		"$message\n".
		"============================================================\n";


	$headers = 
		'From: '.$employer_email."\r\n".
		'Reply-To: '.$employer_email."\r\n";

	mail($to,$subject,$message,$headers);   

?>

	Email has been sent succussfully.
	

</body>
</html>