<?php
/* A class to handle the mysqli connection to the database */

class MysqliConnection{
		
	private static $mysqliConnection = false;

	/* Used DatabaseStructure */
	const host = "localhost";
	const user = "root";
	const password = "manuadi";
	const database = "get_the_job";
	
	
	public static function getConnection(){
		if (self::$mysqliConnection) {
			return self::$mysqliConnection;
		}	
		else {
			self::$mysqliConnection = new mysqli(self::host, self::user, self::password, self::database);
			if (!self::$mysqliConnection) {
				die ("Could not connect to the database");
			} 
			else {
				return self::$mysqliConnection;
			}
		}
	}
	
	/* the connection will close at the end of the script */
}

?>