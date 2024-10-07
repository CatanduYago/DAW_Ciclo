<?php
require_once("librerias/conexion.php");

$puesto = $_REQUEST['puesto'];
$nss = $_REQUEST['nss'];


$strSQL = "UPDATE `empleadosdb` SET `puesto` = $puesto WHERE `NºSS` = $nss;";

$r=mysqli_query($conn,$strSQL);

if ($r){
    header("Location: actualizacion.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}