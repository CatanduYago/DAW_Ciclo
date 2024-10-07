<?php
require_once("librerias/conexion.php");

$nss = $_REQUEST['nss'];


$strSQL = "DELETE FROM alumno WHERE NºSS=$nss";

$r=mysqli_query($conn,$strSQL);

if ($r){
    header("Location: eliminacion.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}