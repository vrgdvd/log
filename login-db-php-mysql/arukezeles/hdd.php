<?php
require_once("../adatbazis.php");
session_start();
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Árukezelés</title>
</head>


<?php
if (isset($_SESSION['felhaszmail'])) { //Amennyiben a seisson tartalma nem üres

        $sql = "SELECT * FROM hdd";
        $lekerdez = $db_connect->query($sql);
        $eredmeny = mysqli_query($db_connect, $sql);
    ?>
       
        <header>

            <?php include("../fejlec.php"); ?>
            
        </header>

        <div>
            <tr>
                <th> <button> <a href=alaplap.php> Alaplap</a> </button> </th>
                <th> <button> <a href=hdd.php> HDD</a> </button> </th>
                <th> <button> <a href=processor.php> Processzorok</a> </button> </th>
                <th> <button> <a href=nvme.php> NVMe</a> </button> </th>
                <th> <button> <a href=ram.php> RAM</a> </button> </th>
                <th> <button> <a href=ssd.php> SSD</a> </button> </th>
                <th> <button> <a href=laptop.php> Laptop</a> </button> </th>
                <th> <button> <a href=vga.php> VGA</a> </button> </th>
                <th> <button> <a href=tapegyseg.php> Tápegység</a> </button> </th>
                <th> <button> <a href=../admin.php> Admin menü</a> </button> </th>
            </tr>
        </div>
        
        <div>

        <h2>HDD árukészlet kezelése</h2>

        <form action="hdd.php" method="post">    

        <input type="text" name="ID" placeholder="ID">
        <input type="text" name="name" placeholder="Név">
        <input type="text" name="capacitygb" placeholder="Méret GB">
        <input type="text" name="rpm" placeholder="Fordulatszám">
        <input type="text" name="type" placeholder="Tipus, pl: 3.5=3; 2.5=2">
        <input type="text" name="descrip" placeholder="Leírás">
        <input type="text" name="piece" placeholder="Darabszám">
        <input type="text" name="pricehuf" placeholder="Ár">
        <input type="text" name="barcode" placeholder="Vonalkód">
        <input type="text" name="picture" placeholder="Kép elérési útvonala">

        <br><br>
    
        <input type="submit" name="gomb3" value="Beolvasás">
        <input type="submit" name="gomb1" value="Feltöltés">
        <input type="submit" name="gomb2" value="Eltávolítás">
        <br><br>
                
        </div>

        <?php
        
        //FELTÖLTÉS1
    if (isset($_POST['gomb1'])) { 
        $name = $_POST["name"];
        $capacitygb = $_POST["capacitygb"];
        $rpm = $_POST["rpm"];
        $type = $_POST["type"];
        $descrip = $_POST["descrip"];
        $piece = $_POST["piece"];
        $pricehuf = $_POST["pricehuf"];
        $barcode = $_POST["barcode"];
        $picture = $_POST["picture"];
         
        //echo $descrip;
        if($name && $capacitygb && $rpm && $type && $descrip && $piece && $pricehuf && $barcode && $picture != ""){
            $sq = "INSERT INTO hdd (name,capacitygb,rpm,type,descrip,piece,pricehuf,barcode,picture) VALUES ('$name','$capacitygb','$rpm','$type','$descrip','$piece','$pricehuf','$barcode','$picture')";
            $leker = $db_connect->query($sq);
            //header('Location: hdd.php');
            echo 'Megjelenítéshez kérjen újbóli Készletbeolvasást.';
        }else{
            echo "Feltöltéshez minden mező kitöltése kötelező!";
        }

    }

    //ELTÁVOLÍTÁS2
    if (isset($_POST['gomb2'])) { 
        $id = $_POST["ID"];

        if ($id !="") {
        $sq = "DELETE FROM hdd WHERE ID = '$id' ";
        $kuld = $db_connect->query($sq);
        echo 'Megjelenítéshez kérjen újbóli Készletbeolvasást.';
        //header('Location: hdd.php');
        

        }else{
            echo "Eltávolításhoz adja meg az áru ID-jét!";
        }
    }


    //KERESÉS
    if (isset($_POST['gomb3'])) { 
        $name = $_POST["name"];
    /*
        $capacitygb = $_POST["capacitygb"];
        $rpm = $_POST["rpm"];
        $type = $_POST["type"];
        $descrip = $_POST["descrip"];
        $piece = $_POST["piece"];
        $pricehuf = $_POST["pricehuf"];
    */
            
            //$sq ="SELECT * FROM hdd WHERE (name,capacitygb ) LIKE ('%".$name."%' , '%".$capacitygb."%' )";
            $sq ="SELECT * FROM hdd WHERE (name) LIKE ('%".$name."%')";
            $leker = $db_connect->query($sq);
            $eredm = mysqli_query($db_connect, $sq);

            if (mysqli_num_rows($eredm) > 0){
                echo "Szűkítéshez írja be a termék nevét.";

                ?> 
                <table style="background-color:#E3E7E9;width:100%;border=collapse">
            
                    <tr>
                        <th>ID:</th>
                        <th>Név:</th>
                        <th>Méret (GB):</th>
                        <th>Fordulatszám:</th>
                        <th>Típus:</th>
                        <th>Leírás:</th>
                        <th>Darabszám:</th>
                        <th>Ár (Ft):</th>
                        <th>Vonalkód:</th>
                        <th>Feltöltve:</th>
                    </tr>
            
                    <?php
                    //if (mysqli_num_rows($eredm) > 0) { // megvizsgáljuk, hogy a lekérdezésnek van-e eredménye
                        // amíg van sor, addig kiíratjuk
                        while($row = mysqli_fetch_assoc($eredm)) { // addig megy amíg van sor, rekord
            
                        ?>
            
                        <tr>
                            <th style="background-color:white"><br><?php echo($row["ID"]); ?> </th>
                            <th style="background-color:white"><br><?php echo($row["name"]); ?></th>
                            <th style="background-color:white"><br><?php echo($row["capacitygb"]); ?></th>
                            <th style="background-color:white"><br><?php echo($row["rpm"]); ?></th>
                            <th style="background-color:white"><br><?php echo($row["type"]); ?></th>
                            <th style="background-color:white; max-height:2rem; max-width:80rem;"><br><?php echo($row["descrip"]); ?></th>
                            <th style="background-color:white"><br><?php echo($row["piece"]); ?></th>
                            <th style="background-color:white"><br><?php echo($row["pricehuf"]); ?></th>
                            <th style="background-color:white"><br><?php echo($row["barcode"]); ?></th>
                            <th style="background-color:white"><br><?php echo($row["added"]); ?></th>
                        </tr>
        
                        <?php
                        }
            /*
                    }else{ //Amennyiben nincs a lekérdezésnek eredménye
                    echo "HIBA! A lekérdezésnek nincs eredménye.";
                    }
            */
                

            }else{
                echo "Nincs eredmény, kérjen új beolvasást!";
            }	

    }

/*EGYIK
    ?> 

    <table style="background-color:#E3E7E9;width:100%;border=collapse">

        <tr>
            <th>ID:</th>
            <th>Név:</th>
            <th>Méret (GB):</th>
            <th>Fordulatszám:</th>
            <th>Típus:</th>
            <th>Leírás:</th>
            <th>Darabszám:</th>
            <th>Ár (Ft):</th>
            <th>Feltöltve:</th>
        </tr>

        <?php
        if (mysqli_num_rows($eredmeny) > 0) { // megvizsgáljuk, hogy a lekérdezésnek van-e eredménye
            // amíg van sor, addig kiíratjuk
            while($row = mysqli_fetch_assoc($eredmeny)) { // addig megy amíg van sor, rekord

            ?>

            <tr>
                <th style="background-color:white"><br><?php echo($row["ID"]); ?> </th>
                <th style="background-color:white"><br><?php echo($row["name"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["capacitygb"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["rpm"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["type"]); ?></th>
                <th style="background-color:white; max-height:2rem; max-width:80rem;"><br><?php echo($row["descrip"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["piece"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["pricehuf"]); ?></th>
                <th style="background-color:white"><br><?php echo($row["added"]); ?></th>
            </tr>

            <?php
            }

        }else{ //Amennyiben nincs a lekérdezésnek eredménye
        echo "HIBA! A lekérdezésnek nincs eredménye.";
        }
MASIK*/      
             

}else{  //Amenyniben a session tartalma üres
    
    //include "../index.php";
    //echo '<script>alert("Kijelentkeztél!")</script>';
    header('Location: ../log_reg.php');
    //return view( "jegyzet" );
    //return view( "service", compact( "name", "email" ));
    //@include( "templates.header" )  fejléc inkludolása a tamplates mappából

    //header('Location: ../index.php');
    //exit
  }
?>


</table>
</body>
</html>