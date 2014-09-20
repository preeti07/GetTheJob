<?php 
//date_default_timezone_set('NZ'); 
//include_once("mysqli_connect.php");
$list = '';
$sql = "SELECT COUNT(job_id) FROM jobs_myisam where MATCH(job_title, job_description, location, category, b1, b2, b3, b4, b5, experience_level) AGAINST ('".$searchKeyword."*' IN BOOLEAN MODE)";
$query = mysqli_query ($dbc, $sql);
// var_dump($query);
$row = mysqli_fetch_row($query) or trigger_error("Query: $sql\n<br />MySQL Error: " . mysqli_error($dbc));
$totalRows = $row[0];
if($totalRows == 0)
$list = "Sorry, Please try with other keywords";
$resultPerPage = 4;
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
$limit = 'LIMIT ' .($currentPageNo - 1) *       $resultPerPage .',' .$resultPerPage;
$sql = "Select job_id, job_title, LEFT(`job_description`, 200) AS job_description, MATCH(job_title, job_description, location, category, b1, b2, b3, b4, b5, experience_level) AGAINST ('".$searchKeyword."*' IN BOOLEAN MODE) AS R FROM jobs_myisam  where MATCH(job_title, job_description, location, category, b1, b2, b3, b4, b5, experience_level) AGAINST ('".$searchKeyword."*' IN BOOLEAN MODE)" .$limit;
$query = mysqli_query($dbc, $sql)  or trigger_error("Query: $sql\n<br />MySQL Error: " . mysqli_error($dbc));
$textline1 = "Your search for \"<span class='highlight'><b>$searchKeyword</b></span>\" returned (<b>$totalRows</b>) search results";
$textline2 = "Page <b>$currentPageNo </b> of <b>$lastPageNo</b>";
$pageControls = '';

if($lastPageNo != 1)
{
	if($currentPageNo > 1)
	{
		$previous = $currentPageNo - 1;
		$pageControls .= '<a href="'.$_SERVER['PHP_SELF'].'?suscrp_input='.$searchKeyword.'&pn='.$previous.'"><img src="images/common_arrow_left.png" align="absmiddle" width="15px" height="15px"/> Previous</a> &nbsp;  &nbsp;  &nbsp;  &nbsp; ';	
		for($i = $currentPageNo-4; $i < $currentPageNo; $i++)
		{
			if($i > 0)
			{
				$pageControls .= '<a href="'.$_SERVER['PHP_SELF'].'?suscrp_input='.$searchKeyword.'&pn='.$i.'">'.$i.'</a> &nbsp; ';	
			}	
		}
	}	
	$pageControls .= '<span class="current_page_num">&nbsp;'.$currentPageNo.' </span> &nbsp; ';
	for($i = $currentPageNo+1; $i <= $lastPageNo; $i++)
	{
		$pageControls .= '<a href="'.$_SERVER['PHP_SELF'].'?suscrp_input='.$searchKeyword.'&pn='.$i.'">'.$i.'</a> &nbsp; ';		
		if($i >= $currentPageNo+4)
		{
			break;	
		}
		
	}
	if($currentPageNo != $lastPageNo)
	{
		$next = $currentPageNo + 1;
		$pageControls .= ' &nbsp;   &nbsp;  &nbsp;  &nbsp;  <a href="'.$_SERVER['PHP_SELF'].'?suscrp_input='.$searchKeyword.'&pn='.$next.'">Next <img src="images/common_arrow.png" align="absmiddle" width="15px" height="15px"/></a> ';		
	}
}

while($row = mysqli_fetch_array($query, MYSQLI_ASSOC))
{
	$id = $row['job_id'];
	$name = $row['job_title'];
	//$desc = substr($row['job_description'],0,200);
	$desc = $row['job_description'];
	$highlighted_desc = highlightWords($desc, $searchKeyword);
	$list .= '<p class="highlight"><a href="job_description.php?job_id=\''.$id.'\'">'.$name.' ></a></p>';
	//$list .= '<p class="search_result_desc">'.str_ireplace($keywords, "<span class='highlight'>\"".$keywords."\"</span>", $desc).'</p>';
	//$list .= '<p class="search_result_desc">'.substr($highlighted_desc,0,200).'</p>';
	$list .= '<p class="search_result_desc">'.$highlighted_desc.'</p>';
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">

</style>
</head>

<body>
<h4 class="search_result_heading"><?php echo $textline1; ?></h4>
<p><?php // echo $textline2; ?></p>
<p><?php echo $list; ?></p>
<div id="page_controls"><?php echo $pageControls; ?></div>
</body>
</html>