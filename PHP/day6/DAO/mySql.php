<?php

namespace Acme\DAO;

class mySql{

	function sqlAdd(){
		$sql = 'INSERT INTO users (name, gender, age, info) VALUES (?,?,?,?)';

		return $sql;
	}

	function sqlDel(){
		$sql = 'DELETE FROM users WHERE id= ?';

		return $sql;
	}

	function sqlModify(){
		$sql = 'UPDATE users SET name= ?, gender= ?, age = ?, info= ? WHERE id= ?';

		return $sql;
	}

	function sqlGetUserById(){
		$sql = 'SELECT * FROM users WHERE id= ?';

		return $sql;
	}

	function sqlList(){
		$sql = 'SELECT * FROM users';

		return $sql;
	}

	function sqlFindUserByName($username){

		$sql = "SELECT * FROM users WHERE name= '$username'";

		return $sql;
	}

	function sqlGetPage($username, $p, $pagesize){

		if ( $username == null ) {

			$sql = "SELECT * from users limit $p, $pagesize";
		}
		else{

			$sql = "SELECT * from users WHERE name = '$username' limit $p, $pagesize";
		}
		return $sql;

	}

}

?>