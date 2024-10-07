<?php
require_once("librerias/conexion.php");

$campo = $_REQUEST['campo'];
$nss = $_REQUEST['nss'];
$cambio = $_REQUEST['cambio'];


$strSQL = "UPDATE `empleadosdb` SET `" . $campo . "`='" . $cambio . "' WHERE `NºSS`='" . $nss . "'";

$r=mysqli_query($conn,$strSQL);

if ($r){
    header("Location: actualizacion.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}
