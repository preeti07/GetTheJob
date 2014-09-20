<?php
/* Class to handle the jobCategory table */

require_once __DIR__.'/../general/table.php';

class JobCategory extends Table {

	/* Table structure */
	
	/**
	 * Overrides Table::tableName()
	 */	
	protected static function tableName(){
		return "job_category";
	}

	/**
	 * Overrides Table::tableFields()
	 */	
	protected static function tableFields(){
		return array('category_id', 'category_name');
	}

	
	/* Methods */

	public static function getJobCategory($jobCategoryId){
		return self::keySearch($jobCategoryId,'category_id');
	}

	public static function getJobCategoryId($jobCategory){
		return self::getField('category_id',$jobCategory);
	}

	public static function getJobCategoryName($jobCategory){
		return self::getField('category_name',$jobCategory);
	}
	public static function getAllJobCategory(){
		return self::getAllRows();
	}
}

?>