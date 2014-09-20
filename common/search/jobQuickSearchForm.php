<?php
/* A class to generate the quick search form */

require_once __DIR__.'/../databaseAccess/tables/region.php';
require_once __DIR__.'/../databaseAccess/tables/jobCategory.php';

class JobQuickSearchForm {
	
	/* Form attributes */	
	protected $actionUrl;	
	const actionUrlSuffix = "jobQuickSearchDisplay.php";
	const method = "post";	
	const formName = "searchForm";
	
	const keywordsFieldName = "keywords";
	const regionIdFieldName = "regionId";
	const anyRegionCode = 0;	
	const jobCategoryIdFieldName = "jobCaterogyId";
	const anyJobCategoryCode = 0;	

	const submitButtonName = "search";
	const resetButtonName = "reset form";

	protected $searchedKeyword;
	protected $searchedRegionId;
	protected $searchedJobCategoryId;

	/* Methods */

	/**
	 * @param $pathToActionUrl should be the relative path from the caller of this constructor to "common/search/"
	 */
	public function __construct($pathToActionUrl){
		$this->actionUrl = $pathToActionUrl.static::actionUrlSuffix;
		
		$this->searchedKeyword = "";
		$this->searchedRegionId = static::anyRegionCode;
		$this->searchedJobCategoryId = static::anyJobCategoryCode;
	}

	public function setSearchedKeywords($keyword){
		$this->searchedKeyword = $keyword;
	}
	
	public function getSearchedKeywords(){
		return $this->searchedKeyword;
	}
	
	public function setSearchedRegionId($regionId){
		$this->searchedRegionId = $regionId;
	}
	
	public function getSearchedRegionId(){
		return $this->searchedRegionId;
	}
	
	public function setSearchedJobCategoryId($jobCategory){
		$this->searchedJobCategoryId = $jobCategory;
	}

	public function getSearchedJobCategoryId(){
		return $this->searchedJobCategoryId;
	}


	protected function fieldKeywords(){
		$output = "";

		$type = "text";		
		$maxlength = 256;
		$autofocus = "autofocus=\"true\"";
		
		$output.= "Keywords: <input name=\"".static::keywordsFieldName."\" value=\"$this->searchedKeyword\" type=\"$type\" maxlength=\"$maxlength\" $autofocus>\n";
		
		return $output;
	}


	protected function fieldRegion($jsAction = ""){
		$output = "";
		
		$allRegions = Region::getAllRows();
		echo "HERE";
		$output.= "<select name=\"".static::regionIdFieldName."\" $jsAction>\n";

		/* The following logic will determine the selected option */
		/* Chose a do...while() in order to avoid code duplication for the 'selected' option logic */
		$regionId = static::anyRegionCode;
		$regionName = "Any region";
		$firstRow = true;
		do {
			if (!$firstRow) {
				$regionId = Region::getRegionId($row);	
				$regionName = Region::getRegionName($row);	
			}
			else {
				$firstRow = false;
			}
			if ($this->searchedRegionId == $regionId){
				$selected = "selected";
			}
			else {
				$selected = "";
			}
			
			/* here is the actual option output */
			$output.= " <option $selected value =\"$regionId\">$regionName</option>\n";

		} while (($row = $allRegions->fetch_row())!= NULL);

		$output.= "</select>\n";
		
		return $output;		
	}


	protected function fieldJobCategory($jsAction = ""){
		$output = "";
		
		$allJobCategories = JobCategory::getAllRows();
		$output.= "<select name=\"".static::jobCategoryIdFieldName."\" $jsAction>\n";

		/* The following logic will determine the selected option */
		/* Chose a do...while() in order to avoid code duplication for the 'selected' option logic */
		/* !!! As this is a copy+paste from the previous function, there should be a code optimisation to it */
		$jobCategoryId = static::anyJobCategoryCode;
		$jobCategoryName = "Any job category";
		$firstRow = true;
		do {
			if (!$firstRow) {
				$jobCategoryId = JobCategory::getJobCategoryId($row);	
				$jobCategoryName = JobCategory::getJobCategoryName($row);	
			}
			else {
				$firstRow = false;
			}
			if ($this->searchedJobCategoryId == $jobCategoryId){
				$selected = "selected";
			}
			else {
				$selected = "";
			}
			
			/* here is the actual option output */
			$output.= " <option $selected value =\"$jobCategoryId\">$jobCategoryName</option>\n";

		} while (($row = $allJobCategories->fetch_row())!= NULL);

		$output.= "</select>\n";
		
		return $output;		
	}


	protected static function submitButton(){
		$output = "";
		
		$type = "submit";
		$output.= "<input name=\"".static::submitButtonName."\" type=\"$type\">\n";
		
		return $output;		
	}

	protected static function resetButton(){
		$output = "";
		
		$type = "reset";
		$output.= "<input name=\"".static::resetButtonName."\" type=\"$type\">\n";
		
		return $output;		
	}

	protected function formFields(){
		$output = "";

		$output.= $this->fieldKeywords();		
		$output.= $this->fieldRegion();		
		$output.= $this->fieldJobCategory();		

		return $output;		
	}

	public function outputForm(){
		$output = "";
		
		/* form header */
		$output.= "<form name=\"".static::formName."\" action=\"".$this->actionUrl."\" method=\"".static::method."\">\n";
		
		/* fields */
		$output.= $this->formFields();
		$output.= static::submitButton();		
		$output.= static::resetButton();		

		/* form footer */
		$output.= "</form>\n";
		echo '$output';
		return $output;
	}

}

?>