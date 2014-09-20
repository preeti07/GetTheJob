<?php 
	require('common/connection.php');
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
	$seeker_name	= $_POST['seeker_name'];  
	$seeker_email	= $_POST['seeker_eamil'];  

?>

	<form method="post" action="contact.php">
	To: 

<?php 
	echo $seeker_name; 
	echo "( ".$seeker_email." )";
?> 
	
	<br/><br />

	<label for="subject">Subject</label> <br />
	<input type="text" id="subject" name="subject" size="50" /><br /><br />

	<label for="messege">Message</label> <br />
	<textarea  id="message" name="message" cols="40" rows="10" /></textarea><br /><br />

	<input type="hidden" name="employer_id" value="<?php echo $employer_id; ?>">
	<input type="hidden" name="seeker_email" value="<?php echo $seeker_email; ?>">

	<input type="submit" value="SEND" name="submit" />
	</form>



</body>
</html>