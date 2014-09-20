<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-us" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Listing Employers</title>
</head>

<body>

<div>
	<form method="post">
		<input name="Employer_ID" type="text" value="Employer ID" /><input name="Employer_ID" style="height: 20px" type="checkbox" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="First_Name" type="text" value="First Name" /><input name="First_Name" type="checkbox" value="1" /><br />
		<input name="Last_Name" type="text" value="Last Name" /><input name="Last_Name" type="checkbox" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="Mobile_Phone" type="text" value="Mobile Number" /><input name="Mobile_Number" type="checkbox" value="1" /><br />
		<input name="Email" type="text" value="Email" /><input name="Email" type="checkbox" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="Work_Phone" type="text" value="Work Phone" /><input name="Work_Phone" type="checkbox" value="1" /><br />
		<input name="Agent_Company_Name" style="width: 143px" type="text" value="Agent Company Name" /><input name="Agent_Company_Name" style="width: 33px" type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="Address" type="text" value="Address" /><input name="Address" type="checkbox" value="1" />&nbsp;
		<br />
		<br />
		<?php
		  
        $con=mysqli_connect("127.0.0.1","root","1234","get-the-job");
        
        
          // Check connection
		if (mysqli_connect_errno())
 		 {
 			 echo "Failed to connect to MySQL: " . mysqli_connect_error();
 		 }
        
         //If Employer_ID is checked
        if(isset($_POST['Employer_ID'])) { 
          

			$result = mysqli_query($con,"SELECT EMPLOYER_ID FROM employer_agent_company");

			echo "<table border='1'>
		<tr>
			<th>Employer ID</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['EMPLOYER_ID'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}
        
        //If First Name is checked
        if(isset($_POST['Fisrt_Name'])) { 
          

			$result = mysqli_query($con,"SELECT FirstName FROM employer_agent_company");

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
          

			$result = mysqli_query($con,"SELECT LastName FROM employer_agent_company");

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
          

			$result = mysqli_query($con,"SELECT MobilePhone FROM employer_agent_company");

			echo "<table border='1'>
		<tr>
			<th>Mobile Number</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}


		//If Email is checked
        if(isset($_POST['Email'])) { 
          

			$result = mysqli_query($con,"SELECT Username_Email FROM employer_agent_company");

			echo "<table border='1'>
		<tr>
			<th>Email</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['Username_Email'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}
		
		
		//If Work Phone is checked
        if(isset($_POST['WorkPhone'])) { 
          

			$result = mysqli_query($con,"SELECT WorkPhone FROM employer_agent_company");

			echo "<table border='1'>
		<tr>
			<th>Work Phone</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['WorkPhone'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}



		//If Agent Company Name is checked
        if(isset($_POST['Agent_Company_Name'])) { 
          

			$result = mysqli_query($con,"SELECT AGENT_COMPANY_NAME FROM employer_agent_company");

			echo "<table border='1'>
		<tr>
			<th>Agent Company Name</th>
			
		</tr>";

		while($row = mysqli_fetch_array($result))
 		 {
  			echo "<tr>";
  			echo "<td>" . $row['AGENT_COMPANY_NAME'] . "</td>";
 			echo "</tr>";
  		}
		echo "</table>";

		}



		//If Address is checked
        if(isset($_POST['Address'])) { 
          

			$result = mysqli_query($con,"SELECT Address FROM employer_agent_company");

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

        
        //If Employer_ID and Fisrt Name is checked
        else if (isset($_POST['Employer_ID']) && isset($_POST['First_Name'])) { 
		
		$result = mysqli_query($con,"SELECT EMPLOYER_ID,FirstName FROM employer_agent_company");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['EMPLOYER_ID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "</tr>";
  		}
		echo "</table>";
		
		
		//If First Name and Last Name is checked
        else if (isset($_POST['First_Name']) && isset($_POST['Last_Name'])) { 
		
		$result = mysqli_query($con,"SELECT FirstName,LastName FROM employer_agent_company");

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

		
		
		
		//If Employer_ID, First Name and Last Name is checked
		 else if (isset($_POST['Employer_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])) { 
		
		$result = mysqli_query($con,"SELECT EMPLOYER_ID,FirstName,LastName FROM employer_agent_company");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['EMPLOYER_ID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";

  			echo "</tr>";
  		}
		echo "</table>";

	
	//If Employer_ID, Fisrt Name, Last Name and Mobile Phone is checked
	else if (isset($_POST['Employer_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number'])) { 
		
		$result = mysqli_query($con,"SELECT EMPLOYER_ID,FirstName,LastName,MobilePhone FROM employer_agent_company");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['EMPLOYER_ID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";


  			echo "</tr>";
  		}
		echo "</table>";


		//If Employer_ID, Fisrt Name, Last Name, Mobile Phone and Email is checked
		else if (isset($_POST['Employer_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email'])) { 
		
		$result = mysqli_query($con,"SELECT EMPLOYER_ID,FirstName,LastName,MobilePhone,Username_Email FROM employer_agent_company");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>

			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['EMPLOYER_ID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Username_Email'] . "</td>";


  			echo "</tr>";
  		}
		echo "</table>";


     //If Employer_ID, Fisrt Name, Last Name, Mobile Phone, Email and Work Phone is checked
		else if (isset($_POST['Employer_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Work_Phone']) ) { 
		
		$result = mysqli_query($con,"SELECT EMPLOYER_ID,FirstName,LastName,MobilePhone,Username_Email,WorkPhone
		                              FROM employer_agent_company");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Work Phone</th>


			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['EMPLOYER_ID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Username_Email'] . "</td>";
  			echo "<td>" . $row['WorkPhone'] . "</td>";


  			echo "</tr>";
  		}
		echo "</table>";



     //If Employer_ID, Fisrt Name, Last Name, Mobile Phone, Email, Work Phone and Agent Company Name is checked
		else if (isset($_POST['Employer_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Work_Phone']) 
	&& isset($_POST['Agent_Company_Name'])  ) { 
		
		$result = mysqli_query($con,"SELECT EMPLOYER_ID,FirstName,LastName,MobilePhone,Username_Email,WorkPhone,AGENT_COMPANY_NAME FROM employer_agent_company");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Work Phone</th>
				<th>Agent Company Name</th>



			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['EMPLOYER_ID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Username_Email'] . "</td>";
  			echo "<td>" . $row['WorkPhone'] . "</td>";
  			echo "<td>" . $row['AGENT_COMPANY_NAME'] . "</td>";



  			echo "</tr>";
  		}
		echo "</table>";
		
		
//If Employer_ID, Fisrt Name, Last Name, Mobile Phone, Email, Work Phone, Agent Company Name and Address is checked
		else if (isset($_POST['Employer_ID']) && isset($_POST['First_Name']) && isset($_POST['Last_Name'])
	&& isset($_POST['Mobile_Number']) && isset($_POST['Email']) && isset($_POST['Work_Phone']) 
	&& isset($_POST['Agent_Company_Name'])  && isset($_POST['Address'])  ) { 
		
		$result = mysqli_query($con,"SELECT EMPLOYER_ID,FirstName,LastName,MobilePhone,Username_Email,WorkPhone,AGENT_COMPANY_NAME,Address FROM employer_agent_company");

		echo "<table border='1'>
			<tr>
				<th>Employer ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Work Phone</th>
				<th>Agent Company Name</th>
				<th>Address</th>

			</tr>";

		while($row = mysqli_fetch_array($result))
  		{
  			echo "<tr>";
  			echo "<td>" . $row['EMPLOYER_ID'] . "</td>";
  			echo "<td>" . $row['FirstName'] . "</td>";
  			echo "<td>" . $row['LasttName'] . "</td>";
  			echo "<td>" . $row['MobilePhone'] . "</td>";
  			echo "<td>" . $row['Username_Email'] . "</td>";
  			echo "<td>" . $row['WorkPhone'] . "</td>";
  			echo "<td>" . $row['AGENT_COMPANY_NAME'] . "</td>";
			echo "<td>" . $row['Address'] . "</td>";


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
