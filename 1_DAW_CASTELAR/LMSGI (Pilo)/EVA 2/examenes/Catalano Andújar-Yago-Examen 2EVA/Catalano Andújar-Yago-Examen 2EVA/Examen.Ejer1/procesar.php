<?php
require_once("LibExaEjer1/connFinanciera.php");

$nombre = $_REQUEST['nom'];
$apellido = $_REQUEST['ape'];
$categoria = $_REQUEST['categoria'];
$nss = $_REQUEST['nss'];
$salarioBruto = $_REQUEST['salariob'];
$desgravacion = $_REQUEST['desgravacion'];
$concepto = $_REQUEST['concepto'];

$porcentajeDesgravacion = 0;
switch ($concepto) {
    case 'medicos':
        $porcentajeDesgravacion = 0.02;
        break;
    case 'ucrania':
        $porcentajeDesgravacion = 0.05;
        break;
    case 'save':
        $porcentajeDesgravacion = 0.01;
        break;
    case 'acnur':
        $porcentajeDesgravacion = 0.01;
        break;
}

$salarion = $salarioBruto - ($salarioBruto * $porcentajeDesgravacion);

$sql = "INSERT INTO empleado (nombre, apellidos, categoria, nss, salariob, desgravacion, concepto, sneto) 
VALUES ('$nombre', '$apellido', '$categoria', '$nss', '$salarioBruto', '$desgravacion', '$concepto', '$salarioNeto')";

$r = mysqli_query($conn, $sql);

if ($r){
    header("Location: panForm.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}
