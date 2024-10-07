<?php

// echo "<pre>";
// print_r($_POST);
// echo "</pre>";      
// die();

// var_dump($_POST);

$nombre = $_POST['nombre'] ?? '';
$apellidos = $_POST['apellidos'] ?? '';
$email = $_POST['email'] ?? '';
$fechanacimiento = $_POST['fechanacimiento'] ?? '';
$sexo = $_POST['sexo'] ?? '';
// $aficiones = isset($_POST['aficiones']) ? $_POST['aficiones'] :[] ?? '';
$aficiones = $_POST['aficiones'] ?? [] ?? '';
$estudio = $_POST['estudios'] ?? '';
$comentarios = $_POST['comentarios'] ?? '';
$imagen = $_FILES['imagen'] ?? null;

echo "<hr>";
echo "Nombre: " . $nombre."<br>";
echo "Apellidos: ". $apellidos."<br>";
echo "Correo Electronico: ". $email."<br>";
echo "Fecha de Nacimiento: ". $fechanacimiento."<br>";
echo "Sexo: ". $sexo."<br>";
// echo "Aficiones: " . implode(", ", $aficiones) . "<br>";
echo "Aficiones: ";
echo"<ul>";
foreach ($aficiones as $aficion) {
    echo "<li>".$aficion."</li>";
}
echo "</ul>";
echo "Estudios: ". $estudio."<br>";
echo "Comentarios: ". $comentarios."<br>";
echo "Imagen: ". $imagen['name']."<br>";
echo "<hr>";

$path = $_SERVER ['DOCUMENT_ROOT'];
echo $path;
$localPathImage = "\\" .$imagen['name'];
$pathImagenes = $_SERVER['DOCUMENT_ROOT'].$localPathImage;
echo $pathImagenes;

move_uploaded_file($imagen['tmp_name'], $pathImagenes);
echo "<img src='$localPathImage'\>";