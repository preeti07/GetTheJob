<?php 
//ini_set("SMTP","smtp.example.com" ); 
//ini_set('sendmail_from', 'user@example.com'); 
?>
<?php 

ob_start();
session_start();
require('common/config.inc.php');
require ('common/mysqli_connect.php');
if ($_SERVER['REQUEST_METHOD'] == 'POST') { 
	//require (MYSQL);
	$target = "images/logos/";
    $target = $target . basename( $_FILES['file']['name']);
    $pic = ($_FILES['file']['name']);
	$logo_size = ($_FILES['file']['size']);
	
	$trimmed = array_map('trim', $_POST);
	
	
	$q = "SELECT employer_type_id FROM employer_agent_company WHERE user_email='$_POST[uname]'";
	$r = mysqli_query ($dbc, $q) or trigger_error("Query: $q\n<br />MySQL Error: " . mysqli_error($dbc));
	
	if (mysqli_num_rows($r) == 0) { // Available.
		// $a = md5(uniqid(rand(), true));
		  $q = "INSERT INTO login (user_name, pass_word, user_role, last_login, active) VALUES ('$_POST[uname]', SHA1('$_POST[pwd1]'), '2', NOW(), '0' )";
		  $r = mysqli_query ($dbc, $q) or trigger_error("Query: $q\n<br />MySQL Error: " . mysqli_error($dbc));
		 $last_inserted_mysql_id = mysqli_insert_id($dbc);
		  $q1 = "INSERT INTO employer_agent_company (address, company_logo, postal_address, mobile_phone, work_phone, email, company_url, employer_type_id, company_name, user_email, login_id) VALUES ('$_POST[physicalAddress]', '$pic', '$_POST[postalAddress]', '$_POST[mobPhone]', '$_POST[workPhone]', '$_POST[email]', '$_POST[companyUrl]', '$_POST[empType]',  '$_POST[companyName]', '$_POST[uname]', '$last_inserted_mysql_id')";
		//  var_dump($q1);
		  $r1 = mysqli_query ($dbc, $q1) or trigger_error("Query: $q\n<br />MySQL Error: " . mysqli_error($dbc));
		  move_uploaded_file($_FILES['file']['tmp_name'], $target);
  
		  if (mysqli_affected_rows($dbc) == 1) { // If it ran OK.

				  $Name = "Da Duder"; //senders name
				  $email = "email@address.com"; //senders e-mail adress
				  $recipient = "PersonWhoGetsIt@emailadress.com"; //recipient
				  $mail_body = "The text for the mail..."; //mail body
				  $subject = "Subject for reviever"; //subject
				  $header = "From: ". $Name . " <" . $email . ">\r\n"; //optional headerfields
				  
				  ini_set('sendmail_from', 'me@domain.com'); //Suggested by "Some Guy"
				  
				 // mail($recipient, $subject, $mail_body, $header); //mail command :)

			//	$body = "Thank you for registering at <whatever site>. To activate your account, please click on this link:\n\n";
			//	$body .= BASE_URL . 'activate.php?x=' . urlencode($_POST['email']) . "&y=$a";
			//	mail($_POST['email'], 'Registration Confirmation', $body, 'From: admin@sitename.com');
				
				// Finish the page:
				echo '<h3>Thank you for registering! A confirmation email has been sent to your address. Please click on the link in that email in order to activate your account.</h3>';
				//include ('includes/footer.html'); // Include the HTML footer.
				exit(); // Stop the page.
				
			}
			else 
			{ // If it did not run OK.
				echo '<p class="error">You could not be registered due to a system error. We apologize for any inconvenience.</p>';
			}
			
		} 
		else
		{ // The email address is not available.
			echo '<p class="error">That email address has already been registered. If you have forgotten your password, use the link at right to have your password sent to you.</p>';
		}
		
	}
 
 //	mysqli_close($dbc);
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Newzealand's Job Search portal">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements --><!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
<![endif]-->
<link rel="stylesheet" href="css/uniform.default.css" media="screen" />
<link rel="stylesheet" href="css/uniform.aristo.css" media="screen" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

<script src="js/jquery.uniform.js"></script>

<script type='text/javascript' src='http://code.jquery.com/jquery.min.js'></script>
<script type="text/javascript" src="js/jquery1_7_1_min.js"></script>
<script src="js/bjqs-1.3.min.js"></script>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/bjqs.css">
<link href="css/gtj1.css" rel="stylesheet" type="text/css">
<link href="css/registration.css" rel="stylesheet" type="text/css">


<script type='text/javascript'>
    // On load, style typical form elements
    $(function () {
        //$("select").uniform();
		//$(".registrationform.select_box").uniform();
    });
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
    <script type="text/javascript" src="js/formToWizard.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
       
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
   <script type="text/javascript" src="validation/wizardValidation.js"></script>
   
   <!-- <script type="text/javascript">
            $(function(){
                $("#upload-file").addClass('hide-file');
                //$("#upload-button").text("Choose file");
                $("#upload-button").click(function(){
                    if($('#upload-file').val()){
                        return true;
                    }
                    $("#upload-file").click()
                    return false;
                });
                $("#upload-file").change(function(){
                    var file = $('#upload-file').val();
                    if(file){
                        // fix on webkit, and IE
                        file = file.substr(file.lastIndexOf("\\")+1);
                        $("#file-name").text(file);
                       // $("#upload-button").text("Upload file");
                    }
                });
            });
        </script>    -->
 <!-- <script src="javascripts/jquery.validate.js" type="text/javascript"></script>
		<script type="text/javascript">
            /* <![CDATA[ */
            
            /* ]]> */
        </script>         -->

</head>			
<body>
<div class="banner">
  <div class="cont">
    <div class="logo"> </div>
    <div class="login">
      <div class="welcome_tab">Welcome</div>
        <div class="contact_msg"><img src="images/contactus.png" height="56"  /></div>
        <div class="adbtn"><img src="images/ad.png" width="89" height="63"> </div>
      
    </div>
  </div>
</div>
<div class="content">
	<div class="upper_ribbon">
       <div class="grey_bg">
       <div class="upper_ribbon_left"></div>
    	  
          <span class="steps"> &nbsp; &nbsp; Carnie Consultants </span>
          <img src="images/upper_ribbon_triangle.png" align="right"/>
       </div> 
       <div class="black_bg">
        <ul>
        <li>Listed Jobs</li>
        <li>Expired Jobs</li>
        <li>Candidates List</li>
        <li>Listed Jobs</li>
        </ul>
       </div>
    </div>
      <!-- end of upper_ribbon div  -->
    <div class="main_content">
    
    </div>
    
</div>
 <!-- end of content div  -->
    
    <div class="footer_container">
  <div class="left_img"> </div>
  <ul class="footermenu1">
    <li><img src="images/abtget.jpg" alt="About get-the-job.co.nz " width="147" height="11"></li>
    <li>Contact Us </li>
    <li>Privacy </li>
    <li>Support and FAQ's </li>
    <li>Partner with us </li>
    <li><img src="images/gthlog.jpg" width="112" height="11" alt=""> Terms & Conditions </li>
  </ul>
  <ul class="footermenu2">
    <li>Coaching Services </li>
    <li>CV & Cover letter writing </li>
    <li>Employment & Life coaching</li>
    <li>Prepare Behavioural interviewing </li>
  </ul>
  <ul class="footermenu3">
    <li>Get Job Experience </li>
    <li>Place FREE Job Experience Ad</li>
    <li class="txt_color">Register for Job Alerts </li>
    <li class="txt_register">Name &nbsp;
      <input type="text">
    </li>
    <li>Email &nbsp;&nbsp;
      <input type="text">
      &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="image" src="images/registerbtn.png">
    </li>
  </ul>
  <div class="right_img"> </div>
</div>
<div class="copyright"> 
&copy; All Rights Reserved to Carnie Consultancy &amp; Trading Ltd <span class="sn"> <img src="images/fb.png"><img src="images/twitter.png"><img src="images/linkedin.png" ></span>
</div>

</body>
</html>
<?php
 ob_end_flush();
?>

      
      
      
      
      