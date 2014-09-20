<?php
//connect to the database
$con = mysql_connect("localhost","root","manuadi") or die("error ".mysql_error());

//connect to the trav table
mysql_select_db("get_the_job",$con) or die("error ".mysql_error());

$building = mysql_real_escape_string($_GET['uname']);

$query = "SELECT employer_type_id FROM employer_agent_company WHERE user_email='$building'";
//$query = $query . $building;
//$query = $query . ";";
$result = mysql_query($query) or die('Error in Child Table!');

$rows = mysql_num_rows($result);
if($rows > 0)
{
 echo '<img src="images/cross.png" align="absmiddle"><font color="#FF0000">Not available</font>';	
 return false;
}
else
{
 echo '<img src="images/check.png" align="absmiddle" width="25"><font color="grey">User name is available</font>';	
 return true;
}

/* echo '<option value="">Please Select</option>';
while( $row = mysql_fetch_assoc($result) )
{
    echo '<option value="'. $row['SubCategoryID'] .'">'.$row['SubCategoryName'].'</option>';
}   */
 mysql_close($con);
?>