<?php

$host       = "localhost";
$mysqluser  = "root";
$pass       = "";
$db         = "webshopdatabase";

$db_connect = mysqli_connect($host,$mysqluser,$pass,$db);

if ( ! $db_connect)
    die("Nem lehet csatlakozni az adatbázis szerverhez!");

?>