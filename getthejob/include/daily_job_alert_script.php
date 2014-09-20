<link href="../css/emp_home_listed_jobs.css" rel="stylesheet" type="text/css">
<?php
date_default_timezone_set('NZ');

include_once"../common/mysqli_connect.php";
require_once('PHPMailer_5.2.4/class.phpmailer.php'); 
$query = "SELECT job_alert.job_alert_id, job_alert.job_alert_title, job_alert.category_ids, job_alert.area_district_ids, salary_ids, work_type_ids, job_seeker.email_id, job_seeker.first_name
			 FROM job_alert
			 LEFT JOIN job_seeker 
			 ON job_alert.seeker_id = job_seeker.seeker_id 
			 WHERE is_received='0' LIMIT 1";
$sql = mysqli_query($dbc, $query);
$numRows = mysqli_num_rows($sql); // Added for "End Campaign Check" at the bottom of this file(not shown on the video)
$mail_body = '';
while($row = mysqli_fetch_array($sql, MYSQLI_ASSOC)){
	$id = $row["job_alert_id"];
	$email = $row["email_id"];
	$name = $row["first_name"];
	$job_alert_title = $row["job_alert_title"];
	$category_ids = $row["category_ids"];
	$area_district_ids = $row["area_district_ids"];
	$salary_ids = $row["salary_ids"];
	$work_type_ids = $row["work_type_ids"];			
	
	$job_table_query = "SELECT job.job_id, job.job_title, LEFT(job.job_description, 200) AS job_description,  employer_agent_company.company_name, district.district_name 
					  FROM job 
					  LEFT JOIN employer_agent_company 
					  ON job.employer_id = employer_agent_company.employer_id 
					  LEFT JOIN district 
					  ON job.district_id = district.district_id
					  WHERE job.start_ad_date > NOW() - INTERVAL 1 DAY";
			if($job_alert_title != "null" && $job_alert_title != "" && $job_alert_title != null)
					{
					$job_table_query .= " AND (job.job_description like '%$job_alert_title%' OR job.job_title like '%$job_alert_title%')";	
					}
			if($work_type_ids != "null" && $work_type_ids != "" && $work_type_ids != null)
					{
					$job_table_query .= " AND job.work_type_id = $work_type_ids";	
					}
		/*	if($category_ids != "null" && $category_ids != "" && $category_ids != null)
					{
					$job_table_query .= " AND job.subcategory_id = $category_ids";	
					}	 */					  
		$job_table_query .= " LIMIT 4";
	$sql_to_job_table = mysqli_query($dbc, $job_table_query);
	$numRows_in_job_table = mysqli_num_rows($sql_to_job_table); 
	if($numRows_in_job_table > 0)
		  {
				$email_for_seekers = new PHPMailer();
		 // $body = "it is a test email with attachments";
		  $body = '<html>
			<body style="background-color:#fff; color:#000; font-family: Arial, Helvetica, sans-serif; line-height:1.8em;">
			<h1>Job Alert Email from <a href="http://www.getthejob.co.nz"> <img src="../images/logo.jpg" alt="getthejob.co.nz" border="0" width="180px" height="60px" /></a></h1>
			<p>Hello ' . $name . ',</p>
			<p>Here is list of jobs which posted yesterday, as per your job alert settings - </p>
			<p></p>';
			while($job_row = mysqli_fetch_array($sql_to_job_table, MYSQLI_ASSOC))
			{
			$body .= '<div class="posted_jobs_container_left_panel"><h3 class="red_title"><a href="#">'.$job_row["job_title"].'</a></h3>';
	//$list .= '<p class="search_result_desc">'.str_ireplace($keywords, "<span class='highlight'>\"".$keywords."\"</span>", $desc).'</p>';
	//$list .= '<p class="search_result_desc">'.substr($highlighted_desc,0,200).'</p>';
			$body .= '<span class="bold">Company:</span> '.$job_row["company_name"].' &emsp; | &emsp;&nbsp; <span  class="bold">Location:</span> '.$job_row["district_name"].'';
			$body .= '<p class="search_result_desc">'.$job_row["job_description"].'</p>';
			//$body .= '<div class="emp_posted_job_bottom_panel">&emsp;&emsp; Edit Details &emsp;&emsp; Extend Date &emsp;&emsp; Add Note </div></div>';
			//$body .= '<div class="posted_jobs_container_right_panel"><img src="http://localhost:8000/getthejob/images/logos/'.$row["company_logo"].'" width="160px" height="60px" class="emp_posted_job_logo_img"/>';
		//	$body .= ' <div style="line-height:20px;"><span  class="bold">  &nbsp; Posted on:</span> '.$job_row["start_ad_date"].'</div> <div><span  class="bold"> &nbsp; &nbsp;Expired on:</span> '.$job_row["end_ad_date"].'</div>';
			$body .= '<div class="view_detail_link">View Details</div></div>';
			$body .= '<hr class="posted_jobs_hr_red" color="#FF282E">';	
			}
		if($numRows_in_job_table > 1)
		{
		$body .= 'You can view rest of new posted jobs as per your selected job filters by clicking <a href="http://localhost:8000/getthejob/AdvanceSearchPage.php"> here </a>.';	
		}	
		$body .='<hr>
			<p>To opt out of receiving this job alert email,  <a href="http://www.getthejob.co.nz/include/optout.php?e=' . $email . '">click here</a> and we will remove you from the listing immediately.</p>
			</body>
			</html>';
			 $signature = " &nbsp;Regards<br><br><br><img alt='Getthejob Logo' src='cid:logo-attach' width='220px' height='110px'><br>&nbsp; <span style='color:#000; font-size:17px; font-weight:bold;'>Carnie Recruitment Team</span><br>&nbsp; <font color='#000'><strong>P: </strong></font>+64 9 523 0606<br>&nbsp; <font color='#000'><strong>E: </strong></font>info@carnierecruitment.co.nz<br>&nbsp; <span style='color:#f00; font-weight:bold; font-size:18px;'>Carnie Recruitment & Coaching Services</span><br>&nbsp; <span style='color:#666;font-size:17px;'>Level 1, 11 Alma Street, Newmarket, Auckland 1023, NZ</span><br>&nbsp; <span style='color:#000; font-size:16px; font-weight:bold;'>www.carnierecruitment.co.nz</span><br>";
			 $body .= $signature;
		 // $body .= file_get_contents('emails/cv_submission_email.html');
		  
		  $email_for_seekers->AltBody = "To view this message please use an HTML compatible email viewer, or visit http://mysite.com/emailcampaign"; // give folks who can't read HTML email something to read
			$email_for_seekers->From      = 'noreply@getthejob.co.nz';
			$email_for_seekers->FromName  = 'Getthejob';
			$email_for_seekers->Subject   = $numRows_in_job_table.' new jobs for '. $job_alert_title .' keyword';
			$email_for_seekers->WordWrap = 130;
			//$email->AddBCC("xxx@xxxx.com","Name 1");
			//$email->AddReplyTo("dsdf@df.fddf");
		   // $email->Body      = $bodytext;
		   $email_for_seekers->AddEmbeddedImage("../images/logo.jpg", "logo-attach", "logo.jpg");
		 //  $email->AddEmbeddedImage("images/Carnie_Recritment_Tagline_2.jpg", "tagline-attach", "Carnie_Recritment_Tagline_2.jpg");
		    $email_for_seekers->MsgHTML($body);
			
			$email_for_seekers->AddAddress($email);
				
			
				/*$subject = " $numRows_in_job_table new jobs for $job_alert_title keyword";
				$headers  = "From:jobmail@getthejob.co.nz\r\n";
				$headers .= "Content-type: text/html\r\n";
				$to = "$email";
			
				$mail_result = mail($to, $subject, $mail_body, $headers); */
				if($email_for_seekers->Send())
			    {
				 mysqli_query($dbc, "UPDATE job_alert SET is_received='1' WHERE job_alert_id='$id' LIMIT 1");
				} else {
				   //trigger_error("Query: $update\n<br />MySQL Error: " . mysqli_error($dbc));
				   echo "not done";
				}
			}
			else    //if no new job found , for that still have to update is_received column with 1 so that cronjob can be stopped in last
			{
				 mysqli_query($dbc, "UPDATE job_alert SET is_received='1' WHERE job_alert_id='$id' LIMIT 1");
			}
}
?>
<?php
// This section is script I discussed adding to this file on video
// This section is for sending the site owner a message informing them that
// all people in the database have been sent the newsletter for the current campaign
if ($numRows == 0) { // $numRows is set on line 4 using the existing query
	 
	 $subj = "Job Alert blast email has Ended";
	 $body = "The today's job alert emails has been sent to all job seeker.";
     $hdr  = "From:jobmail@getthejob.co.nz\r\n";
     $hdr .= "Content-type: text/html\r\n";
     mail("bansalpreeti07@gmail.com", $subj, $body, $hdr);
	
}
// End Check Section
?>