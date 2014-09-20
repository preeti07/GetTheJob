<?php
session_start();
require('connection.php');
$conn = new createConnection();
$conn->connectToDatabase();
$conn->selectDatabase();
$employerId = 2;
	//This is the directory where images will be saved
$target = "images/logos/";
$target = $target . basename( $_FILES['companyLogo']['name']);
$pic = ($_FILES['companyLogo']['name']);
		

	$sql = "UPDATE employer_agent_company SET FirstName = '$_POST[fname]', LastName = '$_POST[lname]', Address = '$_POST[address]', Company_Agent_Logo = '$pic', MobilePhone = '$_POST[mobPhone]', WorkPhone = '$_POST[workPhone]', EmailForApplication = '$_POST[email]', Company_Agent_URL = '$_POST[companyUrl]', EMPLOYER_TYPE_ID = '$_POST[empType]', AGENT_COMPANY_NAME = '$_POST[agentComName]' WHERE EMPLOYER_ID = $employerId";
	var_dump($sql);
		$res = $conn->queryDatabase($sql);
		if($res === TRUE)
			{
				echo "Congratulation on successfully updated profile.";
				}
		else
			{
				echo "Could Not update your profile, please try again.";
				}
		//Writes the photo to the server
		if(move_uploaded_file($_FILES['companyLogo']['tmp_name'], $target))
		{
		
		//Tells you if its all ok
		echo "The file ". basename( $_FILES['companyLogo']['name']). " has been uploaded, and your information has been added to the directory";
		}
		else {
		
		//Gives and error if its not
		echo "Sorry, there was a problem uploading your file.";
		}
	$conn->closeConnection();
?>