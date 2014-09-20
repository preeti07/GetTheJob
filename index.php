<?php ob_start(); ?>
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

<link rel="stylesheet" href="css/uniform.aristo.css" media="screen" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="js/jquery.uniform.js"></script>

<!--<script type="text/javascript" src="js/jquery1_7_1_min.js"></script>-->

<script src="js/bjqs-1.3.min.js"></script>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script> 
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/bjqs.css">
<link href="css/gtj.css" rel="stylesheet" type="text/css">
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css">
<link href="css/footer.css" rel="stylesheet" type="text/css">
<link href="css/searchjob.css" rel="stylesheet" type="text/css">
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
<div class="advanced_search"><img src="images/arrow_collapsed.png" width="9" height="8" alt="expand">Advanced Search </div>
<div class="tab_content">
<div class="imgabtus"> <!--  Outer wrapper for presentation only, this can be anything you like -->
  <div id="banner-slide"> 
    
    <!-- start Basic Jquery Slider -->
    <ul class="bjqs">
      <li><a href=""><img src="images/slide01.png" title="About Us: This is text holder to show the actual placement of the text to give an idea"></a></li>
      
      
         <!--     <li><img src="images/slide02.png" title="Coaching Services: This is text holder to show the actual placement of the text to give an idea"></li>
              
              
<li><img src="images/slide03.png" title="Title03: This is text holder to show the actual placement of the text to give an idea"></li>


          <li><img src="images/slide04.png" title="Title04: This is text holder to show the actual placement of the text to give an idea"></li>-->
    </ul>
    <!-- end Basic jQuery Slider --> 
    
  </div>
  <!-- End outer wrapper --> 
  
  <!-- attach the plug-in to the slider parent element and adjust the settings as required --> 
  <script class="secret-source">
        jQuery(document).ready(function($) {
          
          $('#banner-slide').bjqs({
            animtype      : 'slide',
            height        : 235,
            width         : 310,
            responsive    : true,
            randomstart   : true
          });
          
        });
      </script></div>
<div class="tab_container">
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">Top Companies</li>
    <li class="TabbedPanelsTab" tabindex="0">Top Consultants</li>
    <li class="TabbedPanelsTab" tabindex="0">Hot Jobs</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent"><img src="images/partnerlogos.jpg" width="359" height="94"></div>
    <div class="TabbedPanelsContent">Content 2</div>
    <div class="TabbedPanelsContent">Content 3</div>
  </div>
</div>
<div class="searchjob">
<div class="search">SEARCH JOBS BY<br/>
<ul id="links">
<li><span  style= " color:#FF0000;"> Major Cities : </span></li>
<li><a href="include/Cityfilter.php?region_id=1" class="active">Auckland</a></li>
<li><a href="include/Cityfilter.php?region_id=14" class="">Wellington</a></li>
<li><a href="include/Cityfilter.php?region_id=7" class=""> Hamilton</a></li>
<li><a href="include/Cityfilter.php?region_id=56" class=""> Christchurch</a></li>
<li><a href="include/Cityfilter.php?region_id=15" class=""> Tauranga</a></li>
<li><a href="include/Cityfilter.php?region_id=8" class=""> Nelson</a></li>
</ul>
<ul id="links">
<li><span  style= " color:#FF0000;">Industry:</span></li> 
<li>&emsp;<a href="include/Industryfilter.php?category_id=12" class="" id="tab7"> IT&Telecommunications</a></li>
<li><a href="include/Industryfilter.php?category_id=10" class="" id="tab8"> Hospitality&Tourism</a></li>
<li><a href="include/Industryfilter.php?category_id=1" class="" id="tab9"> Accounting</a></li>
<li><a href="include/Industryfilter.php?category_id=7" class="" id="tab10"> Engineering</a></li>
</ul>
</div>			
</div>
</div>
</div>
</div>
<div id="footer"><?php include("common/footer.php"); ?></div>
<div class="copyright"> 
&copy; All Rights Reserved to Carnie Consultancy &amp; Trading Ltd <span class="sn"> <img src="images/fb.png"><img src="images/twitter.png"><img src="images/linkedin.png" ></span>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body>
</html>
