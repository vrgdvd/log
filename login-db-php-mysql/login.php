<?php

	require_once("adatbazis.php");
	session_start();
	$email = $_POST["email"];
	$jelszo = $_POST["jelszo"];


	$sql = "SELECT * FROM user WHERE mail ='$email' AND jelszo='$jelszo'";
	$lekerdez = $db_connect->query($sql);
	$eredmeny = mysqli_num_rows($lekerdez);


	if($email && $jelszo !="")
	{

				if($eredmeny==0){

					include "logreg.php";
					echo '<script>alert("Hibás felhasználónév vagy jelszó!")</script>';
					
				}else{
					
					if($eredmeny=true){

						$log = "SELECT * FROM user WHERE mail='$email' AND jelszo='$jelszo' AND usad=1";
						$lekerdez = $db_connect->query($log);
						$eredmeny = mysqli_num_rows($lekerdez);

						if($eredmeny!=0){
							$_SESSION['felhaszmail'] = $email;
							//include "fejlec.php";
							header('Location: admin.php');

						}else{
							$_SESSION['felhaszmail'] = $email;
							//include "fejlec.php";
							header('Location: users.php');
						}	
					}else{
						//$_SESSION['felhaszmail'] = $email;
						header('Location: users.php');
					}
				}
				
	}else{
		include "log_reg.php";
		echo '<script>alert("Egyik mező sem lehet üres!")</script>';
	}

?>