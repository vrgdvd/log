<?php
  session_start();       
  if (isset($_SESSION['felhaszmail'])) {
      //include "fejlec.php";
      echo 'session-öd tartalma: '.$_SESSION['felhaszmail'];

  
  }else{
      echo 'session üres!';
  }  

?>