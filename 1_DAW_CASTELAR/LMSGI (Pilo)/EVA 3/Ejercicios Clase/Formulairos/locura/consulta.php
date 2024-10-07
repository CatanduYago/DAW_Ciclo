<?php


$host = "127.0.0.1";
$usuario = "root";
$clave = "";
$db = "clasefumada";

$conn = mysqli_connect($host, $usuario, $clave, $db) or die ("Error en la conexion.");

$salario_neto = $_GET['salario_neto'];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Salario Neto</title>
    <link rel="stylesheet" href="style.css">
    <script>
        var salario_neto = '<?php echo $salario_neto;?>';
        function setSalarioNeto() {
            document.getElementById("salario_neto").value = salario_neto;
        }
</script>
</head>
<body onload="setSalarioNeto()">
<span>Salario Neto:</span>
        <input type="number" id="salario_neto" readonly>    
        <br><br><a href="ejercicio_random.html">Volver</a>
    </body>
</html>