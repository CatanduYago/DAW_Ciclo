<?php
require_once("LibExaEjer2/conexion.php");

$dni_consulta = $_REQUEST['dni_consulta'];


$sql = "SELECT nomyape, dni, edad, direccion, cp, estado_civil, situacion_laboral, categoria FROM datos WHERE dni = '$dni_consulta''";

$r = mysqli_query($conn, $sql);


if ($row = mysqli_fetch_array($r)) {

  print "<table border=\"1\">";
  print "<tr><th>Nombre y apellidos</th><td>" . $row['nomyape'] . "</td></tr>";
  print "<tr><th>DNI/NIE</th><td>" . $row['dni'] . "</td></tr>";
  print "<tr><th>Edad</th><td>" . $row['edad'] . "</td></tr>";
  print "<tr><th>Dirección</th><td>" . $row['direccion'] . "</td></tr>";
  print "<tr><th>Código postal</th><td>" . $row['cp'] . "</td></tr>";
  print "<tr><th>Estado civil</th><td>" . $row['estado_civil'] . "</td></tr>";
  print "<tr><th>Situación laboral</th><td>" . $row['situacion_laboral'] . "</td></tr>";
  print "<tr><th>Categoría profesional</th><td>" . $row['categoria'] . "</td></tr>";
  print "</table>";
} else {
    print "<p>No se ha encontrado ningún usuario con ese DNI/NIE</p>";
}