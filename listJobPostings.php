<?php 
require('common/connection.php');
date_default_timezone_set('NZ');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>List Job Postingst</title>
<link href="css/formtt.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.3.2.js" type="text/javascript"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="javascripts/jobListEdit.js" type="text/javascript"></script>

</head>
<body>
<h3>List of all advertised and active jobs by you</h3>
<h4>For viewing or editing any job's decription, please click on that secific job row.</h4>
<?php
if(!empty($_GET['message'])) {
    	$message = $_GET['message'];
		echo $message;
}
?>
<table border="2px">
<tr><th>Job Title</th><th>Job Description</th><th>Work Type</th><th>Location</th><th>Category</th><th>Date of Advertisement</th><th>End date of advertisement</th><th>Experience Level</th><th>Edit Job Option</th></tr>
<?php 
$conn = new createConnection();
$conn->connectToDatabase();
$conn->selectDatabase();
$employerId = 2;

	$sql = "SELECT * from job where EMPLOYER_ID = $employerId";
	var_dump($sql);
		$res = $conn->queryDatabase($sql);
	 if($res)
	 	{
		$num_rows = mysqli_num_rows($res);
		for($i=0; $i < $num_rows; $i++)
		{
			 $row = mysqli_fetch_array($res);
		
			 $jobId = $row['JobID'];
			 $jobTitle = $row['JobTitle'];
			  $jobDesc = $row['JobDescription'];
			   $workType = $row['WorkTypeID'];
			    $district = $row['DistrictID'];
				 $subCategory = $row['SubCategoryID'];
				  $dateAdStart = $row['DateOfAdvertisement'];
				   $dateAdEnd = $row['EndDateOfAdvertisement'];
				    $experience = $row['ExperienceLevel'];
					$res1 = $conn->queryDatabase("SELECT WorkType from work_type where WorkTypeID = $workType");
					$workRow = $res1->fetch_assoc();
					$workType1 = $workRow['WorkType'];
		
?>		 
			 <tr><td><?php echo $jobTitle ?></td><td><?php echo $jobDesc ?></td><td><?php echo $workType1 ?></td><td><?php echo $district ?></td><td><?php echo $subCategory ?></td><td><?php echo $dateAdStart ?></td><td><?php echo $dateAdEnd ?></td><td><?php echo $experience ?></td><td><div class="jobListing" id="jobListing<?php echo $i; ?>">Edit this job <div id="jobid<?php echo $i; ?>" class="jobid"><?php echo $jobId ?></div></div> </td></tr>
<?php			
		 }
		} 
	 else
		{
			echo "Could not find the record for this employer: mysql_error()";
		}
	$conn->closeConnection();

?>

</table>

<div id='box'>
<h1>Job Edit Window</h1>
<h4>Once after posting a job, You can edit only job title and job description. </h4>
<div class="error"></div>

<form action="" method="post" name="editJobForm" id="editJobForm" class="editJobForm" enctype="application/x-www-form-urlencoded">
<table>
<tr><td><p><label for="jobTitle"><span id="astrick">*</span> Job Title:</label></td>
<td><input name="jobTitle" type="text" id="jobTitle" <?php if (isset($missing)){
	echo 'value="'.htmlentities($_POST['jobTitle']).'"'; }?>/></p></td></tr>
    
<tr><td><p><label for="jobDesc"><span id="astrick">*</span> Job Description:</label></td>
<td><textarea name="jobDesc" cols="30" rows="8" id="jobDesc" ><?php if (isset($missing)){
	echo htmlentities($_POST['jobDesc']); }?></textarea></p></td></tr>

<tr><td></td><td><input type="button" id="post" name="post" value="Post It Now Again" />
<input type="button" id="cancel" name="cancel" value="Cancel" /></td></tr>
</table>
</form>
</div>

<div id='screen'>
</div>

</body>
</html>