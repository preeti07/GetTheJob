<?php
/* Just for testing the advancedSearchForm */

require_once __DIR__.'/../search/jobAdvancedSearchForm.php';

$form = new JobAdvancedSearchForm("../search/");
echo $form->outputForm();


?>