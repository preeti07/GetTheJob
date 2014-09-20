<?php
ob_start();
require('common/config.inc.php');
require ('common/mysqli_connect.php');
session_start();
$_SESSION['SESS_EMP_EMAIL_ID'] = "dddd@dd.dd";
if(isset($_SESSION['SESS_EMP_EMAIL_ID']))
$email_id =$_SESSION['SESS_EMP_EMAIL_ID'];
?>

<?php
$name = "";
$msg = "";
//$email_id = "";
//$msgToDisplay = "";
if(isset($_GET['msg']) && isset($_GET['name']) && isset($_GET['email_id']))
{
	$name = $_GET['name'];
	$msg = $_GET['msg'];
	$email_id = $_GET['email_id'];			
}
else
$msg = "";
//header("location:index.php");
if(isset($_GET['error_msg']))
{
//$msgToDisplay = $_GET['error_msg'];
$msg = "keyword";
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Job Alert at getthejob site</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Newzealand's Job Search portal">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements --><!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
<![endif]-->

<link rel="stylesheet" href="css/uniform.aristo.css" media="screen" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="js/jquery.uniform.js"></script>

<!--<script type="text/javascript" src="js/jquery1_7_1_min.js"></script>-->

<script src="js/bjqs-1.3.min.js"></script>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<script type="text/javascript" src="javascripts/areaCategory.js"></script>
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/bjqs.css">
<link href="css/gtj.css" rel="stylesheet" type="text/css">
<link href="css/job_alert.css" rel="stylesheet" type="text/css">
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(document).ready(function(){
		$('#navigation ul a').click(function(){
			$('#navigation ul a').removeClass('selected');
			$(this).addClass('selected');
			$('#content_changer').html('You have selected '+ $(this).html());
		});
	});
</script>
<script type='text/javascript'>
    // On load, style typical form elements
    $(function () {
        $("select").uniform();
    });
</script>
</head>			

<body>
<div class="banner">
  <div class="cont">
    <div class="logo"> </div>
    <div class="login">
      <div class="login_tab">Job Seeker Register</div>
      <div class="login_fields">
        <form id="login">
        </form>
        <div>Email&nbsp;&nbsp;
          <input type="text" autocomplete="on" form="login" id="email" required autofocus name="email">
          &nbsp;&nbsp;Password&nbsp;&nbsp;
          <input type="password" form="login" id="password" required name="password">
          &nbsp;&nbsp;&nbsp;
          <div class="login_btn">
            <input type="image" form="login" title="Login" src="images/btn.png" width="54" height="24">
          </div>
        </div>
        <div class="adbtn"><img src="images/ad.png" width="89" height="63"> </div>
        <span class="login_sec">
        <input name="Remember me" type="checkbox" id="Remember me" form="login" title="Remember me">
        &nbsp;Remember me</span> <span class="forgot_pw">Forgot Password</span> </div>
    </div>
  </div>
</div>
<div class="content">
  <div class="searchbox"> <span> Get the jobs </span>
    <div>
      <input type="text" value="Skill area, Job Title, Etc.">
      <select>
        <option>Location</option>
      </select>
      <select>
        <option>Category</option>
      </select>
      <input class="btn_get"type="image" name="imageField" id="imageField" src="images/getbtn.png">
    </div>
  </div>
  <div class="advanced_search"><img src="images/arrow_collapsed.png" width="9" height="8" alt="expand">Advanced Search
  </div>
    
  <div id="job_alert_box">
  	  <h3>Create a Job Alert Mail</h3>
      <?php 
	    if($msg === "ah80")
	  	echo "<h4>$email_id is already registered with us for job alerts. If you would like you can make it more effiecient by telling us your preferences as in below form.</h4>"; 
		else if($msg === "ah85")
		echo "<h4>$name, Thanks for registering with us for getting job alerts, Now you will get new posted jobs directly in your inbox before others. You can help us in sending more selected jobs to you by filling out below form.</h4>";
		else if($msg === "ah88")
		echo "<h4>$name, Sorry!! Seems some internal problem please try again later to register for job alerts or <a href='contact_us.php'>click here</a> for contact us regarding this technical problem</h4>";
		else if($msg === "keyword")
		echo "<div class='field_empty_msg'>Please enter keywords.</div>";
		
		//header("location:index.php"); ?>
        <div class="job_alert_filters">
        	<form name="job_alert_filters_form" id="job_alert_filters_form" method="post" action="include/seeker_job_alert.php" enctype="multipart/form-data">
            <?php if($msg == "") {?>
            <label>Name</label>
            <input type="text" value="" maxlength="49" name="alert_name" required />
            <label>Email ID</label>
            <input type="email" value="Enter email" maxlength="99" name="alert_email" required autocomplete="on"/> </br>
            <?php }
			else echo "<input type='hidden' value='".$email_id."' maxlength='99' name='alert_email'/>
						<input type='hidden' value='".$name."' maxlength='49' name='alert_name'/>"; ?>  
            <label>Keywords</label>
            <input type="text" value="Enter Keyword(s)" maxlength="99" name="alert_keyword" required />
            &emsp; &emsp; &emsp; &emsp; &emsp;&emsp;<label>Salary Range</label>
            <input type="text" value="" maxlength="9" name="alert_salary" /> <br>
            
            <label>Category</label>
            <?php $query1 = "select category_id, category_name from job_category";
				  $result = mysqli_query($dbc, $query1); ?>
            <select id="category" name="category" <?php if (isset($missing)){
			echo 'value="'.htmlentities($_POST['category']).'"'; }?> >
     			<option value="">Any Category</option>  
    			<?php
				 while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                  unset($category_id, $category_name);
                  $id = $row['category_id'];
                  $desc = $row['category_name']; 
				  echo '<option value="'.$row['category_id'].'" name="'.$row['category_id'].'">'.$row['category_name'].'</option>';
				 }
				  ?></select>
               <label>Location</label>
            <?php $query1 = "select region_id, region_name from region";
				  $result = mysqli_query($dbc, $query1); ?>
            <select id="region" name="region" <?php if (isset($missing)){
			echo 'value="'.htmlentities($_POST['region']).'"'; }?> >
     			<option value="">Any Location</option>  
    			<?php
				 while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                  unset($region_id, $region_name);
                  $id = $row['region_id'];
                  $desc = $row['region_name']; 
				  echo '<option value="'.$row['region_id'].'" name="'.$row['region_id'].'">'.$row['region_name'].'</option>';
				 }
				  ?></select>  </br>
            &emsp; &emsp; &emsp; &emsp; &emsp;<select id="subCategory" name="subCategory">
                  <option value="">Any Sub Category</option>
                  </select>
            &emsp; &emsp; &emsp; &emsp; <select id="district" name="district">
                  <option value="">Any Area</option>
                  </select>  </br>           
                  
             <label>Work Type</label>
            <?php $query1 = "select work_type_id, work_type from work_type";
				  $result = mysqli_query($dbc, $query1); ?>
            <select id="alert_work_type" name="alert_work_type" <?php if (isset($missing)){
			echo 'value="'.htmlentities($_POST['alert_work_type']).'"'; }?> >
     			<option value="">Choose work type</option>  
    			<?php
				 while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                  unset($region_id, $region_name);
                  $id = $row['work_type_id'];
                  $desc = $row['work_type']; 
				  echo '<option value="'.$row['work_type_id'].'" name="'.$row['work_type_id'].'">'.$row['work_type'].'</option>';
				 }
				  ?></select>   
                  <input type="image" src="images/registerbtn.png" name="job_alert_filter_save_button" value="Save my preferences" title="Save preferences for my job alert "> 
        	</form>
        </div>
  </div>
  <div id="emp_home_page_advertise_container">
    <p>Advert Space</p>
    
   
  </div>
</div>
<div id="footer"><?php include("common/footer.php"); ?></div>
<div class="copyright"> 
&copy; All Rights Reserved to Carnie Consultancy &amp; Trading Ltd <span class="sn"> <img src="images/fb.png"><img src="images/twitter.png"><img src="images/linkedin.png" ></span>
</div>

</body>
</html>
