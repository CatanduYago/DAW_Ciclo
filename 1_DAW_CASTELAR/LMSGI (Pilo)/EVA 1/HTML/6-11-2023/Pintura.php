<?php

$alto_pared = 4;
$largo_pared = 10;
$ancho_pared = 1;

$pared = $alto_pared + $largo_pared;

$litros_x_pintura = $pared * 0.1;

$total = 42 * $litros_x_pintura;
echo  "El pintor deberá gastar  ".$total."€.";

?>