<?php
require_once("conexion.php");

$host= "127.0.0.1";
$usuario= "root";
$clave="";
$db="daw";

$conn= mysqli_connect($host,$usuario,$clave,$db) or die ("Error en la conexion.");

$nexpediente = $_REQUEST["nexpediente"];
$nombre = $_REQUEST["nombre"];
$notaLM = $_REQUEST["notaLM"];
$notaED = $_REQUEST["notaED"];
$notaBD = $_REQUEST["notaBD"];
$notaSI = $_REQUEST["notaSI"];
$notaPR = $_REQUEST["notaPR"];
$media =($notaLM+$notaED+$notaBD+$notaSI+$notaPR)/5;
$promocion = isset($_REQUEST['promocion']) ? true : false;

$strSQL="INSERT INTO alumno(id,nexpediente,nombre,notaLM,notaED,notaBD,notaSI,notaPR,media,promocion)";

$strSQL.="VALUES(0,'".$nexpediente."','".$nombre."','".$notaLM."','".$notaED."','".$notaBD."','".$notaSI."','".$notaPR."','".$media."','".$promocion."')";

$r=mysqli_query($conn,$strSQL);

if ($r){
    header("Location: index.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}
