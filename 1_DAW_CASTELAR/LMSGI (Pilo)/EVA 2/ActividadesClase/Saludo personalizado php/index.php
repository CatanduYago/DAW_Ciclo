<?php
/*Realizar un programa en php en un formulario de saludo personalizado.
si la hora es entre las 8 y la 1 el saludo es buenos días 
si la hora es entre 13 y las 15 el saludo es que aproveche la comida 
si la hora es entre las 15 y las 17 el saludo es hora del café*/

$hora = time(); 
$nombre = $_POST["nom"];

if (date("H:i:s")<="13:00:00"){
    echo "Buenos dias, ".$nombre;
}else if(date("H:i:s")<="15:00:00"){
    echo ("Que aproveche la comida, ".$nombre);
}else if(date("H:i:s")<="17:00:00") {
    echo "Es Hora del café, ".$nombre;
}else{
    echo "Buenas noches, ".$nombre;
}



?>