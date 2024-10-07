<?php
// comentario
/*Esto tambien*/
/**
 * Este tambien
 */
$nombre = "Fernando";
$apellido1 = "Alonso";
echo $nombre. "<br>";
echo "Nombre: " .$nombre. "<br> 1er Apellido : " . $apellido1;
echo "<br>";


//$prueba = null;
$prueba = null;
#Podemos controlar si la varibale ha sido definida
# isset() devuelve true si una variable esta declarada y es diferente de null.
# empty() Devuelve true si una variable existe y esta vacia o es false.
# is_null() Devuleve true si una variable es null.
if (isset($prueba))
    echo 'La varable ha sido definida';
else
    echo 'La variable NO ha sido definida';
echo "<br>";
echo 'Resultado de isset: -'. (isset($prueba) ? 'Si': 'NO'). '-';
echo "<br>";
echo 'Resultado de empty: -'. (empty($prueba)? 1 : 0) . '-';
echo "<br>";
echo 'Resultado de is_null: -'. (is_null($prueba) ? 1:0) . '-';

