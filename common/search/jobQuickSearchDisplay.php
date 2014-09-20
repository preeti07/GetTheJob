<?php
/* A simple page to display the Quick Search Results */

require_once __DIR__.'/jobQuickSearchResults.php';

$jobQuickSearchResults = new JobQuickSearchResults();
echo $jobQuickSearchResults->outputPage();

?>


