<!DOCTYPE html>
<html lang="hu">
    <head>
      <title>Admin menü</title>
    </head>
  <body>

    <?php 
    
      session_start();

      if (isset($_SESSION['felhaszmail'])) {
        
        ?>

        <header>
              <?php 
              include "fejlec.php"; 
              ?>
        </header>
        
        <nav>
            <ul>
                <li><a href="arukezeles/alaplap.php">Árukészlet kezelés</a></li>
                <br>
                <li><a href="felhasznalok_jogok.php">Felhasználók és jogosultságok</a></li>
                <br>
                <li><a href="users.php">Folytatás mint felhasználó</a></li>
            </ul>
        </nav>

    <?php 

      }else{
        //header('Location: log_reg.php');
        
		    echo '<script>alert("Kijelentkeztél!")</script>';
        include "log_reg.php";
        exit();
      }

    ?>

  </body>
</html>