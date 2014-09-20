<?php
//connect to the database
$con = mysql_connect("localhost","root","manuadi") or die("error ".mysql_error());

//connect to the trav table
mysql_select_db("get-the-job",$con) or die("error ".mysql_error());

$building = mysql_real_escape_string($_GET['parent']);

$query = "select DistrictID, DistrictName from district where RegionID = ";
$query = $query . $building;
$query = $query . ";";
$result = mysql_query($query) or die('Error in Child Table!');

//echo '<option value="">Please Select</option>';
while( $row = mysql_fetch_assoc($result) )
{
    echo '<option value="'. $row['DistrictID'] .'">'.$row['DistrictName'].'</option>';
}

mysqli_close($con);
?>
