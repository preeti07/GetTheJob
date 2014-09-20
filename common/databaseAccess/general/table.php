<?php
/* A class to perform the database searches */
require_once __DIR__.'/mysqliConnection.php';

abstract class Table {

	/* Table structure */
		
	/* 
	 * MUST be overriden (cannot declare it abstract)
	 *  */
	protected static function tableName() {
		/* MUST be overriden (cannot declare it abstract) */
		die ("Function Table::tableName() is intended as an abstract method. Cannot declare it 'abstract' due to PHP syntax restrictions. Make sure you have overridden it in class '".get_called_class()."'!");
	}

	/* 
	 * Should return an array containing the table's fields, ordered
	 * e.g. return array ('district_id','DistrictName','work_type_id');
	 * MUST be overriden (cannot declare it abstract)
	 *  */
	protected static function tableFields() {
		/* MUST be overriden (cannot declare it abstract) */
		die ("Function Table::tableFields() is intended as an abstract method. Cannot declare it 'abstract' due to PHP syntax restrictions. Make sure you have overridden it in class '".get_called_class()."'!");
	}
	
	/* Methods */
	
	public static function selectRows($condition){
		if (!empty($condition)) {
			$queryCondition = " WHERE $condition";
		}
		else {
			$queryCondition = "";
		}	
		$query = "SELECT * FROM ".(static::tableName())."$queryCondition;";
		return MysqliConnection::getConnection()->query($query);
	}
	
	public static function getAllRows(){
		$query = "SELECT * FROM ".(static::tableName()).";";
		return MysqliConnection::getConnection()->query($query);
	}
	
	public static function getRowsNumber(){
		$allRows = self::getAllRows();
		return $allRows->num_rows;		
	}

	public static function queryConditionResultsNumber($firstRow, $lastRow){
		return "LIMIT $firstRow, $lastRow";
	}
	
	/**
	 * Returns only the first occurence found
	 */
	protected static function keySearch($key, $keyFieldName){
		$query = "SELECT * FROM ".(static::tableName())." WHERE $keyFieldName = $key";	
		return MysqliConnection::getConnection()->query($query)->fetch_row();
	}


	protected static function fieldSearch($fieldValue, $fieldName){
		$query = "SELECT * FROM ".(static::tableName())." WHERE $fieldName = $fieldValue";	
		return MysqliConnection::getConnection()->query($query);
	}
	

	protected static function getField($fieldName, $row){
		$index = array_search($fieldName, static::tableFields());
		return $row[$index];
	}
	
	protected static function fieldListString(){
		$retString = "";	
		foreach (static::tableFields() as $fieldName) {
			$retString.= "`".$fieldName."`, ";
		}
		return substr($retString,0,-strlen(", "));
	}

	public static function insertRowQuery($valuesString){
		return "INSERT INTO `".MysqliConnection::database."`.`".static::tableName()."` (".static::fieldListString().") VALUES (".$valuesString.");";
	}
	
}

?>