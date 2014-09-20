<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{ 
	if ($_POST['alert_keyword'] != "")
	{
		//echo "get it";
		//echo $_POST['alert_email'];
		include_once"../common/mysqli_connect.php";
		$alert_keyword = $_POST['alert_keyword'];
		$alert_email = $_POST['alert_email'];
		$alert_name = $_POST['alert_name'];
		$query = "SELECT job_alert.seeker_id, job_alert.job_alert_id FROM job_alert LEFT JOIN job_seeker ON job_alert.seeker_id = job_seeker.seeker_id WHERE job_seeker.email_id='$alert_email'";
		$sql = mysqli_query($dbc, $query) or trigger_error("Query: $query\n<br />MySQL Error: " . mysqli_error($dbc));
		$numRows = mysqli_num_rows($sql);
			if (!$alert_email) {
				
				header("location:../job_alert.php?error_msg=keyword");
			
			} else if ($numRows > 0) {
				 while ($row = mysqli_fetch_array($sql, MYSQLI_ASSOC)) {
					$alert_seeker_id = $row['seeker_id'];
					$job_alert_id = $row['job_alert_id'];
					$sql_update_in_alert = mysqli_query($dbc, "update job_alert SET job_alert_title='$alert_keyword', category_ids='$_POST[category]', area_district_ids='$_POST[region]', salary_ids='$_POST[alert_salary]', work_type_ids='$_POST[alert_work_type]' WHERE seeker_id = '$alert_seeker_id' AND job_alert_id = '$job_alert_id'")  or die (mysqli_error($dbc));
					if($sql_update_in_alert)
					echo "Congratulations! You have successfully set your job alert filters now you will get more selected newly posted jobs in your inbox. Best of Luck";
				 }
					//header("location:job_alert.php?msg=ah80&name=$name_for_job_alert&email_id=$email_for_job_alert");
			} else if ($numRows == 0){
				
				$sql_insert_in_seeker = mysqli_query($dbc, "INSERT INTO job_seeker (first_name, email_id) VALUES('$alert_name','$alert_email') ")  or die (mysqli_error());
				$last_inserted_mysql_id = mysqli_insert_id($dbc);
				$sql_insert1_in_alert = mysqli_query($dbc, "INSERT INTO job_alert (seeker_id, job_alert_title, category_ids, area_district_ids, salary_ids, work_type_ids) VALUES('$last_inserted_mysql_id', '$alert_keyword', '$_POST[category]', '$_POST[region]', '$_POST[alert_salary]', '$_POST[alert_work_type]') ")  or die (mysqli_error($dbc));
				if($sql_insert_in_seeker && $sql_insert1_in_alert)
				echo "successfully added to job alert.";
				else 
				echo "Sorry, some technical error, please try some time later";
			}
	}
	else
	header("location:../job_alert.php?error_msg=keyword");
}
else

header("location:../index.php");
?>