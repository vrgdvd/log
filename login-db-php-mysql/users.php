<?php session_start()?>

<!DOCTYPE html>
<html lang="hu">
    <head>
      <title>User</title>
    </head>
  <body>

    <?php

      if (isset($_SESSION['felhaszmail'])) {
        
    ?>

        <header>
          <?php 
          include "fejlec.php"; 
          ?>
        </header>
        
        <!-- *********************** EZ A TARTALOM HELYE *********************** -->


        <h1>Üdv a webshopunkban!</h1>


        <!-- *********************** EDDIG TART A TARTALOM *********************** -->

    <?php 

      }else{
        //echo 'Kijelentkeztél!';
        include "log_reg.php";
		    echo '<script>alert("Kijelentkeztél!")</script>';
      }

    ?>
    

  </body>
</html>