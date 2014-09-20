<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-us" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Listing Job Seekers</title>
</head>

<body>

<div>
	<form method="post">
		<input name="Seeker ID" type="text" value="Seeker ID" /><input name="Seeker_ID" style="height: 20px" type="checkbox" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="First_Name" type="text" value="First Name" /><input name="First_Name" type="checkbox" value="1" /><br />
		<input name="Last_Name" type="text" value="Last Name" /><input name="Last_Name" type="checkbox" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="Mobile_Phone" type="text" value="Mobile Number" /><input name="Mobile_Number" type="checkbox" value="1" /><br />
		<input name="Email" type="text" value="Email" /><input name="Email" type="checkbox" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="Home_Phone" type="text" value="Home Phone" /><input name="Work_Phone" type="checkbox" value="1" /><br />
		<input name="Qualification" style="width: 143px" type="text" value="Qualification" /><input name="Agent_Company_Name" style="width: 33px" type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="Address" type="text" value="Address" /><input name="Address" type="checkbox" value="1" />&nbsp;
		<br />
		<input name="Current Job" type="text" value="Current Job" /><input name="Current_Job" type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="Experience" type="text" value="Experience" /><input name="Experience" type="checkbox" /><br />
		<input name="Summary Of Skills" type="text" value="Summary Of Skills" /><input name="Summary_Of_Skills" type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="Salary Expectation" type="text" value="Salary Expectation" /><input name="Salary_Expectation" type="checkbox" /><br />
		<input name="Visa Status" type="text" value="Visa Status" /><input name="Visa_Status" type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="Availability" type="text" value="Availability" /><input name="Availability" type="checkbox" /><br />
		<input name="District" type="text" value="District" /><input name="District" type="checkbox" /><br />
		<br />
		<?php
		  
        $con=mysqli_connect("127.0.0.1","root","1234","get-the-job");
        
        
          // Check connection
		if (mysqli_connect_errno())
 		 {
 			 echo "Failed to connect to MySQL: " . mysqli_connect_error();
 		 }
        
         //If Seeker_ID is checked
        if(isset($_POST['Seeker_ID'])) { 
          

			$result = mysqli_query($con,"SELECT SeekerID FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Seeker ID</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}
        
        //If First Name is checked
        if(isset($_POST['Fisrt_Name'])) { 
          

			$result = mysqli_query($con,"SELECT FirstName FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>First Name</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['FirstName'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}

		//If Last Name is checked
        if(isset($_POST['Last_Name'])) { 
          

			$result = mysqli_query($con,"SELECT LastName FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Last Name</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['LastName'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}


        //If Mobile Number is checked
        if(isset($_POST['Mobile_Number'])) { 
          

			$result = mysqli_query($con,"SELECT MobileNumber FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Mobile Number</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['MobileNumber'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}


		//If Email is checked
        if(isset($_POST['Email'])) { 
          

			$result = mysqli_query($con,"SELECT EmailID FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Email</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['EmailID'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}
		
		
		//If Home Phone is checked
        if(isset($_POST['Home_Phone'])) { 
          

			$result = mysqli_query($con,"SELECT HomePhone FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Home Phone</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}



		//If Qualification is checked
        if(isset($_POST['Qualification'])) { 
          

			$result = mysqli_query($con,"SELECT Qualification FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Qualification</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['Qualification'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}



		//If Address is checked
        if(isset($_POST['Address'])) { 
          

			$result = mysqli_query($con,"SELECT Address FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Address</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['Address'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}
		
		
		//If Current Job is checked
        if(isset($_POST['Current_Job'])) { 
          

			$result = mysqli_query($con,"SELECT CurrentJob FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Current Job</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['CurrentJob'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}

		//If Experience is checked
        if(isset($_POST['Experience'])) { 
          

			$result = mysqli_query($con,"SELECT Experience FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Experience</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['Experience'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}



		//If Summary of Skills is checked
        if(isset($_POST['Summary_Of_Skills'])) { 
          

			$result = mysqli_query($con,"SELECT SummaryOfSkills FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Summary of Skills</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['SummaryOfSkills'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}



		//If Salary Expectation is checked
        if(isset($_POST['Salary_Expectation'])) { 
          

			$result = mysqli_query($con,"Select SalaryExpectation FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Salary Expectation</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['SalaryExpectation'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}
		
		
		//If Visa Status is checked
        if(isset($_POST['Visa_Status'])) { 
          

			$result = mysqli_query($con,"Select VisaStatus FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Visa Status</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['VisaStatus'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}



		//If Availability is checked
        if(isset($_POST['Availability'])) { 
          

			$result = mysqli_query($con,"Select Availability FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>Availability</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['Availability'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}




        //If District is checked
        if(isset($_POST['District'])) { 
          

			$result = mysqli_query($con,"Select DistrictID FROM job_seeker");

			echo "<table border='1'>
		<tr>
			<th>District</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['DistrictID'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}




        
        //If Seeker_ID and Fisrt Name is checked
        else if (isset($_POST['Seeker_ID']) && isset($_POST['First_Name'])) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Seeker ID</th>
				<th>First Name</th>
			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "</tr>";
  		}
		echo "</table>";
		
		
		//If First Name and Last Name is checked
        else if (isset($_POST['First_Name']) && isset($_POST['Last_Name'])) { 
		
		$result = mysqli_query($con,"SELECT FirstName,LastName FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LastName'] . "</td>";
  			echo "</tr>";
  		}
		echo "</table>";

		
		
		
		//If Seeker_ID, First Name and Last Name is checked
		 else if (isset($_POST['Seeker_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Seeker ID</th>
				<th>First Name</th>
				<th>Last Name</th>
			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";

  			echo "</tr>";
  		}
		echo "</table>";

	
	//If Seeker_ID, Fisrt Name, Last Name and Mobile Phone is checked
	else if (isset($_POST['Seeker_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number'])) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Seeker ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobileNumber'] . "</td>";


  			echo "</tr>";
  		}
		echo "</table>";


		//If Seeker_ID, Fisrt Name, Last Name, Mobile Phone and Email is checked
		else if (isset($_POST['Seeker_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email'])) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Seeker ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>

			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";


  			echo "</tr>";
  		}
		echo "</table>";


     //If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email and Home Phone is checked
		else if (isset($_POST['Employer_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) ) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Home Phone</th>


			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobileNumber'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";


  			echo "</tr>";
  		}
		echo "</table>";



     //If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone and Qualification is checked
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  ) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Home Phone</th>
				<th>Qualification</th>



			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";



  			echo "</tr>";
  		}
		echo "</table>";
		
		
//If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone, Qualification and Address is checked
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  && isset($_POST['Address'])  ) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification,Address FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Homr Phone</th>
				<th>Qualification</th>
				<th>Address</th>

			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";


  			echo "</tr>";
  		}
		echo "</table>";


//If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone, Qualification,Address and Current Job is checked
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  && isset($_POST['Address'])  && isset($_POST['Current_Job']) ) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification,Address,CurrentJob FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Homr Phone</th>
				<th>Qualification</th>
				<th>Address</th>
				<th>Current Job</th>

			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";
			echo "<td>" . $row['CurrentJob'] . "</td>";



  			echo "</tr>";
  		}
		echo "</table>";



//If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone, Qualification,Address,Current Job and Experience is checked
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  && isset($_POST['Address'])  && isset($_POST['Current_Job']) 
	&& isset($_POST['Experience']) ) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification,Address,CurrentJob, Experience FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Homr Phone</th>
				<th>Qualification</th>
				<th>Address</th>
				<th>Current Job</th>
				<th>Experience</th>


			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";
			echo "<td>" . $row['CurrentJob'] . "</td>";
			echo "<td>" . $row['Experience'] . "</td>";


  			echo "</tr>";
  		}
		echo "</table>";


  /*If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone, Qualification,Address,Current Job,
   Experience  and Summary of Skills is checked */
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  && isset($_POST['Address'])  && isset($_POST['Current_Job']) 
	&& isset($_POST['Experience'])  && isset($_POST['Summary_Of_Skills'])) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification,Address,CurrentJob, Experience,SummaryOfSkills FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Homr Phone</th>
				<th>Qualification</th>
				<th>Address</th>
				<th>Current Job</th>
				<th>Experience</th>
				<th>Summary of Skills</th>


			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";
			echo "<td>" . $row['CurrentJob'] . "</td>";
			echo "<td>" . $row['Experience'] . "</td>";
			echo "<td>" . $row['SummaryOfSkills'] . "</td>";



  			echo "</tr>";
  		}
		echo "</table>";

	



  /*If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone, Qualification,Address,Current Job,
   Experience, Summary of Skills and Salary Expectation is checked */
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  && isset($_POST['Address'])  && isset($_POST['Current_Job']) 
	&& isset($_POST['Experience'])  && isset($_POST['Summary_Of_Skills']) && isset($_POST['Salary_Expectation'])) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification,Address,CurrentJob, Experience,SummaryOfSkills,SalaryExpectation FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Homr Phone</th>
				<th>Qualification</th>
				<th>Address</th>
				<th>Current Job</th>
				<th>Experience</th>
				<th>Summary of Skills</th>
				<th>Salary Expectation</th>


			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";
			echo "<td>" . $row['CurrentJob'] . "</td>";
			echo "<td>" . $row['Experience'] . "</td>";
			echo "<td>" . $row['SummaryOfSkills'] . "</td>";
			echo "<td>" . $row['SalaryExpectation'] . "</td>";



  			echo "</tr>";
  		}
		echo "</table>";
	
	
	
  /*If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone, Qualification,Address,Current Job,
   Experience, Summary of Skills, Salary Expectation and Visa Status is checked */
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  && isset($_POST['Address'])  && isset($_POST['Current_Job']) 
	&& isset($_POST['Experience'])  && isset($_POST['Summary_Of_Skills']) && isset($_POST['Salary_Expectation'])
	&& isset($_POST['Visa_Status'])) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification,Address,CurrentJob, Experience,SummaryOfSkills,SalaryExpectation,VisaStatus FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Homr Phone</th>
				<th>Qualification</th>
				<th>Address</th>
				<th>Current Job</th>
				<th>Experience</th>
				<th>Summary of Skills</th>
				<th>Salary Expectation</th>
				<th>Visa Status</th>

			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";
			echo "<td>" . $row['CurrentJob'] . "</td>";
			echo "<td>" . $row['Experience'] . "</td>";
			echo "<td>" . $row['SummaryOfSkills'] . "</td>";
			echo "<td>" . $row['SalaryExpectation'] . "</td>";
			echo "<td>" . $row['VisaStatus'] . "</td>";

  			echo "</tr>";
  		}
		echo "</table>";
		
		
		
	
  /*If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone, Qualification,Address,Current Job,
   Experience, Summary of Skills, Salary Expectation and Visa Status is checked */
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  && isset($_POST['Address'])  && isset($_POST['Current_Job']) 
	&& isset($_POST['Experience'])  && isset($_POST['Summary_Of_Skills']) && isset($_POST['Salary_Expectation'])
	&& isset($_POST['Visa_Status'])) { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification,Address,CurrentJob, Experience,SummaryOfSkills,SalaryExpectation,VisaStatus FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Homr Phone</th>
				<th>Qualification</th>
				<th>Address</th>
				<th>Current Job</th>
				<th>Experience</th>
				<th>Summary of Skills</th>
				<th>Salary Expectation</th>
				<th>Visa Status</th>

			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";
			echo "<td>" . $row['CurrentJob'] . "</td>";
			echo "<td>" . $row['Experience'] . "</td>";
			echo "<td>" . $row['SummaryOfSkills'] . "</td>";
			echo "<td>" . $row['SalaryExpectation'] . "</td>";
			echo "<td>" . $row['VisaStatus'] . "</td>";

  			echo "</tr>";
  		}
		echo "</table>";



  /*If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone, Qualification,Address,Current Job,
   Experience, Summary of Skills, Salary Expectation, Visa Status and Availability is checked */
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  && isset($_POST['Address'])  && isset($_POST['Current_Job']) 
	&& isset($_POST['Experience'])  && isset($_POST['Summary_Of_Skills']) && isset($_POST['Salary_Expectation'])
	&& isset($_POST['Visa_Status']) && isset($_POST['Availability']))  { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification,Address,CurrentJob, Experience,SummaryOfSkills,SalaryExpectation,VisaStatus,Availability FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Homr Phone</th>
				<th>Qualification</th>
				<th>Address</th>
				<th>Current Job</th>
				<th>Experience</th>
				<th>Summary of Skills</th>
				<th>Salary Expectation</th>
				<th>Visa Status</th>
				<th>Availability</th>


			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";
			echo "<td>" . $row['CurrentJob'] . "</td>";
			echo "<td>" . $row['Experience'] . "</td>";
			echo "<td>" . $row['SummaryOfSkills'] . "</td>";
			echo "<td>" . $row['SalaryExpectation'] . "</td>";
			echo "<td>" . $row['VisaStatus'] . "</td>";
			echo "<td>" . $row['Availability'] . "</td>";


  			echo "</tr>";
  		}
		echo "</table>";



  /*If Seeker_ID, Fisrt Name, Last Name, Mobile Phone, Email, Home Phone, Qualification,Address,Current Job,
   Experience, Summary of Skills, Salary Expectation, Visa Status, Availability and District is checked */
		else if (isset($_POST['SeekerID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Home_Phone']) 
	&& isset($_POST['Qualification'])  && isset($_POST['Address'])  && isset($_POST['Current_Job']) 
	&& isset($_POST['Experience'])  && isset($_POST['Summary_Of_Skills']) && isset($_POST['Salary_Expectation'])
	&& isset($_POST['Visa_Status']) && isset($_POST['Availability']) && isset($_POST['District']))  { 
		
		$result = mysqli_query($con,"SELECT SeekerID,FirstName,LastName,MobileNumber,Email,HomePhone,Qualification,Address,CurrentJob, Experience,SummaryOfSkills,SalaryExpectation,VisaStatus,Availability,DistrictID FROM job_seeker");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Homr Phone</th>
				<th>Qualification</th>
				<th>Address</th>
				<th>Current Job</th>
				<th>Experience</th>
				<th>Summary of Skills</th>
				<th>Salary Expectation</th>
				<th>Visa Status</th>
				<th>Availability</th>
				<th>District</th>


			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['SeekerID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Email'] . "</td>";
  			echo "<td>" . $row['HomePhone'] . "</td>";
  			echo "<td>" . $row['Qualification'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";
			echo "<td>" . $row['CurrentJob'] . "</td>";
			echo "<td>" . $row['Experience'] . "</td>";
			echo "<td>" . $row['SummaryOfSkills'] . "</td>";
			echo "<td>" . $row['SalaryExpectation'] . "</td>";
			echo "<td>" . $row['VisaStatus'] . "</td>";
			echo "<td>" . $row['Availability'] . "</td>";
			echo "<td>" . $row['DistrictID'] . "</td>";



  			echo "</tr>";
  		}
		echo "</table>";

		mysqli_close($con);
		?>
		
		<input name="Submit1" style="width: 163px" type="submit" value="submit" />&nbsp;
		<input name="Reset1" style="width: 159px" type="reset" value="reset" /></form>
</div>

</body>

</html>
