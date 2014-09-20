<?php
/* Just for testing the jobQuickSearchForm */

require_once __DIR__.'/../search/jobQuickSearchForm.php';

$form = new JobQuickSearchForm("../search/");
echo $form->outputForm();


?>