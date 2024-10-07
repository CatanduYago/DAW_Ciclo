<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $numero = $_POST["numero"];
    $resultado = $numero * 2;

    echo "El resultado de multiplicar $numero por dos es: $resultado";
}
?>