<?php 
require('../common/config.inc.php');

 ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{ 
require ('../common/mysqli_connect.php');
date_default_timezone_set('NZ');
require_once('PHPMailer_5.2.4/class.phpmailer.php'); 
	  
	  //if(isset($_POST['job_alert_submit_button']))
	 // {
	  $name = $_POST['job_alert_user_name'];
	  $email_for_job_alert = $_POST['job_alert_user_email'];
	  echo $name."<br>";
	  echo $email_for_job_alert;
	  $query = "select seeker_id from job_seeker where email_id = '$email_for_job_alert'";
	  $number_of_rows = mysqli_query ($dbc, $query) or trigger_error("Query: $query\n<br />MySQL Error: " . mysqli_error($dbc));
	  if(mysqli_num_rows($number_of_rows) == 1)
	  {
		  echo "yes found one";
	  }
	  else if(mysqli_num_rows($number_of_rows) == 0)
	  {
		  $email = new PHPMailer();
		  $body = "it is a test email with attachments";
		 // $body .= file_get_contents('emails/cv_submission_email.html');
		  
		  $email->AltBody = "To view this message please use an HTML compatible email viewer, or visit http://mysite.com/emailcampaign"; // give folks who can't read HTML email something to read
			$email->From      = 'noreply@getthejob.co.nz';
			$email->FromName  = 'Getthejob';
			$email->Subject   = 'Job Alert email from getthejob.co.nz';
			$email->WordWrap = 80;
			//$email->AddBCC("xxx@xxxx.com","Name 1");
			//$email->AddReplyTo("dsdf@df.fddf");
		   // $email->Body      = $bodytext;
		 //  $email->AddEmbeddedImage("images/logo.jpg", "logo-attach", "logo.jpg");
		 //  $email->AddEmbeddedImage("images/Carnie_Recritment_Tagline_2.jpg", "tagline-attach", "Carnie_Recritment_Tagline_2.jpg");
		   $email->MsgHTML($body);
			
			$email->AddAddress($email_for_job_alert);
			if(!$email->Send())
			echo "fail";
			else
			echo "successful";
	  }
	  else if (mysqli_num_rows($number_of_rows) > 1)
	  {
		echo "oohh some internal error";  
	  }
	  
	 /* }
	  else
	  {
	  echo "not set";	
	  }*/
}
else {
	header("location:http://localhost:8000/getthejob/index.php");
	exit();
	}
?>

</body>
</html>