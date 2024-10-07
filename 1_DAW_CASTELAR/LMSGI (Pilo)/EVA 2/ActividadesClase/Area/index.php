<?php

$triangulo = $_REQUEST['1'];
$rectangulo = $_REQUEST['2'];
$X = $_REQUEST['3'];
$Y = $_REQUEST['4'];


if ($triangulo ==true) {
    $area=$X*$Y;
}else{
    $area=($X*$Y)/2 ."a";
}

echo "El área es: ".$area;

?>