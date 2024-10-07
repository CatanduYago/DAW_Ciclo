<?php
    $estadoCivil = $_REQUEST["estadoCivil"];
    $aficiones = $_REQUEST ["Aficiones"];
    echo "Mi situacion es: " . $estadoCivil;
    foreach ($aficiones as $aficiones) 
        echo $aficiones."<br>";
    
?>