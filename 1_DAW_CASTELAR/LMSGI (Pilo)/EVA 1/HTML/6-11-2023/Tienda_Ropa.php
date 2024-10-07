<?php

$jeans=6;
$chaquetas_rojas=8;
$chaquetas_azul=4;
$jersey=6;
$medias=9;

$preciojeans=240;
$preciochaqueta1=70;
$preciochaqueta2=90;
$preciojersey=160;
$preciomedias=40;

$totaldia= ($jeans*$preciojeans) + ($chaquetas_azul*$preciochaqueta1) + ($chaquetas_rojas*$preciochaqueta2) + ($jersey*$preciojersey) + ($medias*$preciomedias);
echo "El total ganado en el día es: ".$totaldia. "€"."<br>";
$promedio = $totaldia/ ($jeans+$chaquetas_azul+$chaquetas_rojas+$jersey+$medias);
echo "El promedio por prenda es de: ".round($promedio)."€";


?>