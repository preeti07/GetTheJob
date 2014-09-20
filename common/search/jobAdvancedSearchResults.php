<?php
/* A class to display the advanced search results */

require_once __DIR__.'/jobQuickSearchResults.php';
require_once __DIR__.'/jobAdvancedSearchForm.php';


class JobAdvancedSearchResults extends JobQuickSearchResults {

	/* Constructor - getting the search parameters */
	protected function __constructSearchForm(){
		$this->jobSearchForm = new JobAdvancedSearchForm("");
	}
		
	public function __construct(){
		parent::__construct();
		if (isset($_POST)){
			$this->jobSearchForm->setSearchedDistrictId($_POST[JobAdvancedSearchForm::districtIdFieldName]);
			$this->jobSearchForm->setSearchedJobSubCategoryId($_POST[JobAdvancedSearchForm::jobSubCategoryIdFieldName]);
			$this->jobSearchForm->setSearchedWorkTypeId($_POST[JobAdvancedSearchForm::workTypeIdFieldName]);
			
			/* swap the salaries if they are the wrong way around (low > high) */
			$salaryLow = $_POST[JobAdvancedSearchForm::salaryLowFieldName]; 
			$salaryHigh = $_POST[JobAdvancedSearchForm::salaryHighFieldName]; 
			if ($salaryLow > $salaryHigh){
				$temp = $salaryLow;
				$salaryLow = $salaryHigh;
				$salaryHigh = $temp;				
			}
			$this->jobSearchForm->setSearchedSalaryLow($salaryLow);
			$this->jobSearchForm->setSearchedSalaryHigh($salaryHigh);
			
			$this->jobSearchForm->setSearchedSortOrder($_POST[JobAdvancedSearchForm::sortOrderFieldName]);
			if (    ( $this->jobSearchForm->getSearchedSortOrder() == JobAdvancedSearchForm::sortOrderKeywords )
			     && ( $this->jobSearchForm->getSearchedKeywords()  != "" ) 
			   ){
				$this->isSearchedSortOrderKeywords = true;
			}
		}
	}	
	
	
	/* Queries */
	
	/**
	 * supersedes JobQuickSearchResults::queryConditionRegionId($regionId), but not a big overhead !!!
	 */
	protected static function queryConditionDistrictId($districtId){
		$condition = "";

		if ($districtId != JobAdvancedSearchForm::anyDistrictCode) {
			$condition = "`district_id` = $districtId";
		}

		return $condition;
	} 
	
	/**
	 * supersedes JobQuickSearchResults::queryConditionJobCategoryId($jobCategoryId), but not a big overhead !!!
	 */
	protected static function queryConditionJobSubCategoryId($jobSubCategoryId){
		$condition = "";

		if ($jobSubCategoryId != JobAdvancedSearchForm::anyJobSubCategoryCode) {
			$condition = "`subcategory_id` = $jobSubCategoryId";
		}

		return $condition;
	} 
	
	protected static function queryConditionWorkTypeId($workTypeId){
		$condition = "";

		if ($workTypeId != JobAdvancedSearchForm::anyWorkTypeCode) {
			$condition = "`work_type_id` = $workTypeId";
		}

		return $condition;
	} 
	
	protected static function queryConditionSalary($salaryLow, $salaryHigh){
		$condition = "";

		if ($salaryLow != $salaryHigh) {
			if ($salaryHigh == JobAdvancedSearchForm::$salaryThresholds1000[count(JobAdvancedSearchForm::$salaryThresholds1000)-1] * 1000){
				$salaryHigh = JobAdvancedSearchForm::salaryHighMax1000 * 1000;
			}
			$condition = "`salary_low` <= $salaryHigh AND `salary_high` >= $salaryLow";
		}

		return $condition;
	} 
	
	protected static function queryConditionSortOrder($sortOrder){
		$condition = "";
		
		switch ($sortOrder){
				
			case JobAdvancedSearchForm::sortOrderKeywords:{
				$condition.= "ORDER BY `relevance` DESC";
			}break; 	
			
			case JobAdvancedSearchForm::sortOrderSalary: {
				$condition.= "ORDER BY `salary_low` DESC";
			}break;

			case JobAdvancedSearchForm::sortOrderDate: {
				$condition.= "ORDER BY `start_ad_date` DESC";
			}break;

			case JobAdvancedSearchForm::sortOrderAuto: 	
			default:
				/* leave it empty */
				break;
		}

		return $condition;
	}

	protected function searchCondition(){
		$conditionList = array();	
		
		$conditionQuery = "";
		
		/* will insert here the additional conditions */
		$conditionDistrictId = static::queryConditionDistrictId($this->jobSearchForm->getSearchedDistrictId());
		if (!empty($conditionDistrictId)){
			array_push($conditionList, $conditionDistrictId);
		}

		$conditionJobSubCategoryId = static::queryConditionJobSubCategoryId($this->jobSearchForm->getSearchedJobSubCategoryId());
		if (!empty($conditionJobSubCategoryId)){
			array_push($conditionList, $conditionJobSubCategoryId);
		}

		$conditionWorkTypeId = static::queryConditionWorkTypeId($this->jobSearchForm->getSearchedWorkTypeId());
		if (!empty($conditionWorkTypeId)){
			array_push($conditionList, $conditionWorkTypeId);
		}

		$conditionSalary = static::queryConditionSalary($this->jobSearchForm->getSearchedSalaryLow(),$this->jobSearchForm->getSearchedSalaryHigh());
		if (!empty($conditionSalary)){
			array_push($conditionList, $conditionSalary);
		}

		
		foreach ($conditionList as $condition){
			$conditionQuery.= " AND $condition";
		}

		if (!empty($conditionQuery)){
			$conditionQuery = substr($conditionQuery, strlen(" AND "));
			$conditionQuery = parent::searchCondition()." AND ".$conditionQuery;
		}
		else {
			/* will never be empty because it contains the DATE condition */	
			$conditionQuery = parent::searchCondition();
		}


		/* add the searchSortOrder condition */
		$queryConditionSortOrder = $this->queryConditionSortOrder($this->jobSearchForm->getSearchedSortOrder());
		if (!empty($queryConditionSortOrder)) {
			$conditionQuery.= " ".$queryConditionSortOrder;
		}
		
		return $conditionQuery;
	}


	
	
}

?>