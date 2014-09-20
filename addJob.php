<?php 
require('common/connection.php');
date_default_timezone_set('NZ');
 

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Job Posting</title>

<link href="css/formtt.css" rel="stylesheet" type="text/css" />

 <script src="http://code.jquery.com/jquery-1.3.2.js" type="text/javascript"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
   <script type="text/javascript" src="javascripts/areaCategory.js"></script>
  <script src="javascripts/jquery.validate.js" type="text/javascript"></script>
  <script type="text/javascript" src="javascripts/addJobsFieldValidation.js"> /* <![CDATA[ */  /* ]]> */</script>
  <script src="javascripts/previewJob.js" type="text/javascript"></script>
   
</head>

<body>
<h2>Post a Job here</h2>
 <?php
 foreach($_GET as $key => $value) {
    if(!empty($value)) {
        $post = $_GET['post'];
		$_POST['send'] = $post;
		echo $post;
	    $jobTitle = $_GET['jobtitle'];
		$_POST['jobTitle'] = $jobTitle;
		echo $jobTitle;
		 $jobDesc = $_GET['jobdesc'];
		$_POST['jobDesc'] = $jobDesc;
		echo $jobDesc;
		 $workType = $_GET['worktype'];
		$_POST['workType'] = $workType;
		 $district = $_GET['district'];
		$_POST['district'] = $district;
		 $subCategory  = $_GET['subcategory'];
		$_POST['subCategory'] = $subCategory;
		 $expLevel  = $_GET['explevel'];
		$_POST['expLevel'] = $expLevel ;
    } else {
        echo "No value found";
    }
}	
		
		
 if (array_key_exists('send', $_POST)){
	 print_r($_POST);
	
$conn = new createConnection();
$conn->connectToDatabase();
$conn->selectDatabase();		
$salary = 20000;
$dateOfAd = date("Y-m-d H:i:s");
$endDateOfAd = date('Y-m-d H:i:s', strtotime("+30 days"));

$employerId = 2;

	$sql = "INSERT INTO job (JobTitle, JobDescription, WorkTypeID, DistrictID, SubCategoryID, Salary, DateOfAdvertisement, EndDateOfAdvertisement,ExperienceLevel, EMPLOYER_ID) VALUES ('$_POST[jobTitle]', '$_POST[jobDesc]', '$_POST[workType]', '$_POST[district]', '$_POST[subCategory]', '$salary', '$dateOfAd', '$endDateOfAd', '$_POST[expLevel]', '$employerId')";
	var_dump($sql);
		$res = $conn->queryDatabase($sql);
		if($res === TRUE)
			{
				echo "<p> <Strong>Thanks for coming with us. Your Job has been posted. </Strong></p>
";
				}
		else
			{
				echo "Could not insert the record.";
				}
	
	$conn->closeConnection();
?>
	<?php 
	}
?>  
<p></p>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" name="addJobForm" id="addJobForm" class="addJobForm" enctype="application/x-www-form-urlencoded">
<table>
<tr><td><p><label for="jobTitle"><span id="astrick">*</span> Job Title:</label></td>
<td><input name="jobTitle" type="text" id="jobTitle" <?php if (isset($missing)){
	echo 'value="'.htmlentities($_POST['jobTitle']).'"'; }?>/></p></td></tr>
    
<tr><td><p><label for="jobDesc"><span id="astrick">*</span> Job Description:</label></td>
<td><textarea name="jobDesc" cols="30" rows="8" id="jobDesc" ><?php if (isset($missing)){
	echo htmlentities($_POST['jobDesc']); }?></textarea></p></td></tr>

<tr><td><p><label for="workType"> <span id="astrick">*</span> Work Type:</label></td>

<td><?php $conn1 = new createConnection(); // created a new object
			$conn1->connectToDatabase();
			$conn1->selectDatabase(); 
			$result = $conn1->queryDatabase("select WorkTypeID, WorkType from work_type");
				// printf("Select returned %d rows.\n", $result->num_rows); ?><select id="workType" name="workType" <?php if (isset($missing)){
	echo 'value="'.htmlentities($_POST['workType']).'"'; }?> >
     <option value="">Select Work Type</option>  
    <?php
				 while ($row = $result->fetch_assoc()) {

                  unset($WorkTypeID, $WorkType);
                  $id = $row['WorkTypeID'];
                  $desc = $row['WorkType']; 
				  echo '<option value="'.$id.'" name="'.$id.'"><div id="workTypeDesc">'.$desc.'</div></option>';
				 }
				 $conn1->closeConnection(); 
				  ?></select></p></td></tr>  
                  
<tr><td><p><label for="expLevel"> <span id="astrick">*</span> Required Experience Level:</label></td>

<td><?php $conn1 = new createConnection(); // created a new object
			$conn1->connectToDatabase();
			$conn1->selectDatabase(); 
			$result = $conn1->queryDatabase("select EXPERIENCE_LEVEL_DESCRIPTION from experience_level");
				// printf("Select returned %d rows.\n", $result->num_rows); ?><select id="expLevel" name="expLevel" <?php if (isset($missing)){
	echo 'value="'.htmlentities($_POST['expLevel']).'"'; }?> >
     <option value="">Select required experince level</option>  
    <?php
				 while ($row = $result->fetch_assoc()) {

                  unset($EXPERIENCE_LEVEL_DESCRIPTION);
                  $id = $row['EXPERIENCE_LEVEL_DESCRIPTION'];                 
				  echo '<option value="'.$id.'" name="'.$id.'">'.$id.'</option>';
				 }
				 $conn1->closeConnection(); 
				  ?></select></p></td></tr>    
                  
<tr><td><p><label for="region"> <span id="astrick">*</span> Which Region:</label></td>

<td><?php $conn1 = new createConnection(); // created a new object
			$conn1->connectToDatabase();
			$conn1->selectDatabase(); 
			$result = $conn1->queryDatabase("select RegionID, RegionName from region");
				// printf("Select returned %d rows.\n", $result->num_rows); ?><select id="region" name="region" <?php if (isset($missing)){
	echo 'value="'.htmlentities($_POST['region']).'"'; }?> >
     <option value="">Select Region</option>  
    <?php
				 while ($row = $result->fetch_assoc()) {

                  unset($RegionID, $RegionName);
                  $id = $row['RegionID'];
                  $desc = $row['RegionName']; 
				  echo '<option value="'.$id.'" name="'.$id.'">'.$desc.'</option>';
				 }
				 $conn1->closeConnection(); 
				  ?></select>
                  <select id="district" name="district">
                  <option value="">Please select district</option>
                  </select></p></td></tr>    
                  
<tr><td><p><label for="category"> <span id="astrick">*</span> Which Category:</label></td>

<td><?php $conn1 = new createConnection(); // created a new object
			$conn1->connectToDatabase();
			$conn1->selectDatabase(); 
			$result = $conn1->queryDatabase("select CategoryID, CategoryName from job_category");
				// printf("Select returned %d rows.\n", $result->num_rows); ?><select id="category" name="category" <?php if (isset($missing)){
	echo 'value="'.htmlentities($_POST['category']).'"'; }?> >
     <option value="">Select Category</option>  
    <?php
				 while ($row = $result->fetch_assoc()) {

                  unset($CategoryID, $CategoryName);
                  $id = $row['CategoryID'];
                  $desc = $row['CategoryName']; 
				  echo '<option value="'.$row['CategoryID'].'" name="'.$row['CategoryID'].'">'.$row['CategoryName'].'</option>';
				 }
				 $conn1->closeConnection(); 
				  ?></select>
                  <select id="subCategory" name="subCategory">
                  <option value="">Please select Sub Category</option>
                  </select></p></td></tr>    
    


<tr><td></td><td><input name="preview" id="preview" type="button" value="Preview this Job!"/><input name="send" type="submit" value="It is OK Post this Job" id="send"/></td></tr>
</table>
<?php  ?>




</form>
<div id='box'>
<h1>Job Posting confirmation</h1>
<table>
<tr><td>Job Title : </td><td><div id="jobTitlePreview"></div></td></tr>
<tr><td>Job Description : </td><td><div id="jobDescPreview"></div></td></tr>
<tr><td>Work Type : </td><td><div id="workTypePreview"></div></td></tr>
<tr><td>Experience : </td><td><div id="experiencePreview"></div></td></tr>
<tr><td>Region: </td><td><div id="districtPreview"></div></td></tr>
<tr><td>Sub Category : </td><td><div id="subCategoryPreview"></div></td></tr>

</table>
<input type="button" id="edit" name="edit" value="Edit" />
<input type="button" id="post" name="post" value="Post" />
</div>

<div id='screen'>
</div>

</body>
</html>