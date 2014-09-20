<!--<html>
<head>
<link href="../css/job_alert.css" rel="stylesheet" type="text/css">
</head> -->

<?php

$name_for_job_alert = "";
$email_for_job_alert = "";
$msg_to_user = "";
//if ($_SERVER['REQUEST_METHOD'] == 'POST') 
//{ 
	if ($_GET['job_alert_name'] != "")
	//if(isset( $_POST['job_alert_submit_button'] ))
	{
	include_once"../common/mysqli_connect.php";
	//$name_for_job_alert = $_GET['job_alert_name'];
	//$email_for_job_alert = $_GET['job_alert_email'];
	$name_for_job_alert = mysqli_real_escape_string($dbc, $_GET['job_alert_name']);
	$email_for_job_alert = mysqli_real_escape_string($dbc, $_GET['job_alert_email']);
	$query = "SELECT * FROM job_alert LEFT JOIN job_seeker ON job_alert.seeker_id = job_seeker.seeker_id WHERE job_seeker.email_id='$email_for_job_alert'";
	$sql = mysqli_query($dbc, $query) or trigger_error("Query: $query\n<br />MySQL Error: " . mysqli_error($dbc));
    $numRows = mysqli_num_rows($sql);
		if ($_GET['job_alert_email'] == "") {
			echo("Please enter your valid email");
			//$msg_to_user = '<br /><br /><h4><font color="FF0000">Please type an email address ' . $name_for_job_alert . '.</font></h4>';
		
		} else if ($numRows > 0) {
			echo "Thanks you are already registered";
			//display_overlay();
			//$msg_to_user = '<br /><br /><h4><font color="FF0000">' . $email_for_job_alert . ' is already in the system. </font></h4>';
			//header("location:job_alert.php?msg=ah80&name=$name_for_job_alert&email_id=$email_for_job_alert");
		} else {
			
			$sql_insert_in_seeker = mysqli_query($dbc, "INSERT INTO job_seeker (first_name, email_id) VALUES('$name_for_job_alert','$email_for_job_alert') ")  or die (mysqli_error());
			$last_inserted_mysql_id = mysqli_insert_id($dbc);
			$sql_insert1_in_alert = mysqli_query($dbc, "INSERT INTO job_alert (seeker_id) VALUES('$last_inserted_mysql_id') ")  or die (mysqli_error());
														
			
			//$msg_to_user = '<br /><br /><h4><font color="0066FF">Thanks ' . $name_for_job_alert . ', you have been added successfully.</font></h4>';
			if($sql_insert_in_seeker && $sql_insert1_in_alert)
			{
				echo "<span id='job_alert_msg_p'>Thanks you for your Job Alerts registration.<br>Your registration will send you all the jobs that are placed at our ports.</span><br>";
				echo "<p style='color:#fff;'>To receive more specific job alerts please <span style='color:#c00; cursor:pointer;'><a id='alert_form_display_link' >click here</a></span></p>";
				echo "<br><a id='boxclose_button' class='boxclose_button' ><img  src='images/overlay_images/close_button.png' class='boxclose_button'/></a>";
				//display_overlay();
			//header("location:job_alert.php?msg=ah85&name=$name_for_job_alert&email_id=$email_for_job_alert");
			}
			else
			{
				echo "Sorry , some technical error";
			//header("location:job_alert.php?msg=ah88&name=$name_for_job_alert&email_id=$email_for_job_alert");
			}
			$name_for_job_alert = "";
			$email_for_job_alert = "";
		}
	}
	else
	{
	 echo "<p>Please enter your name</p>";
	// return false;
	}
//}
?>
<script>
jQuery(document).ready(function(e) {
	jQuery('#alert_form_display_link').click(function() {
				//	var a = document.getElementById('box');
				//	alert(a);
					//onclick=\"$('p#message_p').css('display','none');\"
					$('p#message_p').html("");
					$('p#message_p').css('display','none');
					$('form#job_alert_form').css('display','block');
					/*
						$('#box').animate({'top':'-500px'},500,function(){
							$('#overlay').fadeOut('fast');
						});  */
	});	
	jQuery('#boxclose_button').click(function(e) {
		//onclick=\"          $('#box').animate({'top':'-500px'},500,function(){
                       // $('#overlay').fadeOut('fast');
                   // });\"
				 $('#box').animate({'top':'-500px'},500,function(){
                        $('#overlay').fadeOut('fast');
						$('p#message_p').css('display','block');
						$('p#message_alert').html("");
						$('form#job_alert_form').css('display','none');
                    });
		
	});	
	jQuery('#boxclose').click(function(e) {
				 $('#box').animate({'top':'-500px'},500,function(){
                        $('#overlay').fadeOut('fast');
						$('p#message_p').css('display','block');
						$('form#job_alert_form').css('display','none');
                    });
		
	});	
				
});	
</script>
</html>