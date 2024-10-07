<?php
$numero = 51;
function esPrimo($numero){

    if($numero <= 1){
        return false;
    }

    if($numero == 2){
        return true;
    }

    if($numero % 2 == 0){
        return false;
    }

    $limite = sqrt($numero);
    for ($i = 3; $i <=$limite; $i+=2){
        if($numero % $i == 0){
            return false;
        }
    }
    
    return true;
}

if(esPrimo($numero)){

    echo "El número: ".$numero. " es primo.";

}else{

    echo "El número: ".$numero. " no es primo.";

}
?>