<script>
function capitalizeMe(obj)
 {
        val = obj.value;
        newVal = '';
        val = val.split(' ');
        for(var c=0; c < val.length; c++) {
                newVal += val[c].substring(0,1).toUpperCase() +
val[c].substring(1,val[c].length) + ' ';
        }
		
        obj.value = newVal.trim();
		}
</script>		
<?php

$name_for_job_alert = "";
$email_for_job_alert = "";
$msg_to_user = "";
if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{ 
	if ($_POST['job_alert_user_name'] != "")
	{
	include_once"common/mysqli_connect.php";
	$name_for_job_alert = $_POST['job_alert_user_name'];
	$email_for_job_alert = $_POST['job_alert_user_email'];
	$query = "SELECT * FROM job_alert LEFT JOIN job_seeker ON job_alert.seeker_id = job_seeker.seeker_id WHERE job_seeker.email_id='$email_for_job_alert'";
	$sql = mysqli_query($dbc, $query) or trigger_error("Query: $query\n<br />MySQL Error: " . mysqli_error($dbc));
    $numRows = mysqli_num_rows($sql);
		if (!$email_for_job_alert) {
			
			$msg_to_user = '<br /><br /><h4><font color="FF0000">Please type an email address ' . $name_for_job_alert . '.</font></h4>';
		
		} else if ($numRows > 0) {
			
			//$msg_to_user = '<br /><br /><h4><font color="FF0000">' . $email_for_job_alert . ' is already in the system. </font></h4>';
			header("location:job_alert.php?msg=ah80&name=$name_for_job_alert&email_id=$email_for_job_alert");
		} else {
			
			$sql_insert_in_seeker = mysqli_query($dbc, "INSERT INTO job_seeker (first_name, email_id) VALUES('$name_for_job_alert','$email_for_job_alert') ")  or die (mysqli_error());
			$last_inserted_mysql_id = mysqli_insert_id($dbc);
			$sql_insert1_in_alert = mysqli_query($dbc, "INSERT INTO job_alert (seeker_id) VALUES('$last_inserted_mysql_id') ")  or die (mysqli_error());
														
			
			//$msg_to_user = '<br /><br /><h4><font color="0066FF">Thanks ' . $name_for_job_alert . ', you have been added successfully.</font></h4>';
			if($sql_insert_in_seeker && $sql_insert1_in_alert)
			{
			header("location:job_alert.php?msg=ah85&name=$name_for_job_alert&email_id=$email_for_job_alert");
			}
			else
			{
			header("location:job_alert.php?msg=ah88&name=$name_for_job_alert&email_id=$email_for_job_alert");
			}
			$name_for_job_alert = "";
			$email_for_job_alert = "";
		}
	}
}

?>
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
  <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>" enctype="multipart/form-data" name="job_alert_form">
  <ul class="footermenu3">
    <li>Get Job Experience </li>
    <li>Place FREE Job Experience Ad</li>
    <li class="txt_color">Register for Job Alerts </li>
    
    <li class="txt_register">Name &nbsp;
      <input type="text" id="job_alert_user_name" name="job_alert_user_name" onblur="capitalizeMe(this)" value="<?php echo $name_for_job_alert; ?>" required>
    </li>
    <li>Email &nbsp;&nbsp;
      <input type="email" id="job_alert_user_email" name="job_alert_user_email" value="<?php echo $email_for_job_alert; ?>" required>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="image" src="images/registerbtn.png" name="job_alert_submit_button" value="register"><br />
       <?php //echo $msg_to_user; ?>
     
    </li>
    </form>
  </ul>
  <div class="right_img"> </div>
</div>