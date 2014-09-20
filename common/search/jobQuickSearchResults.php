<?php
/* This PHP script will return the result list of a quick job search */

require_once __DIR__.'/jobQuickSearchForm.php';
require_once __DIR__.'/../databaseAccess/tables/job.php';

class JobQuickSearchResults {
	
	protected $jobSearchForm; 

	protected $isSearchedSortOrderKeywords;
		
	/* Constructor - getting the search parameters */

	/* To avoid rewriting the constructor for the child class */
	protected function __constructSearchForm(){
		$this->jobSearchForm = new JobQuickSearchForm("");
	}
		
	public function __construct(){
		$this->__constructSearchForm();	
		if (isset($_POST)){
			$this->jobSearchForm->setSearchedKeywords($_POST[JobQuickSearchForm::keywordsFieldName]);
			$this->jobSearchForm->setSearchedRegionId($_POST[JobQuickSearchForm::regionIdFieldName]);
			$this->jobSearchForm->setSearchedJobCategoryId($_POST[JobQuickSearchForm::jobCategoryIdFieldName]);
		}
		$this->isSearchedSortOrderKeywords = false;	
	}	
	

	/* Queries */
	
	protected static function queryConditionDate(){
		$condition = "";
		
		$todayFormatted = date("Y-m-d")." 00:00:00";
		$condition.= "`start_ad_date` <= '$todayFormatted' AND `end_ad_date` >= '$todayFormatted'"; 
				
		return $condition;
	}

	/**
	 * Performs a MySQL natural language search;
	 * Can be optimised to include 2 and 3 letter words
	 */
	protected static function queryConditionKeywords($keywords){
		$condition = "";
		
		if (!empty($keywords)){
			$condition.= "(MATCH (`job_title`,`job_description`) AGAINST ('$keywords') > 0.2)";
		}
		
		return $condition;
	}


	protected static function queryConditionRegionId($regionId){
		/* Only district IDs available in the job table, so have to retrieve them from the district table */
		$districtRows = District::getDistrictList($regionId);
		
		$districtList = "";
		while (($districtRow = $districtRows->fetch_row()) != NULL){
			$districtList.= District::getDistrictId($districtRow).", ";
		}
		
		$condition = "";
		if (!empty($districtList)) {
			$districtList = substr($districtList, 0, -strlen(", "));
			$condition = "`district_id` IN ($districtList)";
		}

		return $condition;
	} 
	
	
	protected static function queryConditionJobCategoryId($jobCategoryId){
		/* Only jobSubCategory IDs available in the job table, so have to retrieve them from the jobSubCaterogy table */
		$jobSubCategoryRows = JobSubCategory::getJobSubCategoryList($jobCategoryId);
		
		$jobSubCategoryList = "";
		while (($jobSubCategoryRow = $jobSubCategoryRows->fetch_row()) != NULL){
			$jobSubCategoryList.= JobSubCategory::getJobSubCategoryId($jobSubCategoryRow).", ";
		}
		
		$condition = "";
		if (!empty($jobSubCategoryList)) {
			$jobSubCategoryList = substr($jobSubCategoryList, 0, -strlen(", "));
			$condition = "`subcategory_id` IN ($jobSubCategoryList)";
		}

		return $condition;
	} 


	protected function searchCondition(){
		$conditionList = array();	
		
		/* date validation check will always be done */
		array_push($conditionList, static::queryConditionDate());
				
		$conditionKeywords = static::queryConditionKeywords($this->jobSearchForm->getSearchedKeywords());
		if (!empty($conditionKeywords)){
			array_push($conditionList, $conditionKeywords);
		}

		$conditionRegionId = static::queryConditionRegionId($this->jobSearchForm->getSearchedRegionId());
		if (!empty($conditionRegionId)){
			array_push($conditionList, $conditionRegionId);
		}

		$conditionJobCategoryId = static::queryConditionJobCategoryId($this->jobSearchForm->getSearchedJobCategoryId());
		if (!empty($conditionJobCategoryId)){
			array_push($conditionList, $conditionJobCategoryId);
		}

		$conditionQuery = "";
		
		foreach ($conditionList as $condition){
			$conditionQuery.= " AND $condition";
		}
		/* condition query is not empty because it will always be date related (will not show expired jobs) */
		$conditionQuery = substr($conditionQuery, strlen(" AND "));

		return $conditionQuery;
	}




	/* output */
	
	protected function outputSearchForm(){
		$output = "";
		
		$output.= "You searched for: <br>\n";
		$output.= $this->jobSearchForm->outputForm();		
		
		return $output;
	}

	protected static function outputJob($job){
		$output = "";
		
		$output.= "<td>".Job::getRegion($job)."</td>\n";	
		$output.= "<td>".Job::getDistrict($job)."</td>\n";	
		$output.= "<td>".Job::getWorkType($job)."</td>\n";	
		$output.= "<td>".Job::getJobCategory($job)."</td>\n";	
		$output.= "<td>".Job::getJobSubCategory($job)."</td>\n";	
		$output.= "<td>".Job::getJobTitle($job)."</td>\n";	
		$output.= "<td>".Job::getJobDescription($job)."</td>\n";	
		/* These last fields need formatting */
		$formattedSalaryLow = sprintf("%-6d",Job::getSalaryLow($job));
		$formattedSalaryHigh = sprintf("%-6d",Job::getSalaryHigh($job));
		$startDate = new DateTime(Job::getDateOfAdvertisement($job));
		$formattedStartDate = $startDate->format("j M Y");  
		$endDate = new DateTime(Job::getEndDateOfAdvertisement($job));
		$formattedEndDate = $endDate->format("D, j M Y");  
		$output.= "<td>$$formattedSalaryLow - $$formattedSalaryHigh</td>\n";	
		$output.= "<td>$formattedStartDate</td>\n";	
		$output.= "<td>$formattedEndDate</td>\n";	
			
		return $output;
	}

	protected function outputJobResults(){
		if (!$this->isSearchedSortOrderKeywords){
			$jobList = Job::selectRows($this->searchCondition());
		}
		else {
			$jobList = Job::selectRowsByKeywords($this->searchCondition(),$this->jobSearchForm->getSearchedKeywords());
		}
		
		$output = "";
		
		if (!empty($jobList)){
			$jobsNumber = $jobList->num_rows;
		}
		else {
			$jobsNumber = 0;
		}
		$output.= "Found $jobsNumber jobs<br>\n";
		
		if ($jobsNumber != 0) {
			/* Display a short table with information */
	
			$output.= "<table border=\"1\">\n";
			/* header */
			$output.= "<tr>\n";
			$output.= "<th>Crt. no.</th>\n";
			$output.= "<th>Shortlist</th>\n";
			$output.= "<th>Region</th>\n";
			$output.= "<th>District</th>\n";
			$output.= "<th>WorkType</th>\n";
			$output.= "<th>Category</th>\n";
			$output.= "<th>SubCategory</th>\n";
			$output.= "<th>Job Title</th>\n";
			$output.= "<th>Job Description</th>\n";
			$output.= "<th>Salary Range</th>\n";
			$output.= "<th>Start Date</th>\n";
			$output.= "<th>End Date</th>\n";
			$output.= "</tr>\n";
			
			$count = 0;
			while (($job = $jobList->fetch_row()) != NULL){
				$count++;
				$output.= "<tr>\n";
				$output.= "<td><a href=\"jobDisplay.php?jobId=".Job::getJobId($job)."\">$count</td>\n";	
				$output.= "<td><a href=\"../developerPlayGround/jobShortList.php?jobId=".Job::getJobId($job)."\">add to shortlist</td>\n";	
				$output.= static::outputJob($job);
				$output.= "</tr>";
			}
		
			$output.= "</table>\n";
		}

		return $output;
	}

	public function outputPage(){
		$output = "";	
			
		$output.= $this->outputSearchForm();
		$output.= "<hr>\n";
		$output.= "Search query is [".$this->searchCondition()."]<br>\n";
		$output.= $this->outputJobResults();
		
		return $output;		
	}
	
}

?>