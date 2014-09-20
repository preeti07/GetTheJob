<?php
/* 
 * Class to generate an SQL script for inserting fields into the 'job' table
 * Desired output will look something like this:
 * INSERT INTO `get-the-job`.`job` (`job_id`, `job_title`, `job_description`, `work_type_id`, `district_id`, `subcategory_id`, `salary_low`, `salary_high`, `start_ad_date`, `end_ad_date`) VALUES (NULL, 'Job in Waikato', 'Job description(1) for job in Hamilton(7), Waikato(13), part-time(2),Banking, finance &amp; insurance(3), Analysts(14), salary range 80.000 - 100.000, date advertised: 14-05-2013, valid through 28-06-2013', '2', '13', '14', '80000', '100000', '2013-05-14 00:00:00', '2013-06-28 00:00:00');
 */

require_once __DIR__.'/../databaseAccess/general/mysqliConnection.php';

require_once __DIR__.'/../databaseAccess/tables/district.php';
require_once __DIR__.'/../databaseAccess/tables/job.php';
require_once __DIR__.'/../databaseAccess/tables/jobCategory.php';
require_once __DIR__.'/../databaseAccess/tables/jobSubCategory.php';
require_once __DIR__.'/../databaseAccess/tables/region.php';
require_once __DIR__.'/../databaseAccess/tables/workType.php';

  
class JobInsertRandom {
	
	public function insertRandomRow(){
		/* generate the field values */
		
		/* first generate the random values, then add them to query */
		$workTypeId = rand(1, WorkType::getRowsNumber());
		$districtId = rand(1, District::getRowsNumber());
		$jobSubCategoryId = rand(1, JobSubCategory::getRowsNumber());
		$salaryLow = rand(20,200)*1000;
		$salaryRange = rand(5,30)*1000;
		$daysOffset = -60+rand(1,90);
		$startDate = strtotime(sprintf("%+d",$daysOffset)." day");
		$endDate = strtotime(sprintf("%+d",$daysOffset+30)." day");

		/* Processing this information */
		$workType = WorkType::getWorkTypeName(WorkType::getWorkType($workTypeId));
		$district = District::getDistrict($districtId);
		$districtName = District::getDistrictName($district);
		$regionName = Region::getRegionName(Region::getRegion(District::getRegionId($district)));
		$jobSubCategory = JobSubCategory::getJobSubCategory($jobSubCategoryId);
		$jobSubCategoryName = JobSubCategory::getJobSubCategoryName($jobSubCategory);
		$jobCategoryId = JobSubCategory::getJobCategoryId($jobSubCategory);
		$jobCategoryName = JobCategory::getJobCategoryName(JobCategory::getJobCategory($jobCategoryId));
		$salaryHigh = $salaryLow + $salaryRange;
										
		$jobTitle = "Job in $regionName";
		$jobDescription = "$jobSubCategoryName ".strtolower($workType)." job in $districtName, $regionName, in the domain of $jobCategoryName, salary from \$$salaryLow to \$$salaryHigh.\n";
		$jobDescription.= "Posted on ".date("D, jS \of F, Y", $startDate).", valid until ".date("D, jS \of F, Y", $endDate);
		/* Now build the query with the values generated above */
		
		/* job_id */
		$values = "NULL"; //AUTO_INCREMENT field
		
		/* job_title */
		$values.=", '$jobTitle'";
		
		/* job_description */
		$values.=", '$jobDescription'";
		
		/* work_type_id */
		$values.= ", '$workTypeId'";
		
		/* district_id */
		$values.= ", '$districtId'";
		
		/* subcategory_id */
		$values.= ", '$jobSubCategoryId'";
		
		/* salary_low */
		$values.= ", '$salaryLow'";

		/* SalaryHihg */
		$values.= ", '$salaryHigh'";

		/* start_ad_date */
		/* format: '2013-05-14 00:00:00' */
		$values.= ", '".date("Y-m-d 00:00:00", $startDate)."'";
		
		/* end_ad_date */
		$values.= ", '".date("Y-m-d 00:00:00", $endDate)."'";
				

		/* Build the query */
		$query = Job::insertRowQuery($values);
		
		return $query;
	}

	public function insertRandomJobsQuery(){
		$query = "";	
		for ($i=0; $i<500; $i++) {
			$query.= $this->insertRandomRow()."<br>\n";
		}
		return $query;
	}
	
}

$jobInsertRandom = new JobInsertRandom();
echo $jobInsertRandom->insertRandomJobsQuery();    

?>