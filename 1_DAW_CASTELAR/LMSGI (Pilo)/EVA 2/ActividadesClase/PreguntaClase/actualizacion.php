<?php
$host= "127.0.0.1";
$usuario= "root";
$clave="";
$db="daw";

$conn= mysqli_connect($host,$usuario,$clave,$db) or die ("Error en la conexion.");

$campo = $_REQUEST['campo'];
$nexpediente = $_REQUEST['nexpediente'];
$num = $_REQUEST['num'];


$strSQL = "UPDATE `alumno` SET `" . $campo . "`='" . $num . "' WHERE `nexpediente`='" . $nexpediente . "'";

$r=mysqli_query($conn,$strSQL);

if ($r){
    header("Location: actualizacion.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}
