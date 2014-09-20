<?php 
	require('../common/connection.php');
	date_default_timezone_set('NZ');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Employer-View Appilcant</title>
	<link href="css/formtt.css" rel="stylesheet" type="text/css" />
</head>

<body>

<!-- 
	this page will be opend from search applications
	Job Seeker's detailed information will be given from the previous page.	
	
-->


	<h2>View Applicant </h2>	




<?php
		
	$seeker_detail	= $_POST['seeker_detail']; /* need to determine the method : GET or POST  ? */
	$employer_id	= $_POST['employer_id'];   /* need to determine the method : GET or POST  ? */


	echo "Seeker ID: ".$SeekerID."<br />";
	echo "<hr />";

	$FirstName		= $seeker_detail["FirstName"];
	$LastName		= $seeker_detail["LastName"];
	$EmailID		= $seeker_detail["EmailID"];
	$Address		= $seeker_detail["Address"];
	$MobileNumber	= $seeker_detail["MobileNumber"];
	$HomePhone		= $seeker_detail["HomePhone"];
	$Qualification	= $seeker_detail["Qualification"];
	$CurrentJob		= $seeker_detail["CurrentJob"];
	$Experience		= $seeker_detail["Experience"];
	$SummaryOfSkills	= $seeker_detail["SummaryOfSkills"];
	$SalaryExpectation	= $seeker_detail["SalaryExpectation"];
	$VisaStatus			= $seeker_detail["VisaStatus"];
	$LinkedinProfileLink = $seeker_detail["LinkedinProfileLink"];
	$CoverLetter	= $seeker_detail["CoverLetter"];
	$Availability	= $seeker_detail["Availability"];


?>

	<table border=1>
	<tr>
	<th>Name</th>
	<td><?php echo "$FirstName $LastName"; ?></td>
	</tr>

	<tr>
	<th>Email</th>
	<td><?php echo "$EmailID"; ?></td>
	</tr>

	<tr>
	<th>Address</th>
	<td><?php echo "$Address"; ?></td>
	</tr>

	<tr>
	<th>Mobile Number</th>
	<td><?php echo "$MobileNumber"; ?></td>
	</tr>

	<tr>
	<th>Home Phone</th>
	<td><?php echo "$HomePhone"; ?></td>
	</tr>

	<tr>
	<th>Qualification</th>
	<td><?php echo "$Qualification"; ?></td>
	</tr>

	<tr>
	<th>Current Job</th>
	<td><?php echo "$CurrentJob"; ?></td>
	</tr>

	<tr>
	<th>Experience</th>
	<td><?php echo "Experience$"; ?></td>
	</tr>

	<tr>
	<th>Summary of Skills</th>
	<td><?php echo "$SummaryOfSkills"; ?></td>
	</tr>

	<tr>
	<th>Salary Expectation</th>
	<td><?php echo "$SalaryExpectation"; ?></td>
	</tr>

	<tr>
	<th>Visa Status</th>
	<td><?php echo "$VisaStatus"; ?></td>
	</tr>

	<tr>
	<th>LinkedIn</th>
	<td><?php echo "$LinkedinProfileLink"; ?></td>
	</tr>

	<tr>
	<th>Cover Letter</th>
	<td><?php echo "$CoverLetter"; ?></td>
	</tr>

	<tr>
	<th>Availability</th>
	<td><?php echo "$Availability"; ?></td>
	</tr>

	</table>



	<form method="post" action="contact_applicant.php">
	<input type="hidden" name="employer_id" value="<?php echo $employer_id; ?>">
	<input type="hidden" name="seeker_name" value="<?php echo $FirstName." ".$LastName; ?>">
	<input type="hidden" name="seeker_email" value="<?php echo $seeker_email; ?>">

	<input type="submit" value="SEND" name="submit" />
	</form>



</body>
</html>