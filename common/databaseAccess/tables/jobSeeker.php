<?php
/* Class to handle the job_seeker table */

require_once __DIR__.'/../general/table.php';

class JobSeeker extends Table{
	
	/* Table structure */
		
	/**
	 * Overrides Table::tableName()
	 */	
	protected static function tableName(){
		return "job_seeker";
	}
	
	/**
	 * Overrides Table::tableFields()
	 */	
	protected static function tableFields(){
		return array('seeker_id', 'first_name', 'last_name', 'email_id',
					 'address', 'mobile_phone', 'home_phone', 'qualification',
					 'current_job', 'experience', 'summary_of_skills', 
					 'salary_expectation', 'visa_status', 'linkedin_profile_url',
					 'cover_letter', 'availability', 'is_public_resume',
					 'district_id', 'login_id');
	}


	/* Methods */

	public static function getJobSeeker($jobSeekerId){
		return self::keySearch($jobSeekerId,'seeker_id');
	}
	
	public static function isValidId($jobSeekerId){
		$searchResult = self::getJobSeeker($jobSeekerId);
		return ($searchResult->num_rows == 1);
	}

}

?>