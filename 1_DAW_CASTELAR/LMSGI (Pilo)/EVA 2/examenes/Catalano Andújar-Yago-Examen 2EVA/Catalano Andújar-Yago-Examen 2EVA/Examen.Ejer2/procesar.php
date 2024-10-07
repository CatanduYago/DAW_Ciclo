<?php
require_once("LibExaEjer2/conexion.php");

$nomyape = $_REQUEST['nomyape'];
$dni = $_REQUEST['dni'];
$edad = $_REQUEST['edad'];
$direccion = $_REQUEST['direccion'];
$cp = $_REQUEST['cp'];
$estado_civil = $_REQUEST['estado_civil'];
$situacion_laboral = $_REQUEST['situacion_laboral'];
$categoria = $_REQUEST['categoria'];

$sql = "INSERT INTO datos (nomyape, dni, edad, direccion, cp, estado_civil, situacion_laboral, categoria) VALUES (nomyape, dni, edad, dire, cp, estado_civil, situacion_laboral, categoria)";

$r = mysqli_query($conn, $sql);

if ($r){
    header("Location: index.html");
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}