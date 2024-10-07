<?php
require_once("LibExaEjer1/connFinanciera.php");

$sql = "SELECT * FROM empleado";
$r = mysqli_query($conn, $sql);

$totalRows = mysqli_num_rows($r);

print "<span>Datos de los empleados. Nº de registro/os: $totalRows </span>";
print "<table border='1'>";
print "<tr>
<th>Nombre</th>
<th>Apellido</th>
<th>Categoría</th>
<th>NSS</th>
<th>Salario Bruto</th>
<th>Desgravación</th>
<th>Concepto</th>
<th>Salario Neto</th>
</tr>";

while ($row = mysqli_fetch_array($r)) {
    print "<tr>";
    print "<td>" . $row['nombre'] . "</td>";
    print "<td>" . $row['apellidos'] . "</td>";
    print "<td>" . $row['categoria'] . "</td>";
    print "<td>" . $row['nss'] . "</td>";
    print "<td>" . $row['salariob'] . "</td>";
    print "<td>" . $row['desgravacion'] . "</td>";
    print "<td>" . $row['concepto'] . "</td>";
    print "<td>" . $row['sneto'] . "</td>";
    print "</tr>";
}
print "</table>";
