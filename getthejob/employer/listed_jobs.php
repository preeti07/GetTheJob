
<?php 
date_default_timezone_set('NZ'); 
//include_once("mysqli_connect.php");
ob_start();
session_start();
//$today = date('Y-m-d H:i:s');

if(isset($_SESSION['SESS_EMP_ID'])) {
		$employer_id = $_SESSION['SESS_EMP_ID'];
	}
else
 	{
	header("location:http://localhost:8000/getthejob/index.html");
	exit();	
	}		
require('../common/config.inc.php');
require ('../common/mysqli_connect.php');
//$employerID = 2;

$list = '';
$sql = "SELECT COUNT(job_id) FROM job where EMPLOYER_ID = $employer_id AND DATE(end_ad_date) > DATE(now())";
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
$sql = "Select job.job_id, job.job_title, DATE_FORMAT(end_ad_date, '%d %b %Y') AS end_ad_date, DATE_FORMAT(start_ad_date, '%d %b %Y') AS start_ad_date, job.company_name, district.district_name, employer_agent_company.company_logo, LEFT(`job_description`, 200) AS job_description FROM job
LEFT JOIN district
ON job.district_id = district.district_id 
LEFT JOIN employer_agent_company 
ON job.employer_id = employer_agent_company.employer_id
where job.EMPLOYER_ID = $employer_id AND DATE(end_ad_date) > DATE(now())" .$limit;
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
	$list .= '<div class="emp_posted_job_bottom_panel">&emsp;&emsp; Edit Details &emsp;&emsp; Extend Date &emsp;&emsp; Add Note </div></div>';
	$list .= '<div class="posted_jobs_container_right_panel"><img src="http://localhost:8000/getthejob/images/logos/'.$row["company_logo"].'" width="160px" height="60px" class="emp_posted_job_logo_img"/>';
	$list .= ' <div style="line-height:20px;"><span  class="bold">  &nbsp; Posted on:</span> '.$row["start_ad_date"].'</div> <div><span  class="bold"> &nbsp; &nbsp;Expired on:</span> '.$row["end_ad_date"].'</div>';
	$list .= '<div class="view_detail_link">View Details</div></div>';
	$list .= '<hr class="posted_jobs_hr_red" color="#FF282E">';
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
<div class="listed_jobs_sub_panel"> Add a Job &emsp; &emsp; &emsp; &emsp; Repost a Job</div>
<div class="posted_jobs_detail_brief_for_employer"><?php echo $list; ?></div>
<div id="page_controls"><?php echo $pageControls; ?></div>
