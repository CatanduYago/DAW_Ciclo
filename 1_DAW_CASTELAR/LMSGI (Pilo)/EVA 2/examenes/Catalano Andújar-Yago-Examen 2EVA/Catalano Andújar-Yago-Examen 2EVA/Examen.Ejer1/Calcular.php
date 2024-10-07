<?php

require_once("LibExaEjer1/connFinanciera.php");

$salarioBruto = $_POST['salariob'];
$desgravacion = $_POST['desgravacion'];

$sneto = $salarioBruto * (1 - $desgravacion);

$sql = "INSERT INTO empleado (sneto) VALUES ('$sneto')";

$r = mysqli_query($conn, $sql);

if ($r){
    header("Location: index.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}



