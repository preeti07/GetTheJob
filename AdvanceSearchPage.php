<?php 
ob_start();
session_start();
require('common/connection.php');
require_once __DIR__.'/common/databaseAccess/tables/region.php';
require_once __DIR__.'/common/databaseAccess/tables/district.php';
require_once __DIR__.'/common/databaseAccess/tables/jobCategory.php';
require_once __DIR__.'/common/databaseAccess/tables/jobSubCategory.php';
require_once __DIR__.'/common/databaseAccess/tables/workType.php';
require_once __DIR__.'/common/search/jobQuickSearchForm.php';

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Jobs on CarnieRecruitment - New Zealand&#39;s no.1 Employment, Career and Recruitment site</title>
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
<script>
$(document).ready(function() {

    $("#categoryID").change(function() {
        var val = $(this).val();
        alert(val);
		$.ajax({url: 'loadSearchList.php',data: {ddListId: val,ddListName:"subcategory"}, success: function(data)
                        {
							alert(data);
                            $("#subCategoryID").html(data);
                        }
              });
		
    });
	$("#regionId").change(function() {
        var val = $(this).val();
        alert(val);
		$.ajax({url: 'loadSearchList.php',data: {ddListId: val,ddListName:"district"}, success: function(data)
                        {
							alert(data);
                            $("#districtId").html(data);
                        }
              });
		
    });


});
</script>

</head>
<body>
<form action="<?php $PHP_SELF ?>" method="get">
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
<div class="adv_searchbox"> <span> Get the jobs </span>
<div>
    <div>
	<label id="keywordLabel" for="keywords">Keywords</label>
	<label id="regionLabel" for="regionName">Region</label>
	<label id="categoryLabel" for="categoryName">Category</label>
	</div>
	<input name = "keywords" type="text" maxlength ="200" placeholder="Enter keyword(s) C, C++, Hospitality" >
    <?php
		$regions = new Region();
	    $allRegions = $regions::getAllRegions();
	  	$output= "<select name=\"regionName\" id=\"regionId\">\n";

		/* The following logic will determine the selected option */
		/* Chose a do...while() in order to avoid code duplication for the 'selected' option logic */
		$regionId = 0;
		$regionName = "Any region";
		$firstRow = true;
		do {
			if (!$firstRow) {
				$regionId = $regions::getRegionId($row);	
				$regionName = $regions::getRegionName($row);	
				$selected = "";
				}
			else {
				$firstRow = false;
				$selected = "selected";
			}
					
			/* here is the actual option output */
			$output.= " <option $selected value =\"$regionId\">$regionName</option>\n";

		} while (($row = $allRegions->fetch_row())!= NULL);
	  $output.= "</select>\n";
	  echo $output;
?>
<?php
	//FOR JOB CATEGORY
	  $jobCategory = new JobCategory();
	  $alljobCategory = $jobCategory::getAllJobCategory();
	  $output= "<select name=\"categoryName\" id=\"categoryID\">\n";

		/* The following logic will determine the selected option */
		/* Chose a do...while() in order to avoid code duplication for the 'selected' option logic */
		$categoryId = 0;
		$categoryName = "Any job Category";
		$firstRow = true;
		do {
			if (!$firstRow) {
				$categoryId = $jobCategory::getJobCategoryId($row);	
				$categoryName = $jobCategory::getJobCategoryName($row);	
				$selected = "";
				}
			else {
				$firstRow = false;
				$selected = "selected";
			}
					
			/* here is the actual option output */
			$output.= " <option $selected value =\"$categoryId\">$categoryName</option>\n";

		} while (($row = $alljobCategory->fetch_row())!= NULL);
	  $output.= "</select>\n";
	  echo $output;
?>
      <!--<option>Sub Region</option>-->
    <label id="placeholder" for="clear space"></label>
	<?php
	  $district = new District();
	  $allDistrict = $district::getAllDistrict();
	  $output= "<select name=\"district\" id=\"districtId\">\n";

		/* The following logic will determine the selected option */
		/* Chose a do...while() in order to avoid code duplication for the 'selected' option logic */
		$districtId = 0;
		$districtName = "Any District";
		$firstRow = true;
		do {
			if (!$firstRow) {
				$districtId = $district::getDistrictId($row);	
				$districtName = $district::getDistrictName($row);	
				$selected = "";
				}
			else {
				$firstRow = false;
				$selected = "selected";
			}
					
			/* here is the actual option output */
			$output.= " <option $selected value =\"$districtId\">$districtName</option>\n";

		} while (($row = $allDistrict->fetch_row())!= NULL);
	  $output.= "</select>\n";
	  echo $output;
	?>
	
	<?php
	  $jobSubCategory = new JobSubCategory();
	  $allJobSubCategory = $jobSubCategory::getAllSubJobCategory();
	  $output= "<select name=\"subCategoryName\" id=\"subCategoryID\">\n";

		/* The following logic will determine the selected option */
		/* Chose a do...while() in order to avoid code duplication for the 'selected' option logic */
		$subCategoryId = 0;
		$subCategoryName = "Any Job Sub Category";
		$firstRow = true;
		do {
			if (!$firstRow) {
				$subCategoryId = $jobSubCategory::getJobSubCategoryId($row);	
				$subCategoryName = $jobSubCategory::getJobSubCategoryName($row);	
				$selected = "";
				}
			else {
				$firstRow = false;
				$selected = "selected";
			}
					
			/* here is the actual option output */
			$output.= " <option $selected value =\"$subCategoryId\">$subCategoryName</option>\n";

		} while (($row = $allJobSubCategory->fetch_row())!= NULL);
	  $output.= "</select>\n";
	  echo $output;
	?>
	<div>
	<label id="workTypeLabel" for="workType">Work Type</label>
	<label id="salaryRangeLabel" for="salaryRange">Salary Range</label>
	<label id="dateRangeLabel" for="dateRange">Results in last</label>
	</div>
	<?php
	  $workType = new WorkType();
	  $allWorkType = $workType::getAllWorkType();
	  $output= "<select name=\"workType\">\n";

		/* The following logic will determine the selected option */
		/* Chose a do...while() in order to avoid code duplication for the 'selected' option logic */
		$workTypeId = 0;
		$workTypeName = "Any WorkType";
		$firstRow = true;
		do {
			if (!$firstRow) {
				$workTypeId = $workType::getWorkTypeId($row);	
				$workTypeName = $workType::getWorkTypeName($row);	
				$selected = "";
				}
			else {
				$firstRow = false;
				$selected = "selected";
			}
					
			/* here is the actual option output */
			$output.= "<option $selected value =\"$workTypeId\">$workTypeName</option>\n";

		} while (($row = $allWorkType->fetch_row())!= NULL);
	  $output.= "</select>\n";
	  echo $output;
	?>
	<select name="SalaryRange">
      <option value="0">Any Salary Range</option>
	  <option value="1">0 to $30000</option>
	  <option value="2">$30000 to $50000</option>
	  <option value="3">$50000 to $70000</option>
	  <option value="4">$70000 to $100000</option>
	  <option value="5">$100000 to $120000</option>
    </select>
	<select name="ResultsInLast">
      <option value="0">All</option>
	  <option value="1">10</option>
	  <option value="2">20</option>
	  <option value="3">30</option>
	</select>
	<input class="btn_get" type="image" alt="submit" name="imageField" id="imageField" src="images/getbtn.png" >
	</div>
</div>
<div class="advanced_search"><img src="images/arrow_collapsed.png" width="9" height="8" alt="expand"><a href="QuickSearchPage.php" style="color:yellow">Quick Search</a> </div>
<!--<div class="tab_content">
<div class="imgabtus"> <!--  Outer wrapper for presentation only, this can be anything you like -->
    <!-- End outer wrapper  
 </div>-->
</div> 

<div class="saved_container">
  <div class="saved_left_bottom_img"> </div>
  <div id="savedSearch" style="margin:10px;width:320px;float:left;">
  <b style="color:red">Saved Searches</b><br><p style="color:white">Search 1</p><br><p style="color:gray">Search 2</p></div>
  <div id="pinnedSearch" style="margin:10px;width:320px;float:left;">
  <b style="color:red">Pinned Job</b><br><p style="color:white">Search 1 </p><br><p style="color:gray">Search 2</p></div>
  <div id="appliedJobs" style="margin:10px;width:320px;float:left;">
  <b style="color:red">Applied Jobs</b><br><p style="color:white">Search 1</p><br><p style="color:gray">Search 2</p></div>

  <div class="saved_right_bottom_img"> </div>
</div>
<div>

<?php
if($_GET)
{
echo '<div id="searchResult" style="background-color:white;border-style:groove;border-width:1px;border-color:gray;width:700px;float:right;-webkit-border-radius:0px 15px 15px 0px;-moz-border-radius:0px 15px 15px 0px;border-radius:0px 15px 15px 0px;">';
//$keywords = $_GET['keywords'];
$keywords = $_GET['keywords'];
$regionId = $_GET['regionName'];
$categoryID = $_GET['categoryName'];
$districtID = $_GET['district'];
$subCategoryID =$_GET['subCategoryName'];
$workTypeId = $_GET['workType'];
$salaryRange = $_GET['SalaryRange'];
$resultsInLast =$_GET['ResultsInLast'];
/*
echo $keywords;
echo $regionId;
echo $categoryID;
echo $districtID;
echo $subCategoryID;
echo $workTypeId;
echo $salaryRange;
echo $resultsInLast;
*/
$mysqli = mysqli_connect('localhost', "root", "pass", "get_the_job");
//$myQuery="SELECT j.job_id, j.job_description, eac.company_name from job j,employer_agent_company eac 
//where district_id in(select district_id from district where region_id=1) and 
//job_description like '%" .$keywords . "%' limit 0,2";
//$res = mysqli_multi_query($mysqli,"SELECT j.job_id, j.job_description, eac.company_name from job j,employer_agent_company eac 
//where district_id in(select district_id from district where region_id=1) and 
//job_description like '%$keywords%' and
//eac.employer_id = j.employer_id;");

$myQuery = "SELECT r.region_name,d.district_name,j.min_sal,j.max_sal,j.work_type_id,j.job_title, j.job_description,j.end_ad_date,eac.address, eac.company_name,eac.company_logo ".
			"from job j,employer_agent_company eac , region r , district d where ".
			"j.district_id=d.district_id and d.region_id=r.region_id and job_description like '%" .$keywords . "%'";

if ($districtID !=0)
{
	if($regionId != 0)
	{
		$myQuery.= " and (j.district_id= ( select district_Id from district where district_id=$districtID and region_id=$regionId))";
	}else
	{
		$myQuery.= "and j.district_id=$districtID";
	}
}

if ($subCategoryID !=0)
{
	if($categoryID !=0)
	{
		$myQuery.=" and (j.subCategory_id =( select subcategory_id from job_sub_category where category_id =$categoryID and subcategory_id=$subCategoryID))";
	}else
	{
		$myQuery.="and j.subcategory_id=$subCategoryID";
	}
}

if ($workTypeId!=0)
{
	$myQuery.= "j.work_type_id = $workTypeId";
}

if($salaryRange !=0)
{
	
}	

if($resultsInLast !=0)
{
}
$myQuery.="LIMIT 0,2";

//echo $myQuery;
$res = mysqli_multi_query($mysqli,$myQuery);

do{
	if($title=mysqli_store_result($mysqli))
	{
		while ($row = mysqli_fetch_row($title)) {
                echo '<div id="searchResultLogo" style="margin:10px;padding:20px;background-image:url(images/castrol.bmp);background-repeat:no-repeat;border-style:solid;border-width:1px;border-color:gray;width:120px;height:70px;float:right"></div>';
				echo '<div id="searchResultHead" style="margin:10px;padding:20px;background-color:white;border-style:solid;border-width:1px;border-color:gray;width:500px;height:50px;float:left">';
				echo '<p style="background-color:gray;margin:-15px;color:red;font-size:20px;align:right">';
				echo "$row[0]</p>";
				echo '<p style="margin:17px;color:gray;font-size:15px;align:left">LOCATION AND CPMPANY</p></div>';
				echo '<div id="searchResultDesc" style="margin:-5px 10px;padding:0px;background-color:blue;border-style:solid;border-width:1px;border-color:gray;width:500px;height:230px;float:left">';
				echo "$row[1]<BR>";
				echo "$row[2]<BR></div>";
				echo '<div id="ViewDetail" style="margin:10px;padding:10px;background-color:orange;border-style:solid;border-width:1px;border-color:gray;width:140px;height:230px;float:right"></div>';
				echo '<div id="Activities" style="margin:10px;padding:5px;background-color:gray;border-style:solid;border-width:1px;border-color:gray;width:500px;height:30px;float:left">';
				echo '<div style="float:left;width:150px;height:20"><a href="add.php"> Add to Shortlist</a></div>';
				echo '<div style="float:left;width:90px;height:20"><a href="applyJob.php"> Applied</a></div>';
				echo '<div style="float:left;width:120px;height:20"><a href="email.php"> Email to a Friend</a></div>';
				echo '<div style="float:left;width:120px;height:20" ><a href="addNote.php"> Add Note</a></div></div>';
				
			}
	}
     mysqli_free_result($title);
	 
	 } while (mysqli_more_results($mysqli));
}

?>
</div>
    
	<div class="search_container">
	<!--<div class="footer_right_bottom_img"> </div>-->
	<!--<div class="footer_left_bottom_img"> </div>-->
  
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
</form>
</body>
</html>
<?php
 ob_end_flush();
?>