<?php
/* Class to handle the seekerjob_shortlist table */

require_once __DIR__.'/../general/table.php';

class SeekerJobShortlist extends Table{
	
	/* Table structure */
		
	/**
	 * Overrides Table::tableName()
	 */	
	protected static function tableName(){
		return "seekerjob_shortlist";
	}
	
	/**
	 * Overrides Table::tableFields()
	 */	
	protected static function tableFields(){
		return array('shortlist_id', 'seeker_id', 'job_id');
	}


	/* Methods */

	
}

?>