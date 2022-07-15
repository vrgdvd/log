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

        $sql = "SELECT * FROM motherboard";
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

        <h2>Alaplap - árukészlet kezelése</h2>

        <form action="alaplap.php" method="post">    

        <input type="text" name="ID" placeholder="ID">
        <input type="text" name="name" placeholder="Név">
        <input type="text" name="processor" placeholder="pl: 1151 , 4, 1200">
        <input type="text" name="ramtype" placeholder="Ramtípus">
        <input type="text" name="rammaxmhz" placeholder="Ram MAX MHz">
        <input type="text" name="rammaxgb" placeholder="Ram MAX GB">
        <input type="text" name="ramslots" placeholder="Ram slotok száma">
        <input type="text" name="nvme" placeholder="nVme 1=igen; 0=nem">
        <input type="text" name="powersupplypin" placeholder="Tápcsatlakozás">
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
        $processor = $_POST["processor"];
        $ramtype = $_POST["ramtype"];
        $rammaxmhz = $_POST["rammaxmhz"];
        $rammaxgb = $_POST["rammaxgb"];
        $ramslots = $_POST["ramslots"];
        $nvme = $_POST["nvme"];
        $powersupplypin = $_POST["powersupplypin"];
        $descrip = $_POST["descrip"];
        $piece = $_POST["piece"];
        $pricehuf = $_POST["pricehuf"];
        $barcode = $_POST["barcode"];
        $picture = $_POST["picture"];


        if($name && $processor && $ramtype && $rammaxmhz && $rammaxgb && $ramslots && $nvme && $powersupplypin && $descrip && $piece && $pricehuf && $barcode && $picture != ""){
            $sq = "INSERT INTO motherboard (name,processor,ramtype,rammaxmhz,rammaxgb,ramslots,nvme,powersupplypin,descrip,piece,pricehuf,barcode,picture) VALUES ('$name','$processor','$ramtype','$rammaxmhz','$rammaxgb','$ramslots','$nvme','$powersupplypin','$descrip','$piece','$pricehuf','$barcode','$picture')";
            $leker = $db_connect->query($sq);
            echo 'Megjelenítéshez kérjen újbóli Készletbeolvasást.';
        }else{
            echo "Feltöltéshez minden mező kitöltése kötelező!";
        }

    }

    //ELTÁVOLÍTÁS2
    if (isset($_POST['gomb2'])) { 
        $id = $_POST["ID"];

        if ($id !="") {
        $sq = "DELETE FROM motherboard WHERE ID = '$id' ";
        $kuld = $db_connect->query($sq);
        echo 'Megjelenítéshez kérjen újbóli Készletbeolvasást.';
        
        }else{
            echo "Eltávolításhoz adja meg az áru ID-jét!";
        }
    }


    //KERESÉS
    if (isset($_POST['gomb3'])) { 
        $name = $_POST["name"];
        
            $sq ="SELECT * FROM motherboard WHERE (name) LIKE ('%".$name."%')";
            $leker = $db_connect->query($sq);
            $eredm = mysqli_query($db_connect, $sq);

            if (mysqli_num_rows($eredm) > 0){
                echo "Szűkítéshez írja be a termék nevét.";

                ?> 
                <table style="background-color:#E3E7E9;width:100%;border=collapse">
            
                <tr>
                <th>ID:</th>
                <th>Név:</th>
                <th>Foglalat:</th>
                <th>Ram típusa (DDR3,4):</th>
                <th>RamMaxMHz:</th>
                <th>RamMaxGB:</th>
                <th>RamSlots:</th>
                <th>NVME I/N:</th>
                <th>Tápcsatlakozás:</th>
                <th>Leírás:</th>
                <th>Darabszám:</th>
                <th>Ár (Ft):</th>
                <th>Vonalkód:</th>
                <th>Feltöltve:</th>
                </tr>
            
                    <?php
                        while($row = mysqli_fetch_assoc($eredm)) { // addig megy amíg van sor, rekord
            
                        ?>
            
                            <tr>
                                <th style="background-color:white"><br><?php echo($row["ID"]); ?> </th>
                                <th style="background-color:white"><br><?php echo($row["name"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["processor"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["ramtype"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["rammaxmhz"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["rammaxgb"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["ramslots"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["nvme"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["powersupplypin"]); ?></th>
                                <th style="background-color:white;  max-height:2rem; max-width:80rem;"><br><?php echo($row["descrip"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["piece"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["pricehuf"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["barcode"]); ?></th>
                                <th style="background-color:white"><br><?php echo($row["added"]); ?></th>
                            </tr>
        
                        <?php
                        }
                

            }else{
                echo "Nincs eredmény, kérjen új beolvasást!";
            }	

    }

}else{  //Amenyniben a session tartalma üres
    header('Location: ../log_reg.php');
    }
?>


</table>
</body>
</html>

