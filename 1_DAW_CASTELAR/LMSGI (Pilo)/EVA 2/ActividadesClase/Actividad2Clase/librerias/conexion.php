<?php
$host= "127.0.0.1";
$usuario= "root";
$clave="";
$db="empleadosdb";

$conn= mysqli_connect($host,$usuario,$clave,$db) or die ("Error en la conexion.");
