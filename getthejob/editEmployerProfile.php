<?php 
ob_start();
session_start();
require('common/connection.php');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Employer edit profile</title>

<link href="css/formtt.css" rel="stylesheet" type="text/css" />
 <script src="http://code.jquery.com/jquery-1.3.2.js" type="text/javascript"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
   <script>
   $(function()
   {
       
   })
	</script>	
  <script src="javascripts/jquery.validate.js" type="text/javascript"></script>
		<script type="text/javascript">
            /* <![CDATA[ */
            jQuery(function(){
               
				jQuery("#fname").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "Please enter the Required field"
                });
				jQuery("#lname").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "Please enter the Required field"
                });
				jQuery("#address").validate({
                    expression: "if (VAL.length > 0) return true; else return false;",
                    message: "Please enter the Required field"
                });
		/*		jQuery("#mobPhone").validate({
                    //expression: "if (VAL.match(/^[(021|022|025|027|028|029)][0-9]{7,9}$/)) return true; else return false;",
					expression: "if (VAL) return true; else return false;",
                    message: "Please enter a valid mobile number or work Phone."
                });  */
				jQuery("#workPhone").validate({
                    expression: "if ((VAL.match(/^[(03|04|06|07|09)][0-9]{8}|[(0508|0800|0900)][0-9]{6,9}$/)) ||  (jQuery('#mobPhone').val().match(/^[(021|022|025|027|028|029)][0-9]{7,9}$/))) return true; else return false;",
                    message: "Please enter a valid work phone or Mobile Phone"
                });
				jQuery("#email").validate({
                    expression: "if (VAL.match(/^[^\\W][a-zA-Z0-9\\_\\-\\.]+([a-zA-Z0-9\\_\\-\\.]+)*\\@[a-zA-Z0-9_]+(\\.[a-zA-Z0-9_]+)*\\.[a-zA-Z]{2,4}$/)) return true; else return false;",
                    message: "Please enter a valid Email ID"
                });
				jQuery("#agentComName").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "Please enter the Required field"
                });
                jQuery("#empType").validate({
                    expression: "if (VAL != '') return true; else return false;",
                    message: "Please make a selection"
                });
             
				jQuery('.empRegForm').validated(function(){
					//alert("Use this call to make AJAX submissions.");
				});
            });
            /* ]]> */
        </script>
</head>

<body>
<h2>Edit your profile here</h2>
 <?php
$employerId = 2;

$conn = new createConnection();
$conn->connectToDatabase();
$conn->selectDatabase();

	$sql = "Select * from employer_agent_company where EMPLOYER_ID = $employerId";
	var_dump($sql);
	$res = $conn->queryDatabase($sql);
	if($res)
	{
 		while($row = mysqli_fetch_array($res))
		{
  			$firstName =  $row['FirstName'];
			$lastName =  $row['LastName'];
			$address =  $row['Address'];
			$email = $row['EmailForApplication'];
			$logo =  $row['Company_Agent_Logo'];
			$mobile =  $row['MobilePhone'];
			$workPhone =  $row['WorkPhone'];
			$companyUrl =  $row['Company_Agent_URL'];
			$employerType =  $row['EMPLOYER_TYPE_ID'];
			$agentCompanyName =  $row['AGENT_COMPANY_NAME'];
			echo $firstName;
			echo $lastName;
			echo $email;
		
		}
  	}
	else
	{
	echo "Could not find this employer's record";
	}
	
	$conn->closeConnection();
?>
<form action="common/editEmpProfile.php" method="post" name="empEditForm" id="empEditForm" enctype="multipart/form-data">
<table>


<tr><td><p><label for="fname"><span id="astrick">*</span> First Name:</label></td>
<td><input name="fname" type="text" id="fname" class="grayField" value="<?php echo $firstName; ?>" /></p></td></tr>
    
<tr><td><p><label for="lname"> <span id="astrick">*</span> Last Name:</label></td>
<td><input name="lname" type="text" id="lname" class="grayField" value="<?php echo $lastName; ?>"/></p></td> </tr> 
    
<tr><td><p><label for="address"><span id="astrick">*</span> Address:</label></td>
<td><textarea name="address" cols="30" rows="3" id="address" class="grayField" ><?php echo $address; ?></textarea></p></td></tr>

<tr><td><p><label for="mobPhone">Mobile:</label></td>
<td><input name="mobPhone" type="text" id="mobPhone" class="grayField" value="<?php echo $mobile; ?>"/></p> </td> </tr>
    
<tr><td><p><label for="workPhone">Work Phone:</label></td>
<td><input name="workPhone" type="text" id="workPhone" class="grayField" value="<?php echo $workPhone; ?>"/></p></td>  </tr>

<tr><td><p><label for="email"><span id="astrick">*</span> Email:</label></td>
<td><input name="email" type="text" id="email" class="grayField" value="<?php echo $email; ?>" /></p></td></tr>

<tr><td><p><label for="agentComName"><span id="astrick">*</span> Agent/Company Name:</label></td>
<td><input name="agentComName" type="text" id="agentComName" class="grayField" value="<?php echo $agentCompanyName; ?>" /></p></td></tr>

<tr><td><p>
	<input type="hidden" name="size" value="350000">
    <label for="companyLogo">Company/Agent Logo:</label></td>
<td><input name="companyLogo" type="file" id="companyLogo" class="grayField" />
</p></td></tr>

<tr><td><p><label for="companyUrl">Company/Agent URL:</label></td>
<td><input name="companyUrl" type="text" id="companyUrl" class="grayField" value="<?php echo $companyUrl; ?>" /></p></td></tr>

<tr><td><p><label for="empType"> <span id="astrick">*</span> Employer Type:</label></td>

<td><?php $conn1 = new createConnection(); // created a new object
			$conn1->connectToDatabase();
			$conn1->selectDatabase(); 
			$result = $conn1->queryDatabase("select EMPLOYER_TYPEID, EMPLOYER_TYPE_DESCRIPTION from employer_type");
				 printf("Select returned %d rows.\n", $result->num_rows); ?><select id="empType" name="empType" class="grayField" value="<?php echo $employerType; ?>" >
     <option value="">Select employer type</option>  
    <?php 
			
				 
				// echo "$result->EMPLOYER_TYPEID";
				 //echo "$result->EMPLOYER_TYPE_DESCRIPTION";
				 while ($row = $result->fetch_assoc()) {

                  unset($EMPLOYER_TYPEID, $EMPLOYER_TYPE_DESCRIPTION);
                  $id = $row['EMPLOYER_TYPEID'];
                  $desc = $row['EMPLOYER_TYPE_DESCRIPTION']; 
				  echo '<option value="'.$id.'" name="'.$id.'">'.$desc.'</option>';
				 }
				 $conn1->closeConnection(); 
				  ?></select></p></td></tr>


<tr><td></td><td><p><input name="send" type="submit" value="Upddate Profile"/></p></td></tr>
</table>
<?php  ?>




</form>

</body>
</html>
<?php
 ob_end_flush();
?>










