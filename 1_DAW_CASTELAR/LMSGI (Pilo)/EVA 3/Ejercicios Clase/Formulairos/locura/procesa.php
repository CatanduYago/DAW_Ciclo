<?php

$host = "127.0.0.1";
$usuario = "root";
$clave = "";
$db = "clasefumada";

$conn = mysqli_connect($host, $usuario, $clave, $db) or die ("Error en la conexion.");


$nombre = $_POST['nombre'];
$apellidos = $_POST['apellidos'];
$dni = $_POST['dni'];
$edad = $_POST['edad'];
$direccion = $_POST['direccion'];
$cpostal = $_POST['cpostal'];
$desgrava = $_POST['desgrava'];
$situacion_labo = $_POST['situacion_labo'];
$salario_bruto = $_POST['salario_bruto'];


$salario_neto = $salario_bruto; 

switch ($desgrava) {
    case '1':
        $salario_neto -= ($salario_bruto * 0.05);
        break;
    case '2':
        $salario_neto -= ($salario_bruto * 0.1);
        break;
    case '3':
        $salario_neto -= ($salario_bruto * 0.15);
        break;
    case '4':
        $salario_neto -= ($salario_bruto * 0.2);
        break;
    default:
        break;
}

switch ($situacion_labo) {
    case 'Autonomo':
        $salario_neto -= ($salario_bruto * 0.15);
        break;
    case 'Por_Cuenta_Propia':
        $salario_neto -= ($salario_bruto * 0.21);
        break;
    case 'Estudiante':
        break; 
    default:
        break;
}

$sql = "INSERT INTO situacion (Nombre, Apellidos, DNI, Edad, Direccion, CPostal, Desgrava, SituaLabo, SalarioB, SalarioN) VALUES ('$nombre', '$apellidos', '$dni', $edad, '$direccion', '$cpostal', $desgrava, '$situacion_labo', $salario_bruto, $salario_neto)";

$r = mysqli_query($conn, $sql);

if ($r) {
header("Location: consulta.php?salario_neto=$salario_neto");
} else {
echo "Error al guardar los datos: " . mysqli_error($conn);
}
?>
