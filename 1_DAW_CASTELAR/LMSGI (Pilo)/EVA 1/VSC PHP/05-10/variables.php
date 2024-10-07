<?php
#variables contenidas. El valor asignado a la variable se convierta en una variable
$edad="viejo";
"<br>";
$$edad=56;
echo "mi ".$edad." es de ".$viejo." años"."<br>";

#EJEMPLO DE VARIABLES VINCULADAS
#cuando le asigno a una variable otra. Cuando cambia la primera tmabien lo hace la segunda.
$a=12;
$b=&$a;
 

"<br>"; echo "a=".$a." b=".$b."<br>";
#como no estan vinculadas, si cambio el valor de $a no cambia el valor de $b.
$a=100;
echo "a=".$a." b=".$b."<br>";

#EJEMPLO DE VARIABLES GLOBALES
# Una variable local solo es accesible en el ambito ("trozo") de programa en que se ha declarado. La global es accesible en todo el prgrama ("En principio")
#ejemplo1.=> ;e declaro una variable den la funcion. Es intento modificarla desde fuera de la funcion. NO PODRE POR SER LCAL
function f(){
    $edad=56;
    return $edad;
}
$edad=22;
echo "mi edad es de ".f()." años"."<br>";
#Ejemplo2. DEclaro $edad como variable global, y se la paso como parametro, a la funcion. podré acceder a ella.
function d($edad)
    {
        return $edad;
    }

$edad=56;
echo "mi edad es de ".d(22). " años"."<br>";
$edad=22;
echo "mi edad es de ".f()." años"."<br>";
function f3(){
    $edad=27;
    return $edad;
}
$edad=56;
echo "Tengo ".f3(). " años"."<br>";

?>