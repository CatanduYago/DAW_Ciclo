<?php
require_once("librerias/conexion.php");

$tipo = $_REQUEST['tipo'];
$nss = $_REQUEST['nss'];


$strSQL = "UPDATE `empleadosdb` SET `tipo` = $tipo WHERE `NºSS` = $nss;";

$r=mysqli_query($conn,$strSQL);

if ($r){
    header("Location: actualizacion.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}