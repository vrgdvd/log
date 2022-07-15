<?php 

require_once("adatbazis.php");

$nev = $_POST["nev"];
$jelszo = $_POST["jelszo1"];
$jelszo2 = $_POST["jelszo2"];
$email = $_POST["email"];

	if($nev && $jelszo && $jelszo2 && $email != "")
	{	

		if($jelszo !== $jelszo2){
			include "log_reg.php";
			echo '<script>alert("Nem azonos a két jelszó")</script>';
		
		}else{	
			$sql = "SELECT * FROM user WHERE mail='$email'";
			$select = $db_connect->query($sql);
			$mennyi = mysqli_num_rows($select);
			//echo $mennyi;

			if($mennyi > 0){
				include "log_reg.php";
				echo '<script>alert("Ehhez az e-mail címhez már tartozik felhasználói fiók!")</script>';
				
			}else{
				$sql = "INSERT INTO `user`( `name`, `jelszo`, `mail`) VALUES ('$nev','$jelszo','$email')";
				$insert = $db_connect->query($sql);
				include "log_reg.php";
				echo '<script>alert("Sikeres regisztráció, jelentkezz be az email címeddel ' .$nev. '!")</script>';	
			}
		}
	}else{
		include "log_reg.php";
		echo '<script>alert("Minden mező kitöltése kötelező!")</script>';	
	}

?>