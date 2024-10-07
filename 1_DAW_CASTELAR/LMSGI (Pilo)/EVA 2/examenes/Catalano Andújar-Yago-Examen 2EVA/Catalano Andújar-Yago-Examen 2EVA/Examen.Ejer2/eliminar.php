<?php
require_once("LibExaEjer2/conexion.php");

$dni_borrar = $_POST['dni_borrar'];


$sql = "DELETE FROM datos WHERE dni = '$dni_borrar''";

$r = mysqli_query($conn, $sql);

if ($r) {
    header("Location: index.html");

} else {
  print "<p>Ha ocurrido un error al intentar eliminar los datos del usuario.</p>";

}