<?php

session_start();

if (session_destroy() )
{
    header('Location: log_reg.php');
}

else{
    echo 'Nem sikerült a kijelentkezés';
}

?>
