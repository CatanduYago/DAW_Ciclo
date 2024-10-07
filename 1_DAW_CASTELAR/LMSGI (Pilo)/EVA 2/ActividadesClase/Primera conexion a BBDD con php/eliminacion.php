<?php
$host= "127.0.0.1";
$usuario= "root";
$clave="";
$db="lenguaje de marcas";

$conn= mysqli_connect($host,$usuario,$clave,$db) or die ("Error en la conexion.");

$id = $_REQUEST["id"];


$strSQL="DELETE FROM quiza WHERE id=$id";

$r=mysqli_query($conn,$strSQL);

if ($r){
    print "<p>El registro fue borrado correctamente</p>";
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}
?>