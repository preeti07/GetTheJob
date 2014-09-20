<?php 

ob_start();
session_start();
//require('../common/config.inc.php');
//require ('../common/mysqli_connect.php');
//$employerID = 2;
session_regenerate_id();
			
			
		//	$_SESSION['SESS_USERNAME'] = $member['UserName'];
		//	$_SESSION['SESS_PASSWORD'] = $member['PassWord'];
		//	$_SESSION['SESS_USERTYPE'] = $member['UserType'];
			$_SESSION['SESS_EMP_ID'] = 2;
			$ses_id = session_id();
			$_SESSION['SESS_ID'] = $ses_id;
			session_write_close();
if(!isset($_SESSION['SESS_EMP_ID'])) {
	header("location:http://localhost:8000/getthejob/index.html");
	exit();	
	}				
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Get The Job Home page for employer</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Newzealand's Job Search portal">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements --><!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
<![endif]-->
<link rel="stylesheet" href="../css/uniform.default.css" media="screen" />
<link rel="stylesheet" href="../css/uniform.aristo.css" media="screen" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

<script src="../js/jquery.uniform.js"></script>

<script type='text/javascript' src='http://code.jquery.com/jquery.min.js'></script>
<script type="text/javascript" src="js/jquery1_7_1_min.js"></script>
<script type="text/javascript" src="../js/emp_home_effects.js"></script>
<script src="../js/emp_panel.js" type="text/javascript"></script> 
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/bjqs.css">
<link href="../css/gtj1.css" rel="stylesheet" type="text/css">
<link href="../css/emp_home.css" rel="stylesheet" type="text/css">
<link href="../css/emp_home_listed_jobs.css" rel="stylesheet" type="text/css">
<link href="../css/emp_home_panel.css" rel="stylesheet" type="text/css">


<script type='text/javascript'>
    // On load, style typical form elements
    $(function () {
        //$("select").uniform();
		//$(".registrationform.select_box").uniform();
    });
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>     
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script language="JavaScript" type="text/javascript" src="../js/tabLib.js"></script> 
<script language="JavaScript" type="text/javascript">
function makeactive(tab) { 
document.getElementById("tab1").className = ""; 
document.getElementById("tab2").className = ""; 
document.getElementById("tab3").className = "";
document.getElementById("tab4").className = "";
document.getElementById("tab"+tab).className = "active";
callAHAH('employer_content.php?content= '+tab, 'emp_main_content',
     'getting content for tab '+tab+'. Wait...', 'Error'); 
} 
function nextPage(pageNo) {
	callAHAH('listed_jobs.php?pn= '+pageNo, 'emp_main_content',
     'getting content for listed jobs Wait...', 'Error');
	}
</script>   

</head>			
<body>
<div class="banner">
  <div class="cont">
    <div class="logo"> </div>
    <div class="login">
      <div class="welcome_tab">Welcome</div>
        <div class="contact_msg"><img src="../images/contactus.png" height="56"  /></div>
        <div class="adbtn"><img src="../images/ad.png" width="89" height="63" /> </div>
      
    </div>
  </div>
</div>
<div class="employer_home_content">
	<div class="upper_ribbon">
       <div class="grey_bg">
       <div class="upper_ribbon_left"></div>
    	  
          <span class="steps"> &nbsp; &nbsp; Carnie Consultants </span>
         <!-- <img src="../images/upper_ribbon_triangle.png" align="right"/> -->
       </div> 
        <div class="black_bg">
            <div class="grey_triangle"></div>
            <div class="panel">
                <ul id="employer_panel">
                    <li onClick="makeactive(1)"><a href="#" class="active" id="tab1"><div id="listed_job_icon"></div> Listed Jobs</a></li>
                    <li onClick="makeactive(2)"><a href="#" class="" id="tab2"><div id="expired_job_icon"></div> Expired Jobs</a></li>
                    <li onClick="makeactive(3)"><a href="#" class="" id="tab3"><div id="candidate_icon"></div> Candidates List</a></li>
                    <li onClick="makeactive(4)"><a href="#" class="" id="tab4"><div id="account_setting_icon1"></div> Account Settings</a></li>
                </ul>
            </div>
        </div>
    </div>
      <!-- end of upper_ribbon div  -->
    
    <div id="emp_main_content"> 
    <?php
	include('listed_jobs.php');
	?>
       <!--  <div id="listed_jobs">listed jobs</div>
         <div id="expired_jobs">expired jobs</div>
         <div id="cadidates_list">canidates jobs</div>
         <div id="account_settings">account jobs</div>  -->
	</div>
    <div id="emp_home_page_advertise_container">
    <p>Advert Space</p>
    
   
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
      <input type="image" src="../images/registerbtn.png">
    </li>
  </ul>
  <div class="right_img"> </div>
</div>
<div class="copyright"> 
&copy; All Rights Reserved to Carnie Consultancy &amp; Trading Ltd <span class="sn"> <img src="../images/fb.png"><img src="../images/twitter.png"><img src="../images/linkedin.png" ></span>
</div>

</body>
</html>
<?php
 ob_end_flush();
?>

      
      
      
      
      