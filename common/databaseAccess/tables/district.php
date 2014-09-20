<?php
/* Class to handle the district table */

require_once __DIR__.'/../general/table.php';

class District extends Table{
	
	/* Table structure */
		
	/**
	 * Overrides Table::tableName()
	 */	
	protected static function tableName(){
		return "district";
	}
	
	/**
	 * Overrides Table::tableFields()
	 */	
	protected static function tableFields(){
		return array('district_id', 'district_name', 'region_id');
	}


	/* Methods */

	public static function getDistrict($districtId){
		return self::keySearch($districtId,'district_id');
	}
	
	public static function getDistrictId($district){
		return self::getField('district_id',$district);
	}
	
	public static function getDistrictName($district){
		return self::getField('district_name',$district);
	}
	
	public static function getRegionId($district){
		return self::getField('region_id',$district);
	}

	public static function getDistrictList($regionId){
		return self::fieldSearch($regionId,'region_id');
	}
	public static function getAllDistrict($regionId){
		return self::fieldSearch($regionId,'region_id');
	}
	
}

?>