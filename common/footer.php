
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
/* $.fn.display_overlay = function() {
	 alert("jgjhbk");
 } */
</script>		

<!-- The overlay and the box -->
<div class="overlay" id="overlay" style="display:none;"></div>
<div class="box" id="box">
    <a class="boxclose" id="boxclose"></a>
    
   <center> <p id="message_p"></p></center>
   <p id="message_alert_success"></p>
  <form id="job_alert_form" class="job_alert_form">
   <h4 style="color:#c00; font-size:16px;">Job Alert Registration</h4>
   <p id="message_alert"></p>
   <div id="left_of_job_alert_form">
  	 <label>Name <span class="red_asterick">*</span></label>
     <input type="text" maxlength="50" size="20px" name="job_alert_form_name" id="job_alert_form_name" class="job_alert_form_input_disabled" disabled="disabled"/><br />
     <label>Job Alert Title <span class="red_asterick">*</span></label>
     <input type="text" maxlength="50" size="20px" name="job_alert_form_title" id="job_alert_form_title" class="job_alert_form_input"/> <br />
     <label>Work Type</label>
     <select  class="select_single_arrow" name="alert_work_type" id="job_alert_form_work_type">
       <option value="1">All Work Types</option>
       <option value="2">Full Time</option>
       <option value="3">Part Time</option>
       <option value="4">Contract/Temp</option>
       <option value="5">Casual/Vacation</option>
       
     </select> <br />
     <label>Category</label>
     <?php 
	  include_once"common/mysqli_connect.php";
	  $query1 = "select category_id, category_name from job_category";
				  $result = mysqli_query($dbc, $query1); ?>
     <select class="select_red_arrow" multiple id="category" name="category[]" <?php if (isset($missing)){
			echo 'value="'.htmlentities($_POST['category']).'"'; }?> >
       <option value="">Any Category</option>  
       <?php
				 while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                  unset($category_id, $category_name);
                  $id = $row['category_id'];
                  $desc = $row['category_name']; 
				  echo '<option value="'.$row['category_id'].'" name="'.$row['category_id'].'">'.$row['category_name'].'</option>';
				 }
				  ?></select> <br /><br />
     
     <a id='boxclose_button' class='boxclose_button'><img  src='images/overlay_images/close_button.png' class='boxclose_button' style="float:right; position:relative; margin-right:40px;"/></a>
   </div>
   <div id="right_of_job_alert_form">
     <label>Email <span class="red_asterick">*</span></label>
     <input type="text" maxlength="50" size="20px" name="job_alert_form_email" id="job_alert_form_email" class="job_alert_form_input_disabled" disabled="disabled"/><br />
     
     <label>Keywords</label>
     <input type="text" maxlength="50" size="20px" name="job_alert_form_keyword" id="job_alert_form_keyword" class="job_alert_form_input"/><br />
     <label>Salary Range</label>
     <select class="select_single_arrow" name="job_alert_form_salary" id="job_alert_form_salary">
       <option value="">Any Salary</option>
       <option value="1">0-$10000</option>
       <option value="2">$10000-$20000</option>
       <option value="3">$20000-$30000</option>
       <option value="4">$30000-$40000</option>
     </select> <br />
     <label>Location</label>
     <?php 
	  include_once"common/mysqli_connect.php";
	  $query1 = "select region_id, region_name from region";
				  $result = mysqli_query($dbc, $query1); ?>
     <select class="select_red_arrow" multiple id="region" name="region[]" <?php if (isset($missing)){
			echo 'value="'.htmlentities($_POST['region']).'"'; }?> >
       <option value="">Any Location</option>  
       <?php
				 while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                  unset($region_id, $region_name);
                  $id = $row['region_id'];
                  $desc = $row['region_name']; 
				  echo '<option value="'.$row['region_id'].'" name="'.$row['region_id'].'">'.$row['region_name'].'</option>';
				 }
				  ?></select>  <br /><br />
                  <a id='register_button' class='boxclose_button' ><img  src='images/overlay_images/register_button.png' class='boxclose_button' style="margin-left:40px;"/></a>
   </div>

   </form>
    <p>
       
    </p>
</div>
<div id="footer">
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
          <input type="text" id="job_alert_user_name" name="job_alert_user_name" onblur="capitalizeMe(this)" value="" required>
        </li>
        <li>Email &nbsp;&nbsp;
          <input type="email" id="job_alert_user_email" name="job_alert_user_email" value="" >
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" src="images/registerbtn.png" name="job_alert_submit_button" value="register" id="job_alert_submit_button"><br />
           <?php //echo $msg_to_user; ?>
         
        </li>
        </form>
      </ul>
      <div class="right_img"> </div>
    </div>
</div>