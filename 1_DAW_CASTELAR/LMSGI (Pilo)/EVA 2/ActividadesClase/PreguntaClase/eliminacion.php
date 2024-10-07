<?php
$host= "127.0.0.1";
$usuario= "root";
$clave="";
$db="daw";

$conn= mysqli_connect($host,$usuario,$clave,$db) or die ("Error en la conexion.");

$nexpediente = $_REQUEST['nexpediente'];


$strSQL = "DELETE FROM alumno WHERE nexpediente=$nexpediente";

$r=mysqli_query($conn,$strSQL);

if ($r){
    header("Location: eliminacion.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}
