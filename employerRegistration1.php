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
    	  
          <span class="steps"> &nbsp; &nbsp; You are at step 1 of 3 </span>
          <img src="images/upper_ribbon_triangle.png" align="right"/>
       </div> 
       <div class="black_bg">
        <span>
          <div id="level1" style="display:inline-block;"><div id="c1" class="circle" style="display:inline-block;"><p> 1 </p></div>  Login Details &nbsp; &nbsp;</div>
      
           <div id="level2" style="display:inline-block;"><div id="c2" class="white_circle" style="display:inline-block;"><p> 2 </p></div> Company Details &nbsp; &nbsp;</div> 
     
           <div id="level3" style="display:inline-block;"><div id="c3" class="white_circle" style="display:inline-block;"><p> 3 </p></div> Contact Details</div>
       
         </span>
       </div>
    </div>
      <!-- end of upper_ribbon div  -->
    
    <div class="registrationform"> 
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" name="empRegForm" id="empRegForm" class="empRegForm" enctype="multipart/form-data">

    	<div id="step1">
               <p><label class="firstLabel" for="uname"><span id="astrick">*</span> Username: </label>
        <input name="uname" type="text" id="uname" <?php if (isset($missing)){
            echo 'value="'.htmlentities($_POST['uname']).'"'; }?>/>
             <span class="availability_status"></span> </p>
             
        <p><label for="email"><span id="astrick">*</span> Email:  </label>
        <input name="email" type="text" id="email" <?php if (isset($missing)){
            echo 'value="'.htmlentities($_POST['email']).'"'; }?> />
            <span class="availability_status_email"></span></p>
            
     <!--   <p><label for="pwd1"><span id="astrick">*</span> Password:</label>
        <input name="pwd1" type="password" id="pwd1" <?php /*if (isset($missing)){
            echo 'value="'.htmlentities($_POST['pwd1']).'"'; } */?>/>
             <span class="availability_status_pwd1"></span></p>   -->
        <label for="pwd1" class="inline"><span id="astrick">*</span>Password:</label>
        <input name="pwd1" type="password" id="pwd1" <?php if (isset($missing)){
            echo 'value="'.htmlentities($_POST['pwd1']).'"'; } ?>/>
             <span class="availability_status_pwd1"><div id="passwordDescription">Password not entered</div>

                        <div id="passwordStrength" class="strength0"></div></span><br/>
            
        <p><label for="pwd2"><span id="astrick">*</span>Confirm Password:</label>
        <input name="pwd2" type="password" id="pwd2" <?php if (isset($missing)){
            echo 'value="'.htmlentities($_POST['pwd2']).'"'; }?>/>
             <span class="availability_status_pwd2"></span></p>
            
         
             <br/>
            <hr/>
           <div class="lower_ribbon"> 
            <div class="step_no">You &nbsp;are&nbsp; at &nbsp;step&nbsp;&nbsp; <span class="red">1</span>&nbsp;&nbsp; &nbsp;&nbsp; <span class="grey">2</span>&nbsp;&nbsp; &nbsp;&nbsp;  <span class="grey">3</span>&nbsp;&nbsp;</div>
          <div> <input type="button" name="b1" id="b1" title="Next" class="b1" disabled value="next"/><img src="images/next_btn_grey.png" width="87" height="35" class="b11" /> </div>
            </div>
       </div>   
       <div id="step2">
    <p><label for="companyUrl" class="firstLabel"> <span id="astrick">*</span> Company Website: </label>
<input name="companyUrl" type="text" id="companyUrl" <?php if (isset($missing)){
	echo 'value="'.htmlentities($_POST['companyUrl']).'"'; }?> />
     <span class="vaidation_company_url"></span></p>
   
    
   <label for="empType"  class="inline" > <span id="astrick">*</span> Company/Employer Type: </label>

<?php 
		$q = "select employer_type_id, employer_description from employer_type";
		$result = mysqli_query($dbc ,$q ) or trigger_error("Query: $q\n<br />MySQL Error: " . mysqli_error($dbc));
	 ?>
    <div class="select_box"><select id="empType" name="empType"  <?php if (isset($missing)){
	echo 'value="'.htmlentities($_POST['empType']).'"'; }?> >
     <option value=""></option>  
    <?php 
			
				 while ($row = $result->fetch_assoc()) {

                  unset($employer_type_id, $employer_description);
                  $id = $row['employer_type_id'];
                  $desc = $row['employer_description']; 
				  echo '<option value="'.$id.'" name="'.$id.'">'.$desc.'</option>';
				 }
				 mysqli_close($dbc);  
				  ?></select></div> 
                 <span class="vaidation_empType"></span><br/>
                  
       <p><label for="companyName"> <span id="astrick">*</span> Company No : </label>
<input name="companyName" type="text" id="companyName" <?php if (isset($missing)){
	echo 'value="'.htmlentities($_POST['companyName']).'"'; }?> />
     <span class="availability_companyName"></span></p>
    
 <!--  <p>  
    	<label for="companyLogo"> &nbsp; &nbsp;Add Logo: </label> 
         <div class="fileinputs" style="display:inline; >	
        <input type="hidden" name="size" value="350000" size="0">
		<input name="companyLogo" type="file" id="companyLogo" size="0" class="file" style="display:inline;"/>
			<div class="fakefile" ">
			<input size="0" hidden/>
			<img src="images/upload_btn_grey.png" />
			</div>
		</div>
        <div class="empLogo" style="display:inline;">
        <img id="blah" src="#" alt="Image Preview"  width="100px" />
        </div> 
       </p>    -->      
 <!--      <p>
       <label for="companyLogo" > &nbsp; &nbsp;Add Logo: </label> 
       <input type="hidden" name="size" value="350000">
       <div class="fm-item">
            <input type="file" name="file" id="upload-file" />
        </div>
        <div class="fm-item" >
            <button type="button" id="upload-button"></button>
            <span id="file-name"></span>
        </div>
         <div class="empLogo">
        <img id="blah" src="#" alt="Image Preview"  width="100px" />
        </div>
       </p>  -->
            <p >
       <label for="companyLogo" style="display:inline-block;"> &nbsp; &nbsp;Add Logo: </label> 
       <input type="hidden" name="size" value="350000">
       <input type="file" name="file" id="file" title="logo should not be more than 350KB in size" class="file" style="display:inline-block;"/><img src="images/upload_btn_grey.png" width="72" height="30" class="file1" style="display:inline-block;"/>
        <img id="blah" src="images/logo_preview.png" alt="Logo Preview" style="display:inline-block;"/>
         <span class="file_error"></span> 
       </p>         
              <br/>
              <hr/>
           <div class="lower_ribbon"> 
            <div class="step_no">You &nbsp;are&nbsp; at &nbsp;step&nbsp;&nbsp;<a href="#step1" class="one"><span class="black">1</span></a> &nbsp;&nbsp; &nbsp;&nbsp;<span class="red">2</span> &nbsp;&nbsp;&nbsp;  <span class="grey"> 3&nbsp;&nbsp;</span> </div>
            <div> <input type="button" name="b2" id="b2" title="Next" class="b2" disabled value="next"/><img src="images/next_btn_grey.png" width="87" height="35" class="b22" /> </div>
            </div>     

        </div>
       <div id="step3">
             <p><label for="physicalAddress" class="firstLabel"><span id="astrick">*</span> Physical Address: </label>
            <input name="physicalAddress" type="text" id="physicalAddress" <?php if (isset($missing)){
                echo 'value="'.htmlentities($_POST['physicalAddress']).'"'; }?>/>
                <span class="add1_valid"></span></p>
                 
            <p><label for="postalAddress"><span id="astrick">*</span> Postal Address: </label>
            <input name="postalAddress" type="text" id="postalAddress" <?php if (isset($missing)){
                echo 'value="'.htmlentities($_POST['postalAddress']).'"'; }?> /> 
                <span class="add2_valid"></span></p>
                
            <p><label for="workPhone"><span id="astrick">*</span> Phone No: </label>
            <input name="workPhone" type="text" id="workPhone" <?php if (isset($missing)){
                echo 'value="'.htmlentities($_POST['workPhone']).'"'; }?>/>
                <span class="p1_valid"></span></p>
                
            <p><label for="mobPhone"><span id="astrick">*</span> Mobile No: </label>
            <input name="mobPhone" type="text" id="mobPhone" <?php if (isset($missing)){
                echo 'value="'.htmlentities($_POST['mobPhone']).'"'; }?>/>
                <span class="p2_valid"></span></p>
                 <br/>
                <hr/>
               <div class="lower_ribbon"> 
                <div class="step_no">You &nbsp;are&nbsp; at &nbsp;step&nbsp;&nbsp; <a href="#step1" class="one"><span class="black">1</span></a>&nbsp;&nbsp; &nbsp;&nbsp; <span class="black"><a href="#step2" class="two">2</a>&nbsp;&nbsp;</span> &nbsp;&nbsp;  <span class="red">3</span>&nbsp;&nbsp; </div>
             <input type="image" value="submit" src="images/finish_btn_grey.png" form="empRegForm" title="Finish"  width="87" height="35" id="b3" name="b3" class="b3" disabled/>
                </div>
        </div>
       
 </form>     
	</div>
</div>
    
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

      
      
      
      
      