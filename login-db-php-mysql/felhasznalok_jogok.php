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
    <title>Jogosultságok</title>
</head>


<?php 

if (isset($_SESSION['felhaszmail'])) {
?>

    <header>
    <?php include "fejlec.php"; ?>
    </header>

<?php
    $sql = "SELECT * FROM user";
    $lekerdez = $db_connect->query($sql);
    $eredmeny = mysqli_query($db_connect, $sql);
    //mysqli_close($db_connect);
?>


<div>

    <h2>Jogosultság</h2>
    <form action="felhasznalok_jogok.php" method="post">
       
    A felhasználó ID-ja: <br>
        
    <input type="text" name="ID"><br><br>
    <input type="submit" name="gomb1" value="Jogadás">
    <input type="submit" name="gomb2" value="Jogvétel">
    <input type="submit" name="gomb3" value="Felhasználó törlése">
    <th> <button> <a href=admin.php> Admin menü</a> </button> </th> <br><br>
             
</div>


<!--                               JOGADÁS/JOGVÉTEL/TÖRLÉS : A MEGFELELŐ GOMB MEGNYOMÁSÁTÓL FÜGGŐEN DŐL EL                              -->


<?php   

    // Ha az űrlapot a "gomb1"-el küldték:
    if (isset($_POST['gomb1'])) { 

        $id = $_POST["ID"];
            
        $sq = "SELECT * FROM user WHERE ID='$id'";
        $leke = $db_connect->query($sq);
        $eredm = mysqli_num_rows($leke);
 
            if($eredm == 0){
                echo 'Nincs ilyen ID-jű felhasználó!';
            }else{
                $sq = "UPDATE user SET usad = 1 WHERE ID = '$id' ";
                $leke = $db_connect->query($sq);
                 header('Location: felhasznalok_jogok.php');
            }  
    } 

    // Ha az űrlapot a "gomb2"-vel küldték:
    if (isset($_POST['gomb2'])) { 
        
        $id = $_POST["ID"];
            
        $sq = "SELECT * FROM user WHERE ID='$id'";
        $leke = $db_connect->query($sq);
        $eredm = mysqli_num_rows($leke);
 
            if($eredm == 0){
                echo 'Nincs ilyen ID-jű felhasználó!';
            }else{
                $sq = "UPDATE user SET usad = 0 WHERE ID = '$id' ";
                $leke = $db_connect->query($sq);
                header('Location: felhasznalok_jogok.php');
            }
    } 		
    
    // Ha az űrlapot a "gomb3"-al küldték:
    if (isset($_POST['gomb3'])) { 
        
        $id = $_POST["ID"];
            
        $sq = "SELECT * FROM user WHERE ID='$id'";
        $leke = $db_connect->query($sq);
        $eredm = mysqli_num_rows($leke);
 
            if($eredm == 0){
                echo 'Nincs ilyen ID-jű felhasználó!';
            }else{
                $sq = "DELETE FROM user WHERE ID = '$id' ";
                $leke = $db_connect->query($sq);
                header('Location: felhasznalok_jogok.php');
            }
    } 
    

  ?> 


<!--                                       ADATOK KIOLVASÁSA ÉS TÁBLÁZATBA RENDEZÉSE                                 -->


<table style="background-color:#E3E7E9;width:100%;border=collapse">

                <tr>
                  <th>Id:</th>
                  <th>Név:</th>
                  <th>Email:</th>
                  <th>Regisztráció dátuma:</th>
                  <th>Jogosultsági szint:</th>
                  <th>Gyűjtött pontok:</th>
                  <th>Utolsó játék:</th>
                </tr>

<?php
    if (mysqli_num_rows($eredmeny) > 0) { // megvizsgáljuk, hogy a lekérdezésnek van-e eredménye
        
        while($row = mysqli_fetch_assoc($eredmeny)) { // amíg van sor, addig kiíratjuk
                
?>

                <tr>
                <th style="background-color:white"><br><?php echo($row["ID"]); ?> </th>
                <th style="background-color:white"><br><?php echo($row["name"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["mail"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["mikor"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["usad"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["game_points"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["last_game"]); ?></th>
                </tr>

            <?php
        }
    
    }else{
        echo "A lekérdezésnek nincs eredménye.";
    }

}else{
    include "log_reg.php";
    echo '<script>alert("Kijelentkeztél!")</script>';
  }

?>

</html>