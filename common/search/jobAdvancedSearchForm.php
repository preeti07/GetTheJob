<?php
/* A class to generate the Advanced search form */

require_once __DIR__.'/jobQuickSearchForm.php';

require_once __DIR__.'/../databaseAccess/tables/district.php';
require_once __DIR__.'/../databaseAccess/tables/jobSubCategory.php';
require_once __DIR__.'/../databaseAccess/tables/workType.php';

class JobAdvancedSearchForm extends JobQuickSearchForm{

	/* Properties */

	const actionUrlSuffix = "jobAdvancedSearchDisplay.php";	
	
	const districtIdFieldName = "districtId";
	const anyDistrictCode = 0;
	const jobSubCategoryIdFieldName = "jobSubCategoryId";
	const anyJobSubCategoryCode = 0;
	const workTypeIdFieldName = "workTypeId";
	const anyWorkTypeCode = 0;
	const salaryLowFieldName = "salaryLow";
	const salaryHighFieldName = "salaryHigh";
	const salaryHighMax1000 = 1000;
	public static $salaryThresholds1000 = array(0, 20, 35, 50, 75, 100);
	
	const sortOrderFieldName = "sortOrder";
	const sortOrderAuto = "auto";
	const sortOrderKeywords = "keywords";
	const sortOrderSalary = "salary";
	const sortOrderDate = "date";
	protected static $sortOrderFieldsDisplay = array(self::sortOrderAuto=>"Auto", self::sortOrderKeywords=>"Keyword relevance", self::sortOrderDate=>"Date (latest first)", self::sortOrderSalary=>"Salary (highest first)");
	
	protected $searchedDistrictId;
	protected $searchedJobSubCategoryId;
	protected $searchedWorkTypeId;
	protected $searchedSalaryLow;
	protected $searchedSalaryHigh;
	protected $searchedSortOrder;
	
	const jsRegionOnChange = "onChange=\"districtUpdate(this.selectedIndex)\"";
	const jsJobCategoryOnChange = "onChange=\"jobSubCategoryUpdate(this.selectedIndex)\"";

	/* Methods */
	public function __construct($pathToActionUrl){
		parent::__construct($pathToActionUrl);
		$this->searchedDistrictId = static::anyDistrictCode;
		$this->searchedJobSubCategoryId = static::anyJobSubCategoryCode;
		$this->searchedWorkTypeId = static::anyWorkTypeCode;
		$this->searchedSalaryLow = 0;
		$this->searchedSalaryHigh = static::salaryHighMax1000*1000;
		$this->searchedSortOrder = static::$sortOrderFieldsDisplay[static::sortOrderAuto];
	}
	
	public function setSearchedDistrictId($districtId){
		$this->searchedDistrictId = $districtId;	
	}

	public function getSearchedDistrictId(){
		return $this->searchedDistrictId;	
	}

	public function setSearchedJobSubCategoryId($jobSubCategoryId){
		$this->searchedJobSubCategoryId = $jobSubCategoryId;	
	}

	public function getSearchedJobSubCategoryId(){
		return $this->searchedJobSubCategoryId;	
	}

	public function setSearchedWorkTypeId($workTypeId){
		$this->searchedWorkTypeId = $workTypeId;	
	}

	public function getSearchedWorkTypeId(){
		return $this->searchedWorkTypeId;	
	}

	public function setSearchedSalaryLow($salaryLow){
		$this->searchedSalaryLow = $salaryLow;	
	}

	public function getSearchedSalaryLow(){
		return $this->searchedSalaryLow;	
	}

	public function setSearchedSalaryHigh($salaryHigh){
		$this->searchedSalaryHigh = $salaryHigh;	
	}

	public function getSearchedSalaryHigh(){
		return $this->searchedSalaryHigh;	
	}

	public function setSearchedSortOrder($sortOrder){
		$this->searchedSortOrder = $sortOrder;	
	}

	public function getSearchedSortOrder(){
		return $this->searchedSortOrder;	
	}


	protected function fieldDistrict(){
		$output = "";
		
		$output.= "<select name=\"".static::districtIdFieldName."\">\n";
		/* dynamically select the required district on page load */
		/* will be overwritten at first change */
		/* could have simply written a call to updateDistrict at 'onload' event */
		/* but this is only an attribute of <BODY>, and do not want to complicate the form */
		if ($this->searchedRegionId != static::anyRegionCode){
			$districtList = District::getDistrictList($this->searchedRegionId);
			$selected = "";
			if ($this->searchedDistrictId == static::anyDistrictCode){
				$selected = "selected";
			}
			$output.= " <option $selected value =\"".static::anyDistrictCode."\">Any district</option>\n";
			while (($district = $districtList->fetch_row()) != NULL){
				$districtId = District::getDistrictId($district);
				$districtName = District::getDistrictName($district);
				$selected = "";
				if ($this->searchedDistrictId == $districtId){
					$selected = "selected";
				}
				/* here is the actual option output */
				$output.= " <option $selected value =\"$districtId\">$districtName</option>\n";
			}
		}
		else {
			$output.= "<option value=\"".static::anyDistrictCode."\">Select region first</option>\n";
		}
		$output.= "</select>\n";
		
		/* must include the JavaScript as well */
		$output.= "<script>\n";
		$output.= $this->jsDistrictUpdate()."\n";
		$output.= "</script>\n";
		
		return $output;
	}

	protected function jsDistrictUpdate(){
		$output = "";
		
		/* create the region <-> district connection */
		$output.= "var districtNames = new Array();\n";
		$output.= "var districtIds = new Array();\n";
		$output.= "districtNames[".static::anyRegionCode."] = [\"Select region first\"];\n";
		$output.= "districtIds[".static::anyRegionCode."] = [\"".static::anyDistrictCode."\"];\n";
		$regionList = Region::getAllRows();
		$regionCount = 0;
		while (($region = $regionList->fetch_row())!= NULL){
			$regionId = Region::getRegionId($region);
			$districtList = District::getDistrictList($regionId);
			
			/* first the district names */
			$output.= "districtNames[$regionId] = [\"Any district\"";
			while (($district = $districtList->fetch_row())!= NULL){
				$output.= ", \"".District::getDistrictName($district)."\"";
			}
			$output.= "];\n";
			
			/* then the district Ids */
			$output.= "districtIds[$regionId] = [\"".static::anyDistrictCode."\"";
			$districtList->data_seek(0);
			while (($district = $districtList->fetch_row())!= NULL){
				$output.= ", \"".District::getDistrictId($district)."\"";
			}
			$output.= "];\n";
		}				
		
		/* print the districtUpdate() function */
		/* the below code is JavaScript */
		$output.= "\n";
		$output.= "districtList = document.".static::formName.".".static::districtIdFieldName.";\n";
		$output.= "function districtUpdate(selectedRegionId){\n";
		$output.= " districtList.options.length = 0;\n";
		$output.= " for (i=0; i < districtNames[selectedRegionId].length; i++) {\n";
		$output.= "      districtList.options[districtList.options.length] = new Option(districtNames[selectedRegionId][i],districtIds[selectedRegionId][i]);\n";
		$output.= " }\n";
		$output.= "}\n";
		
		return $output;
	}



	protected function fieldJobSubCategory(){
		$output = "";
		
		$output.= "<select name=\"".static::jobSubCategoryIdFieldName."\">\n";
		/* dynamically select the required jobSubCategory on page load */
		/* will be overwritten at first change */
		/* could have simply written a call to updateJobSubCategory at 'onload' event */
		/* but this is only an attribute of <BODY>, and do not want to complicate the form */
		if ($this->searchedJobCategoryId != static::anyJobCategoryCode){
			$jobSubCategoryList = JobSubCategory::getJobSubCategoryList($this->searchedJobCategoryId);
			$selected = "";
			if ($this->searchedJobSubCategoryId == static::anyJobSubCategoryCode){
				$selected = "selected";
			}
			$output.= " <option $selected value =\"".static::anyJobSubCategoryCode."\">Any job sub category</option>\n";
			while (($jobSubCategory = $jobSubCategoryList->fetch_row()) != NULL){
				$jobSubCategoryId = JobSubCategory::getJobSubCategoryId($jobSubCategory);
				$jobSubCategoryName = JobSubCategory::getJobSubCategoryName($jobSubCategory);
				$selected = "";
				if ($this->searchedJobSubCategoryId == $jobSubCategoryId){
					$selected = "selected";
				}
				/* here is the actual option output */
				$output.= " <option $selected value =\"$jobSubCategoryId\">$jobSubCategoryName</option>\n";
			}
		}
		else {
			$output.= "<option value=\"".static::anyJobSubCategoryCode."\">Select job category first</option>\n";
		}
		$output.= "</select>\n";
		
		/* must include the JavaScript as well */
		$output.= "<script>\n";
		$output.= $this->jsJobSubCategoryUpdate()."\n";
		$output.= "</script>\n";
		
		return $output;
	}

	protected function jsJobSubCategoryUpdate(){
		$output = "";
		
		/* create the jobCategory <-> jobSubCategory connection */
		$output.= "var jobSubCategoryNames = new Array();\n";
		$output.= "var jobSubCategoryIds = new Array();\n";
		$output.= "jobSubCategoryNames[".static::anyJobCategoryCode."] = [\"Select job category first\"];\n";
		$output.= "jobSubCategoryIds[".static::anyJobCategoryCode."] = [\"".static::anyJobSubCategoryCode."\"];\n";
		$jobCategoryList = JobCategory::getAllRows();
		$jobCategoryCount = 0;
		while (($jobCategory = $jobCategoryList->fetch_row())!= NULL){
			$jobCategoryId = JobCategory::getJobCategoryId($jobCategory);
			$jobSubCategoryList = JobSubCategory::getJobSubCategoryList($jobCategoryId);
			
			/* first the jobSubCategory names */
			$output.= "jobSubCategoryNames[$jobCategoryId] = [\"Any job sub category\"";
			while (($jobSubCategory = $jobSubCategoryList->fetch_row())!= NULL){
				$output.= ", \"".JobSubCategory::getJobSubCategoryName($jobSubCategory)."\"";
			}
			$output.= "];\n";
			
			/* then the jobSubCategory Ids */
			$output.= "jobSubCategoryIds[$jobCategoryId] = [\"".static::anyJobSubCategoryCode."\"";
			$jobSubCategoryList->data_seek(0);
			while (($jobSubCategory = $jobSubCategoryList->fetch_row())!= NULL){
				$output.= ", \"".JobSubCategory::getJobSubCategoryId($jobSubCategory)."\"";
			}
			$output.= "];\n";
		}				
		
		/* print the jobSubCategoryUpdate() function */
		/* the below code is JavaScript */
		$output.= "\n";
		$output.= "jobSubCategoryList = document.".static::formName.".".static::jobSubCategoryIdFieldName.";\n";
		$output.= "function jobSubCategoryUpdate(selectedJobCategoryId){\n";
		$output.= " jobSubCategoryList.options.length = 0;\n";
		$output.= " for (i=0; i < jobSubCategoryNames[selectedJobCategoryId].length; i++) {\n";
		$output.= "      jobSubCategoryList.options[jobSubCategoryList.options.length] = new Option(jobSubCategoryNames[selectedJobCategoryId][i],jobSubCategoryIds[selectedJobCategoryId][i]);\n";
		$output.= " }\n";
		$output.= "}\n";
		
		return $output;
	}



	protected function fieldWorkType(){
		$output = "";
		
		$allWorkTypes = WorkType::getAllRows();
		$output.= "<select name=\"".static::workTypeIdFieldName."\">\n";

		/* The following logic will determine the selected option */
		/* Chose a do...while() in order to avoid code duplication for the 'selected' option logic */
		$workTypeId = static::anyWorkTypeCode;
		$workTypeName = "Any work type";
		$firstRow = true;
		do {
			if (!$firstRow) {
				$workTypeId = WorkType::getWorkTypeId($row);	
				$workTypeName = WorkType::getWorkTypeName($row);	
			}
			else {
				$firstRow = false;
			}
			if ($this->searchedWorkTypeId == $workTypeId){
				$selected = "selected";
			}
			else {
				$selected = "";
			}
			
			/* here is the actual option output */
			$output.= " <option $selected value =\"$workTypeId.\">$workTypeName</option>\n";

		} while (($row = $allWorkTypes->fetch_row())!= NULL);

		$output.= "</select>\n";
		
		return $output;		
	}


	protected function fieldSalaryLow(){
		$output = "";
		$output.= " Salary from: <select name=\"".static::salaryLowFieldName."\">\n";

		foreach (static::$salaryThresholds1000 as $salaryThreshold){
			if ($this->searchedSalaryLow == $salaryThreshold*1000){
				$selected = "selected";
			}
			else {
				$selected = "";
			}
			/* here is the actual option output */
			$output.= " <option $selected value =\"". $salaryThreshold*1000 ."\">". $salaryThreshold*1000 ."</option>\n";
		} 
		
		$output.= "</select>\n";
		
		return $output;		
	}


	protected function fieldSalaryHigh(){
		$output = "";
		
		$output.= " to: <select name=\"".static::salaryHighFieldName."\">\n";

		foreach (static::$salaryThresholds1000 as $salaryThreshold){
			if ($this->searchedSalaryHigh == $salaryThreshold*1000){
				$selected = "selected";
			}
			else {
				$selected = "";
			}
			/* here is the actual option output */
			$output.= " <option $selected value =\"". $salaryThreshold*1000 ."\">". $salaryThreshold*1000 ."</option>\n";
		} 
		
		$output.= "</select>\n";
		
		return $output;		
	}
	
	
	protected function fieldSortOrder(){
		$output = "";
		
		$output.= " order by: <select name=\"".static::sortOrderFieldName."\">\n";

		foreach (static::$sortOrderFieldsDisplay as $fieldId => $displayText){
			if ($this->searchedSortOrder == $fieldId){
				$selected = "selected";
			}
			else {
				$selected = "";
			}
			/* here is the actual option output */
			$output.= " <option $selected value =\"$fieldId\">$displayText</option>\n";
		} 
		
		$output.= "</select>\n";
		
		return $output;
	}


	/*
	 * @overrides JobQuickSearchForm::formFields()
	 * */
	protected function formFields(){
		$output = "";

		/* will not use parent::formFields() due to javaScript insertion //$output.= parent::formFields(); */		
		$output.= $this->fieldKeywords();		
		$output.= $this->fieldRegion(static::jsRegionOnChange);		
		$output.= $this->fieldDistrict();		
		$output.= $this->fieldJobCategory(static::jsJobCategoryOnChange);		
		$output.= $this->fieldJobSubCategory();		
		$output.= $this->fieldWorkType();
		$output.= $this->fieldSalaryLow();
		$output.= $this->fieldSalaryHigh();
		$output.= $this->fieldSortOrder();
				
		return $output;		
	}
	

}

?>