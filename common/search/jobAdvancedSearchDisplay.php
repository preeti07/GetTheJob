<?php
/* A simple page to display the Advanced Search Results */

require_once __DIR__.'/jobAdvancedSearchResults.php';

$jobAdvancedSearchResults = new JobAdvancedSearchResults();
echo $jobAdvancedSearchResults->outputPage();

?>


