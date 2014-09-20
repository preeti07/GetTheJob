<?php
if ($_GET['content'] == 1) { 
include('listed_jobs.php');
//echo 'Content for Page 1'; 

} 

if ($_GET['content'] == 2) { 
include('expired_jobs.php');
echo 'Content for Page 2'; 
} 

if ($_GET['content'] == 3) { 
include('candidates_list.php');
echo 'Content For Page 3'; 
} 
if ($_GET['content'] == 4) {
include('account_settings.php'); 
echo 'Content For Page 4'; 
} 
?>