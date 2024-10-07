<?php
$host= "127.0.0.1";
$usuario= "root";
$clave="";
$db="lenguaje de marcas";

$conn= mysqli_connect($host,$usuario,$clave,$db) or die ("Error en la conexion.");

$pregunta = $_REQUEST["pregunta"];
$op1 = $_REQUEST["op1"];
$op2 = $_REQUEST["op2"];
$op3 = $_REQUEST["op3"];
$op4 = $_REQUEST["op4"];
$buena = $_REQUEST["buena"];
$examen = $_REQUEST["examen"];

$strSQL="INSERT INTO quiza(id,pregunta,op1,op2,op3,op4,buena,examen)";

$strSQL.="VALUES(0,'".$pregunta."','".$op1."','".$op2."','".$op3."','".$op4."','".$buena."','".$examen."')";

$r=mysqli_query($conn,$strSQL);

if ($r){
    print "<p>El registro fue insertado correctamente</p>";
} else {
    print "<p>Ha ocurrido un error inesperado</p>";
}
?>