<?php
$host= "127.0.0.1";
$usuario= "root";
$clave="";
$db="lenguaje de marcas";

$conn= mysqli_connect($host,$usuario,$clave,$db) or die ("Error en la conexion.");

$id = $_REQUEST['id'];
$pregunta = $_REQUEST["pregunta"];
$op1 = $_REQUEST["op1"];
$op2 = $_REQUEST["op2"];
$op3 = $_REQUEST["op3"];
$op4 = $_REQUEST["op4"];
$buena = $_REQUEST["buena"];
$examen = $_REQUEST["examen"];

$strSQL = "UPDATE quiza SET pregunta = '$pregunta', op1 = '$op1', op2 = '$op2', op3 = '$op3', op4 = '$op4', buena = '$buena', examen = '$examen' WHERE id = $id";

$r=mysqli_query($conn,$strSQL);

if ($r){
    print "<p>El registro fue actualizado correctamente</p>";
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}
?>