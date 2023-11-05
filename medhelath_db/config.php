<?php

$host = "localhost";
$username = "root";
$password = "";
$db_name = "medhealth";
$port ="3306";

$connection = mysqli_connect($host,$username,$password,$db_name, $port);

if(!$connection){

echo "Connection Failed";

}

