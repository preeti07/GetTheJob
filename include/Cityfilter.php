<?php 
?>
<?php 
ob_start();
session_start();
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Get The Job Home page for employer</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Newzealand's Job Search portal">
<link rel="stylesheet" href="../css/uniform.default.css" media="screen" />
<link rel="stylesheet" href="../css/uniform.aristo.css" media="screen" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

<script src="js/jquery.uniform.js"></script>

<script type='text/javascript' src='http://code.jquery.com/jquery.min.js'></script>
<script type="text/javascript" src="../js/jquery1_7_1_min.js"></script>
<script type="text/javascript" src="../js/emp_home_effects.js"></script>
<script src="../js/bjqs-1.3.min.js"></script>
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<script src="../js/emp_panel.js" type="text/javascript"></script> 
<link href="../css/normalize.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/bjqs.css">
<link href="../css/gtj1.css" rel="stylesheet" type="text/css">
<link href="../css/registration.css" rel="stylesheet" type="text/css">
<link href="../css/searchjob.css" rel="stylesheet" type="text/css">
<link href="../css/emp_home.css" rel="stylesheet" type="text/css">
<link href="../css/emp_home_listed_jobs.css" rel="stylesheet" type="text/css">
<link href="../css/emp_home_panel.css" rel="stylesheet" type="text/css">


<script type='text/javascript'>
       $(function () {
           });
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>     
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script language="JavaScript" type="text/javascript" src="../js/tabLib.js"></script> 
<script language="JavaScript" type="text/javascript">
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
            <input type="image" form="login" title="Login" src="../images/btn.png" width="54" height="24">
          </div>
        </div>
        <div class="adbtn"><img src="../images/ad.png" width="89" height="63"> </div>
        <span class="login_sec">
        <input name="Remember me" type="checkbox" id="Remember me" form="login" title="Remember me">
        &nbsp;Remember me</span> <span class="forgot_pw">Forgot Password</span> </div>
    </div>
  </div>
</div></div>

<div class="employer_home_content">
<div class="searchbox"> <span> Get the jobs </span>
  <div>
    <input type="text" value="Skill area, Job Title, Etc.">
    <select>
      <option>Location</option>
    </select>
    <select>
      <option>Category</option>
    </select>
    <input class="btn_get"type="image" name="imageField" id="imageField" src="../images/getbtn.png">
  </div>
</div>
<div class="advanced_search"><img src="../images/arrow_collapsed.png" width="9" height="8" alt="expand">Advanced Search </div>
<div id="job_content" > 

<?php		
require('../common/config.inc.php');
require ('../common/mysqli_connect.php');
//$employerID = 2;
if(!empty($_GET['region_id']))
$region_id = $_GET['region_id'];
$list = '';
if($region_id=='15' || $region_id=='56' || $region_id=='7' )
{
$sql = "SELECT COUNT( job_id ) 
FROM job
INNER JOIN district ON job.district_id = district.district_id
WHERE district.district_id =  '$region_id'
AND DATE( end_ad_date ) >= DATE( NOW( )) ";

}
else
{$sql = "SELECT COUNT( job_id ) 
FROM job
INNER JOIN district ON job.district_id = district.district_id
WHERE district.region_id =  '$region_id' 
AND DATE( end_ad_date ) >= DATE( NOW( )) ";
}
$query = mysqli_query ($dbc, $sql);
// var_dump($query);
$row = mysqli_fetch_row($query) or trigger_error("Query: $sql\n<br />MySQL Error: " . mysqli_error($dbc));
$totalRows = $row[0];
if($totalRows == 0)
$list = "Dear Employer/Agent, You don't have any job advertised, please do it just now by clicking here";
$resultPerPage = 2;
$lastPageNo = ceil($totalRows/$resultPerPage);
if($lastPageNo < 1)
{
$lastPageNo = 1;	
}
$currentPageNo = 1;
if(isset($_GET['pn']))
{
$currentPageNo = preg_replace('#[^0-9]#', '', $_GET['pn']);	
}
if($currentPageNo < 1)
{
$currentPageNo = 1;	
} else if($currentPageNo > $lastPageNo)
{
$currentPageNo = $lastPageNo;	
}
$limit = 'LIMIT ' .($currentPageNo - 1) * $resultPerPage .',' .$resultPerPage;
if($region_id=='15' || $region_id=='56' || $region_id=='7' )
{
$sql = "Select job.job_id, job.job_title,job.employer_id, DATE_FORMAT(end_ad_date, '%d %b %Y') AS end_ad_date, DATE_FORMAT(start_ad_date, '%d %b %Y') AS start_ad_date, job.company_name, district.district_name, employer_agent_company.company_logo, LEFT(`job_description`, 200) AS job_description FROM job
LEFT JOIN district
ON job.district_id = district.district_id 
LEFT JOIN employer_agent_company 
ON job.employer_id = employer_agent_company.employer_id
where district.district_id =  '$region_id' AND DATE(end_ad_date) >= DATE(now()) " .$limit;
}
else
{
$sql = "Select job.job_id, job.job_title,job.employer_id, DATE_FORMAT(end_ad_date, '%d %b %Y') AS end_ad_date, DATE_FORMAT(start_ad_date, '%d %b %Y') AS start_ad_date, job.company_name, district.district_name, employer_agent_company.company_logo, LEFT(`job_description`, 200) AS job_description FROM job
LEFT JOIN district
ON job.district_id = district.district_id 
LEFT JOIN employer_agent_company 
ON job.employer_id = employer_agent_company.employer_id
where district.region_id =  '$region_id' AND DATE(end_ad_date) >= DATE(now()) " .$limit;
}
$query = mysqli_query($dbc, $sql)  or trigger_error("Query: $sql\n<br />MySQL Error: " . mysqli_error($dbc));
$textline1 = "";
$textline2 = "Page <b>$currentPageNo </b> of <b>$lastPageNo</b>";
$pageControls = '';

if($lastPageNo != 1)
{
	if($currentPageNo > 1)
	{
		$previous = $currentPageNo - 1;
		$pageControls .= '<a href="#" onclick="nextPage('.$previous.')"><img src="../images/common_arrow_left.png" align="absmiddle" width="15px" height="15px"/> Previous</a> &nbsp;  &nbsp;  &nbsp;  &nbsp; ';	
		for($i = $currentPageNo-4; $i < $currentPageNo; $i++)
		{
			if($i > 0)
			{
				$pageControls .= '<a href="#" onclick="nextPage('.$i.')">'.$i.'</a> &nbsp; ';	
			}	
		}
	}	
	$pageControls .= '<span class="current_page_num">&nbsp;'.$currentPageNo.' </span> &nbsp; ';
	for($i = $currentPageNo+1; $i <= $lastPageNo; $i++)
	{
		//$pageControls .= '<a href="'.$_SERVER['PHP_SELF'].'?content=1&pn='.$i.'" onclick="nextPage('.$i.')">'.$i.'</a> &nbsp; ';		
		$pageControls .= '<a href="#" onclick="nextPage('.$i.')">'.$i.'</a> &nbsp; ';		
		if($i >= $currentPageNo+4)
		{
			break;	
		}
		
	}
	if($currentPageNo != $lastPageNo)
	{
		$next = $currentPageNo + 1;
		$pageControls .= ' &nbsp;   &nbsp;  &nbsp;  &nbsp;  <a href="#" onclick="nextPage('.$next.')">Next <img src="../images/common_arrow.png" align="absmiddle" width="15px" height="15px"/></a> ';		
	}
}

while($row = mysqli_fetch_array($query, MYSQLI_ASSOC))
{
	$id = $row['job_id'];
	$emp_id=$row['employer_id'];
	$job_title = $row['job_title'];
	//$desc = substr($row['job_description'],0,200);
	$desc = $row['job_description'];
	$company_name = $row['company_name'];
	//$highlighted_desc = highlightWords($desc, $searchKeyword);
	
	$list .= '<div class="posted_jobs_container_left_panel"><h3 class="red_title"><a href="#">'.$job_title.'</a></h3>';
	//$list .= '<p class="search_result_desc">'.str_ireplace($keywords, "<span class='highlight'>\"".$keywords."\"</span>", $desc).'</p>';
	//$list .= '<p class="search_result_desc">'.substr($highlighted_desc,0,200).'</p>';
	$list .= '<span class="bold">Company:</span> '.$company_name.' &emsp; | &emsp;&nbsp; <span  class="bold">Location:</span> '.$row["district_name"].'';
	$list .= '<p class="search_result_desc">'.$desc.'</p>';
	$list .= '<div class="emp_posted_job_bottom_panel">';
	$list .= '<a href="Add to Shortlist.php" style="color: black; text-decoration: none;"> Add to Shortlist </a>&emsp;';
    $list .= '<a href="Apply.php" style="color: black; text-decoration: none;"> Apply </a> &emsp;';
	$list .= '<a href="Email to a Friend.php" style="color: black; text-decoration: none;"> Email to a Friend </a> &emsp;';
	$list .= '<a href="Add Note.php" style="color: black; text-decoration: none;"> Add Note </a> &emsp;';
	$list   .= '</div></div>';
	$list .= '<div class="posted_jobs_container_right_panel"><img src="http://localhost:8000/getthejob/images/logos/'.$row["company_logo"].'" width="160px" height="60px" class="emp_posted_job_logo_img"/>';
	$list .= ' <div style="line-height:20px;"><span  class="bold">  &nbsp; Posted on:</span> '.$row["start_ad_date"].'</div> <div><span  class="bold"> &nbsp; &nbsp;Expired on:</span> '.$row["end_ad_date"].'</div>';
	$list .= '<div class="view_detail_link"><a href="ViewDetails.php" style="color: red; text-decoration: none;">View Details </a></div></div>';
	$list .= '<hr style width="700" color="red" size="1";></hr>';

}


function highlightWords($desc, $searchKeyword){
    $searchKeyword = preg_replace('/\s+/', ' ', trim($searchKeyword));
    $words = explode(' ', $searchKeyword);

    $highlighted = array();
    foreach ( $words as $word ){
        $highlighted[] = "<span class='highlight'>".$word."</span>";
    }

    return str_ireplace($words, $highlighted, $desc);

	}
 ?>

<h4 class="search_result_heading"><?php echo $textline1; ?></h4>
<div class="posted_jobs_detail_brief_for_employer">
<?php echo $list; ?>  </div>
<div id="page_controls"><?php echo $pageControls; ?></div>
   
</div>
</div>
    
    <div class="footer_container">
  <div class="left_img"> </div>
  <ul class="footermenu1">
    <li><img src="../images/abtget.jpg" alt="About get-the-job.co.nz " width="147" height="11"></li>
    <li>Contact Us </li>
    <li>Privacy </li>
    <li>Support and FAQ's </li>
    <li>Partner with us </li>
    <li><img src="../images/gthlog.jpg" width="112" height="11" alt=""> Terms & Conditions </li>
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




