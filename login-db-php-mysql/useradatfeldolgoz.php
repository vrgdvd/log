<?php 
require_once("adatbazis.php");
session_start();
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilom</title>
</head>

<?php

$irszam = $_POST["irszam"];
$varos = $_POST["varos"];
$uhea = $_POST["uhea"];
$szulnev = $_POST["szulnev"];
$tel = $_POST["tel"];
$megjegyzes = $_POST["megjegyzes"];

$email = $_SESSION['felhaszmail'];

	if($irszam && $varos && $uhea && $szulnev != "")
	{	

        $sql = "SELECT * FROM userdata WHERE mail='$email'";
        $select = $db_connect->query($sql);
		$mennyi = mysqli_num_rows($select);

        if($mennyi > 0){
            
            $sql = "UPDATE userdata SET irszam='$irszam', varos='$varos', uhea='$uhea', szulnev='$szulnev', mail='$email', tel='$tel', megjegyzes='$megjegyzes' WHERE mail='$email';";
            $insert = $db_connect->query($sql);
            echo '<script>alert("Frissítés megtörtént!")</script>';
            //include Kosárhoz
            
        }else{
            $sql = "INSERT INTO userdata (irszam, varos, uhea, szulnev, mail, tel, megjegyzes) VALUES ('$irszam', '$varos', '$uhea', '$szulnev', '$email', '$tel', '$megjegyzes')";
            $insert = $db_connect->query($sql);
            echo '<script>alert("Mostmár vásárolhatsz ' .$email. '!")</script>';
            //include Kosárhoz	
        }


        

        

	}else{
		include "useradatok.php";
		echo '<script>alert("A *-al jelölt mezők kitöltése kötelező!")</script>';	
	}

?>