<?php
/* Class to handle the region table */

require_once __DIR__.'/../general/table.php';

class Region extends Table{
	
	/* Table structure */
		
	/**
	 * Overrides Table::tableName()
	 */	
	protected static function tableName(){
		return "region";
	}
	
	/**
	 * Overrides Table::tableFields()
	 */	
	protected static function tableFields(){
		return array('region_id', 'region_name', 'country_id');
	}


	/* Methods */

	public static function getRegion($regionId){
		return self::keySearch($regionId,'region_id');
	}

	public static function getAllRegions(){
		return self::getAllRows();
	}
	
	public static function getRegionId($region){
		return self::getField('region_id', $region);
	}	
	
	public static function getRegionName($region){
		return self::getField('region_name', $region);
	}	
	
}

?>