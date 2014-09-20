<?php
/* Class to handle the workType table */

require_once __DIR__.'/../general/table.php';

class WorkType extends Table {
	
	/* Table structure */
		
	/**
	 * Overrides Table::tableName()
	 */	
	protected static function tableName(){
		return "work_type";
	}
	
	/**
	 * Overrides Table::tableFields()
	 */	
	protected static function tableFields(){
		return array('work_type_id', 'work_type');
	}

	
	/* Methods */

	public static function getWorkType($workTypeId){
		return self::keySearch($workTypeId,'work_type_id');
	}
	
	public static function getWorkTypeId($workType){
		return self::getField('work_type_id',$workType);
	}

	public static function getWorkTypeName($workType){
		return self::getField('work_type',$workType);
	}
	public static function getAllWorkType(){
		return self::getAllRows();
	}
}

?>