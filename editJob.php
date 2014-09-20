<?php
require('common/connection.php');
date_default_timezone_set('NZ');
foreach($_GET as $key => $value) {
    if(!empty($value)) 
	{
        $jobId = $_GET['jobid'];
		echo $jobId;
	    $jobTitle = $_GET['jobtitle'];
		echo $jobTitle;
		 $jobDesc = $_GET['jobdesc'];
		echo $jobDesc;
	}
	else
	{
	echo "No Value found";	
	}
}
/* $conn = new createConnection();
$conn->connectToDatabase();
$conn->selectDatabase();
$sql = "UPDATE job SET JobTitle = $jobTitle, JobDescription = $jobDesc WHERE JobID = $jobId";
$res = $conn->queryDatabase($sql);
		if($res === TRUE)
		{
		$msg = "Your job - ".$jobTitle." has been updated.";
			header("location: listJobPostings.php?message=$msg");
			exit();	
		}
		else
		{
		$msg = "Your job - '".$jobTitle."' could not updated, Please try again";
			header("location: listJobPostings.php?message=$msg");
			exit();		
		} */

?>