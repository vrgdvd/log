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
      <title>Személyes adatok</title>
    </head>
  <body>
<th>





    <?php 

      if (isset($_SESSION['felhaszmail'])) {
        
        ?>

        <header>
              <?php 
              include "fejlec.php"; 
              ?>
        </header>


        <table width="100%">	
	<tr>
		<td width="50%"> 



        <form action="useradatfeldolgoz.php" method="post">
			<h2>Személyes adatok megadása vagy a meglévők módosítása:</h2>
			
             *Irányítószám: <br>
			<input type="text" name="irszam"><br>
            *Helység: <br>
			<input type="text" name="varos"><br>
            *Utca, házszám, emelet, ajtó: <br>
			<input type="text" name="uhea"><br>
            *Születési név: <br>
			<input type="text" name="szulnev"><br>
            Telefon: <br>
			<input type="text" name="tel"><br>
            Megjegyzés a futárnak: <br>
			<input type="text" name="megjegyzes"><br>
			
			<br>
			<a href='reg.php'>
            
			<input type="submit" name="elkuld" value="Véglegesítem">
			</a>
            <p>A *-al jelölt mezők kitöltése kötelező!</p>

        <h2 ><a href=log_reg.php> <<- Vissza a bejelentkezéshez </a> </h2>




      </td>
      <td>



    <?php 




//////////////////////////////////////////////////////////////////////////////////////

                          //Adatok Táblázata.
                          $email = $_SESSION['felhaszmail'];

                          $sq ="SELECT * FROM userdata WHERE mail='$email';";
                          $leker = $db_connect->query($sq);
                          $eredm = mysqli_query($db_connect, $sq);

                          if (mysqli_num_rows($eredm) > 0){

                         
                          ?> 
                                  <table style="background-color:#E3E7E9;width:100%;border=collapse">
                            
                                      <?php
                                          while($row = mysqli_fetch_assoc($eredm)) { // addig megy amíg van sor, rekord
                                          
                                          ?>



                                              <tr style="background-color:white;"><br><?php echo 'Adataid:'; ?> </tr>
                                              <br>
                                              <tr style="background-color:white;"><br><?php echo($row["irszam"]); ?> </tr>
                                              <br>
                                              <tr style="background-color:white;"><br><?php echo($row["varos"]); ?></tr>
                                              <br>
                                              <tr style="background-color:white;"><br><?php echo($row["uhea"]); ?></tr>
                                              <br>
                                              <tr style="background-color:white;"><br><?php echo($row["szulnev"]); ?></tr>
                                              <br>
                                              <tr style="background-color:white;"><br><?php echo($row["tel"]); ?></tr>
                                          




                                          <?php
                                          }
                            }else{
                                 echo 'Nincs rögzítve szállíási adat! Kérlek töltsd ki a mezőket!';
                            }



/////////////////////////////////////////////////////////////////////////////////////




      }else{
        header('Location: log_reg.php');
		    echo '<script>alert("Kijelentkeztél!")</script>';
        exit();
      }

    ?>
    </td>
    </th>
    </table>
  </body>
</html>