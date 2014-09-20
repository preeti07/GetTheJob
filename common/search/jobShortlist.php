<?php
/* Class to facilitate the shortlisting of a job for a seeker */

require_once __DIR__.'/../databaseAccess/tables/seekerJobShortlist.php';

class JobShortlist {

 public static function add($jobSeekerId, $jobId){
 	/* only if jobSeekerId is valid */	
 	if (JobSeeker::isValid($jobSeekerId)){

 		/* build the values to add */	
 		$jobShortlistValues = "";
		
		/* shortlist_id */		
		$jobShortlistValues.= 'NULL';
		
		/* job_seeker_id */
		$jobShortlistValues.= ", $jobSeekerId";

		/* job_id */
		$jobShortlistValues.= ", $jobId";
		
 		SeekerJobShortlist::insertRowQuery($jobShortlistValues);
			
 		return true;
 	}
	else return false; //jobSeekerId not valid
 }

}
?>


