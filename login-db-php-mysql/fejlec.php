<!DOCTYPE html>
<html lang="hu">
    <head>
      <title>Admin</title>
    </head>
    <body>
        <header>
            <table style="width:100%;border: 2px solid #E3E7E9">
                <tr>
                    <th>
                        <?php
                            if (isset($_SESSION['felhaszmail'])) {
                                //include "fejlec.php";
                                echo 'Belépve mint: '.$_SESSION['felhaszmail'];

                                ?>
                                <button> <a href=useradatok.php>Profilom szerkesztése</button>
                                <?php

                            }else{
                                echo 'Jelentkezz be vagy regisztrálj!';
                            }  
                        ?>
                    </th>
                    <th> <button> <a href=sessiontorol.php>Kijelentkezés</button> </th>
                </tr>
            </table>
        </header>
    </body>   
</html>