<?php 
	require('../common/connection.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Employer-Searching Applications</title>
	<link href="css/formtt.css" rel="stylesheet" type="text/css" />
</head>

<body>


<!-- 
	this page will be opend from list job posting page 
	JobID, EMPLOYER_ID will be given from the previous page.	
	
-->


	<h2>Search Job Applications</h2>


<?php
		
	$EmployerID = $_GET['EmployerID']; // GET vs POST ?
	$JobID		= $_GET['JobID'];


	echo "Employer ID: ".$EmployerID;
	echo "<br />";
	echo "Job ID: ".$JobID;
	echo "<hr />";

?>

	<form method="post" action="search_application_result.php">


	<label for="subject">Subject</label> <br />
	<input type="text" id="subject" name="subject" size="50" /><br /><br />


	<label for="Qualification">Qualification</label> <br />
	<textarea  id="Qualification" name="Qualification" cols="40" rows="2" /></textarea><br /><br />

	<label for="CurrentJob">Current Job</label> <br />
	<textarea  id="CurrentJob" name="CurrentJob" cols="40" rows="10" /></textarea><br /><br />

	<label for="Experience">Experience</label> <br />
	<textarea  id="experience" name="experience" cols="40" rows="2" /></textarea><br /><br />

	<label for="SummaryOfSkills">Summary Of Skills</label> <br />
	<textarea  id="SummaryOfSkills" name="SummaryOfSkills" cols="40" rows="10" /></textarea><br /><br />


	<input type="hidden" name="employer_id" value="<?php echo $employer_id; ?>">
	<input type="hidden" name="seeker_email" value="<?php echo $seeker_email; ?>">

	<input type="submit" value="SEND" name="submit" />
	</form>























	$conn = new createConnection();
	$conn->connectToDatabase();
	$conn->selectDatabase();		

	$sql = "SELECT SeekerID from seeker_appliedjobs where JobID = $JodID";

	var_dump($sql);

	$result = $conn->queryDatabase($sql);
	$num = mysql_numrows($result);


	
	$seeker_idx = 1;

	if($num)
	{
		echo "<table>"
		echo "<tr>";
		echo "<th>Index</th>"
		echo "<td>Name</td>";
		echo "<td>Email</td>";
		echo "<td>View Detail</td>";
		echo "<td>View Resume</td>";
		echo "<td>Conact</td>";
		echo "</tr>";
		
		while ($row = mysql_fetch_assoc($result)) 
		{
			$SeekerID	 = $row["SeekerID"];

			$sql = "SELECT * from job_seeker where SeekerID = $SeekerID";

			var_dump($sql);

			$seeker_result = $conn->queryDatabase($sql);
			$seeker_detail = mysql_fetch_assoc($seeker_result); /* is it needed ? */


			echo "<form action='view_applicant.php' method='post' name='view_applicant' enctype='multipart/form-data'>";
			echo "<input type='hidden' name='seeker_detail' value=$seeker_detail>";
			echo "<input type='hidden' name='employer_id' value=$employer_id>";

			echo "<tr>";
			echo "<th>$seeker_idx</th>"
			echo "<td>$seeker_detail['FirstName'] $seeker_detail['LastName']</td>";
			echo "<td>$seeker_detail['EmailID'] </td>";
			echo "<td><input type='Submit' value='View Detail'></td>";
			echo "<td>Resume</td>";  /* File download or direct view */
			echo "</tr>";
			
			$seeker_idx++;
		}
		echo "</form>";
		echo "</table>";


		

	}
	else
	{
		echo "No application for this job posting";

	}
	
	$conn->closeConnection();
?>




</body>
</html>