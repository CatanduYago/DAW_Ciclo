<?php
require_once("librerias/conexion.php");

$nss = $_REQUEST["nss"];
$nom = $_REQUEST["nom"];
$ape = $_REQUEST["ape"];
$salar = $_REQUEST["salar"];
$dire = $_REQUEST["dire"];
$turno = $_REQUEST["turno"];
$tipo = $_REQUEST["tipo"];
$puesto = $_REQUEST["puesto"];
$descripcion = $_REQUEST["descripcion"];


$strSQL="INSERT INTO empleadosdb(NºSS,nom,ape,salar,turno,tipo,puesto,descripcion,dire)";

$strSQL.="VALUES('".$nss."','".$nom."','".$ape."','".$salar."','".$turno."','".$tipo."','".$puesto."','".$descripcion."','".$dire."')";

$r=mysqli_query($conn,$strSQL);

if ($r){
    header("Location: index.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}
