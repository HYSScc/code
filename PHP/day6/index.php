<?php

include "./vendor/autoload.php";

use Acme\Action\userController;

$method= $_GET['action'].'Action';

$name = $_GET['controller'].'Controller';

if($name == 'userController'){

	$class = new userController();
}

$class -> $method();

?>