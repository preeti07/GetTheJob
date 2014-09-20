<?php
/* Class to handle the district table */

require_once __DIR__.'/../general/table.php';

class JobSubCategory extends Table {

	/* Table structure */
	
	/**
	 * Overrides Table::tableName()
	 */	
	protected static function tableName(){
		return "job_sub_category";
	}

	/**
	 * Overrides Table::tableFields()
	 */	
	protected static function tableFields(){
		return array('subcategory_id', 'subcategory_name', 'category_id');
	}

	
	/* Methods */

	public static function getJobSubCategory($jobSubCategoryId){
		return self::keySearch($jobSubCategoryId,'subcategory_id');
	}

	public static function getJobSubCategoryId($jobSubCategory){
		return self::getField('SubCategoryId',$jobSubCategory);
	}

	public static function getJobSubCategoryName($jobSubCategory){
		return self::getField('subcategory_name',$jobSubCategory);
	}

	public static function getJobCategoryId($jobSubCategory){
		return self::getField('category_id',$jobSubCategory);
	}

	public static function getJobSubCategoryList($jobCategoryId){
		return self::fieldSearch($jobCategoryId,'category_id');
	}
	public static function getAllSubJobCategory(){
		return self::getAllRows();
	}
}

?>