<?php 

# UNa funcin que reciba dos valores, los sume, los devuelva y se vuelva a multiplicar por dos

function suma ($valor1, $valor2){
   $suma = $valor1 + $valor2;

   return $suma;  
   
    
}
$valor1=2;
$valor2=3;
echo "El resultado es ".suma($valor1,$valor2)*2;

?>