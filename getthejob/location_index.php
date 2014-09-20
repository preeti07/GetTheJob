<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Get The Job:: That's our tagline</title>
<script type="text/javascript" charset="utf-8" >
	$(document).ready(function() {
		$location = $("select[name='location']");
		$location.change(function() {
			$selectedLoc = $(this).val();
			var myAreaArray = <?= json_encode($myAreaArray); ?>;
		
		});
		});

</script>
</head>

<body>
<?php require('common/dbcon.php');
if (mysqli_ping($conn))
	{echo 'mysql server on' .mysqli_get_server_info($conn).'on'.mysqli_get_host_info($conn);}
 ?>
<div id="header">
  
         <?php include('common/header1.php'); ?>
    	
  	</div>

  	<div id="content">
    	<div id="searchbox">
                <form id="searchForm" name="searchForm" action="" method="post">
            
                  <p align="center"> <label for="keyword">Keyword</label> <input name="keyword" type="text" class="detail" id="keyword" value="Enter keywords for your search" size="50" /></p>
                <p align="center"> <label for="location">Location</label>
                 <select id="location" class="detail" name="location" onchange="selectSubCat(this.value)">
                 <?php 
				 $result = $conn->query("select RegionID, RegionName from region");
				 while ($row = $result->fetch_assoc()) {

                  unset($RegionID, $RegionName);
                  $id = $row['RegionID'];
                  $name = $row['RegionName']; 
				  echo '<option value="'.$id.'" name="'.$id.'">'.$name.'</option>';
				 }
				  ?>
                 </select> 
                   <label for="area">Area</label>
                   <select id="area" class="detail" name="area"/>
                   <option value="">Choose first Location</option>
                   <?php 
				 $result1 = $conn->query("select DistrictID, DistrictName from district where RegionID == ");
				 while ($row = $result1->fetch_assoc()) {

                  unset($DistrictID, $DistrictName);
                  $id1 = $row['DistrictID'];
                  $name1 = $row['DistrictName']; 
				  echo '<option value="'.$id1.'" name="'.$id1.'">'.$name1.'</option>';
				 }
				  ?>
                   </select></p>
              <p align="center"> <label for="keyword">Category</label>
                   <select id="category" class="detail" name="category" value="In any Category"/></select>
                <label for="keyword">Subcategory</label>
                   <select id="subcategory" class="detail" name="subcategory" value=""/></select></p>
                <div align="center">
                  <input type="submit" id="search" name="search" value="Search"/>
                </div>
                </form>
        </div>  
    	<!-- end of search box div -->
  <div id="formWrap">
        	<div id="seekerForm">
            	<div class="formWrap1">
                <h4> If you are a registered job seeker, you can login here. </h4>
            	  <form id="seekerForm" name="seekerForm" action="" method="post">
           		<label for="emailid">Email ID</label> <input name="email" type="text" class="detail" id="email" value="" size="50" />
                <label for="password">Password</label><input name="password" type="password" class="detail" id="password" value="" size="50" />
          	    <input type="submit" id="loginSeeker" name="login" value="Sign In"/>
                Not registered? <a href="" >Ok Register Now</a>
                </form>
                </div>   <!-- end of formWrap1 div -->
            </div>   
       	<div align="center"><!-- end of seekerForm div -->
   	    </div>
       	<div id="circles">
       	  <div align="center"><img src="images/circle.jpg" width="100" height="100" /></br>
       	    <img src="images/circle.jpg" width="100" height="100" /></br>
       	    <img src="images/circle.jpg" width="100" height="100" />
   	      </div>
   	    </div>  
       	<div align="center"><!-- end of circles div -->
   	    </div>
       	<div id="empForm">
       	  <div class="formWrap1">
           <h4><strong> If you are a registered Job advertizer, please! login here. </strong></h4>
                <form id="employerForm" name="employerForm" action="" method="post">
            
                  
                    <label for="emailid">Username</label> 
                    <input name="email" type="text" class="detail" id="email" value="" size="50" /></br>
                    <label for="password"><br />
                    Password</label>
                    <input name="password" type="password" class="detail" id="password" value="" size="50" />
                    
                    <input type="submit" id="loginSeeker" name="login" value="Sign In"/>
                  New to this website? <a href="employer.php">Register</a> here!
</form>
                </div>
            </div>   <!-- end of emplForm div -->
        </div><!-- end of formWrap div -->
    </div> <!-- end of content div -->

 	<div id="footer">
  		<?php include('common/footer.php'); ?> 
    	<?php require('common/dbdiscon.php'); ?>
  	</div>  <!-- end of footer div -->
</body>
</html>