<?php

$altura = 4;
$ancho = 2.5;
$largo = 3;

# Calculamos los metros cuadrados de cada pared para saber cuantos litros necesitamos.
$pared1 = 2*($largo*$ancho);
$pared2 = 2*($altura*$ancho);
$total = $pared1 + $pared2;

# 10 metros cuadrados por litro es el rendimineto de la pitura.

$pinturanecesaria = $total / 10;

# Cogemos el resultado y redondeamos a la alza para que no falte pintura.

$pinturanecesaria = round($pinturanecesaria);

echo "Para un total de $total metros cuadrados, son necesarios $pinturanecesaria litros."."<br>"."<br>";

$costosin = 30 * $pinturanecesaria;
$costocon = $costosin - ($costosin* 0.02);
echo "Siguiendo el precio por litro, las medidas de la habitacion y la cantidad a usar:"."<br>"."<br>";
echo  "El precio total asciende a ".$costosin."€."."<br>";
echo  "El precio total con descuento aplicado asciende a ".$costocon."€."."<br>";

?>