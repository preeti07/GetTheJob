<?php
/* Class to handle the job table */

require_once __DIR__.'/../general/table.php';
require_once __DIR__.'/district.php';
require_once __DIR__.'/jobCategory.php';
require_once __DIR__.'/jobSubCategory.php';
require_once __DIR__.'/region.php';
require_once __DIR__.'/workType.php';

class Job extends Table{

	/* Table structure */
		
	/**
	 * Overrides Table::tableName()
	 */	
	protected static function tableName(){
		return "job";
	}

	/**
	 * Overrides Table::tableFields()
	 */	
	protected static function tableFields(){
		return array('job_id', 'job_title', 'job_description', 'work_type_id', 'district_id', 'subcategory_id', 'salary_low', 'salary_high', 'start_ad_date', 'end_ad_date', 'experience_level', 'employer_id');
	}

	
	/* Methods */

	public static function getJob($jobId){
		return self::keySearch($jobId,'job_id');
	}

	/* Fields retrieval */
	/* !!! Derived information is now retrieved through multiple selections */
	/* !!! A caching system would be beneficial, at least for the common fields (work_type, Regions etc.) */
	public static function getAllJob(){
		return self::getAllRows();
	}
	
	public static function getJobId($job){
		return self::getField('job_id', $job);
	}	
	
	public static function getJobTitle($job){
		return self::getField('job_title', $job);
	}	
	
	public static function getJobDescription($job){
		return self::getField('job_description', $job);
	}	
	
	public static function getWorkTypeId($job){
		return self::getField('work_type_id', $job);
	}

	public static function getWorkType($job){
		return WorkType::getWorkTypeName(WorkType::getWorkType(self::getWorkTypeId($job)));
	}	
	
	public static function getDistrictId($job){
		return self::getField('district_id', $job);
	}	

	public static function getDistrict($job){
		/* job -> DistrictId => District row -> district_name */
		/* -> is array access; => is query access */
		return District::getDistrictName(District::getDistrict(self::getDistrictId($job)));
	}	

	public static function getRegion($job){
		/* job -> DistrictId => District row -> RegionId => Region row -> region_name */
		/* -> is array access; => is query access */
		return Region::getRegionName(Region::getRegion(District::getRegionId(District::getDistrict(self::getDistrictId($job)))));
	}	

	public static function getJobSubCategoryId($job){
		return self::getField('subcategory_id', $job);
	}	
	
	public static function getJobSubCategory($job){
		/* job -> JobSubCategoryId => JobSubCategory row -> JobSubCategoryName */
		/* -> is array access; => is query access */
		return JobSubCategory::getJobSubCategoryName(JobSubCategory::getJobSubCategory(self::getJobSubCategoryId($job)));
	}	
	
	public static function getJobCategory($job){
		/* job -> JobSubCategoryId => JobSubCategory row -> JobCategoryId => JobCategory row -> JobCateogryName */
		/* -> is array access; => is query access */
		return JobCategory::getJobCategoryName(JobCategory::getJobCategory(JobSubCategory::getJobCategoryId(JobSubCategory::getJobSubCategory(self::getJobSubCategoryId($job)))));
	}	

	public static function getSalaryLow($job){
		return self::getField('salary_low', $job);
	}	
	
	public static function getSalaryHigh($job){
		return self::getField('salary_high', $job);
	}	
	
	public static function getDateOfAdvertisement($job){
		return self::getField('start_ad_date', $job);
	}	
	
	public static function getEndDateOfAdvertisement($job){
		return self::getField('end_ad_date', $job);
	}	
	
	
	public static function selectRowsByKeywords($condition, $keywords){
		$queryCondition = " WHERE $condition";
		$query = "SELECT *,(MATCH (`job_title`,`job_description`) AGAINST ('$keywords')) as `relevance` FROM ".(static::tableName())."$queryCondition;";
		return MysqliConnection::getConnection()->query($query);
	}
	
}

?>