<?php
/* Class to display a singular job */

require_once __DIR__.'/../databaseAccess/tables/job.php';

class JobDisplay {
		
	private $jobId;
	
	public function __construct(){
		if (isset($_GET['jobId'])){
			$this->jobId = $_GET['jobId'];
		}
		else {
			$this->jobId = 1;
		}
	} 
	
	/* Display the columns of a Job 
	 *  */
	private static function outputJob($jobId){
		$job = Job::getJob($jobId);	
		$output = "";

		$output.= "Job with ID: ".Job::getJobId($job)."<br>\n";

		/* Display a short table with information */

		$output.= "<table border=\"1\">\n";
		/* header */
		$output.= "<tr>\n";
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
		
		$output.= "<tr>\n";
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
		$output.= "</tr>";
	
		$output.= "</table>\n";

		return $output;
	}

	public function outputRequestedJob(){
		return self::outputJob($this->jobId);
	}
	
}

$jobDisplay = new JobDisplay();
echo $jobDisplay->outputRequestedJob();

?>


