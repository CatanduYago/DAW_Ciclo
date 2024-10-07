<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejemplo de formulario</title>
</head>
<body>
    <h1>Identificate</h1>
    <form action="procesa.php" method="post">
    <label for="txtuser">Nombre de usuario: </label><br>
    <input type="text" name="txtuser" size="30"><br>
    <label for="txtpass">Introduzca su contraseña: </label><br>
    <input type="password" name="txtpass" size="15 "><br><br>
    <input type="checkbox" name="chkremember">Recordar contraseña<br><br>
    <input type="submit" value="Enviar">
    <input type="reset" value="Limpiar">
    
    </form>
</body>
</html>