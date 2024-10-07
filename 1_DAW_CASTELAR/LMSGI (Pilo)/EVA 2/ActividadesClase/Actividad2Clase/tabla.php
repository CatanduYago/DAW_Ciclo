<?php
$host = "127.0.0.1";
$usuario = "root";
$clave = "";
$db = "empleadosdb";

$conn = mysqli_connect($host, $usuario, $clave, $db) or die("Error en la conexion.");

$strSQL = "SELECT NºSS, nom, ape, salar, turno, tipo, puesto, descripcion, dire FROM empleadosdb";

$r = mysqli_query($conn, $strSQL);

if ($r) {
    print '<style>';
    print 'th{
        font-weight: bolder;
        border: 2px solid black;
        padding: 6px;
        font-size: 14px;
        min-width:40px;
        background-color: #ffffee;
        border-radius: 10px;
    }
    tr {
        width: fit-content;
        text-align: center;
        }
    
    td {
        border: 2px solid black;
        padding: 5px;
        font-size: 12px;
        width: fit-content;
        text-align: center;
        margin: 0;
        background-color: #ffffee;
        border-radius: 10px;
    
    }
    
    body {
        font-family: Verdana, Geneva, Tahoma, sans-serif;
        position: relative;
        background-image: url("img/fondo.jpg");
        background-size: cover;
    }
    table {
        background-transparency:100%;
        padding: 20px;
        border-radius: 25px;
        width: auto;
        margin: auto;
    }
    #guardar {
        background-color: #96c723;
        font-weight: bold;
        border: 2px solid black;
        border-radius: 10px;
        font-size: 15px;
        color: white;
        text-transform: uppercase;
    }
    
    #cancelar {
        background-color: #c72323;
        color: white;
        font-weight: bold;
        border: 2px solid black;
        border-radius: 10px;
        font-size: 15px;
        text-transform: uppercase;
    }
    
    #guardar:hover,
    #cancelar:hover {
        cursor: pointer;
        scale: 1.1;
    }
    
    #eliminacion:hover,
    #insertar:hover,
    #consulta:hover,
    #ver:hover,
    #hacer:hover {
        cursor: pointer;
        color: black;
        background-color: #ffffee    }
    
    #menu {
        display: flex;
        flex-direction: row;
        justify-content: center;
        position: relative;
    }
    
    a {
        text-decoration: none;
        border-radius: 10px;
        border: 2px solid black;
        padding: 6px;
        color: black;
        font-size: 16px;
        font-weight: bold;
        text-transform: uppercase;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        margin: 10px;
    }
    
    span {
        margin: 5px;
        font-size: 15px;
    }
    
    #insertar,
    #eliminacion,
    #ver,
    #hacer,
    #consulta,
    #login {
        background-color: #000000;
        color: white;
    }
    
    #login:hover {
        color: black;
        background-color: #ffffee;
        cursor: pointer;
    }
</style>';
    print "<nav id='menu'>
            <a href='index.html' id='insertar'>Insertar</a>
            <a href='eliminacion.html' id='eliminacion'>Eliminar</a>
            <a href='actualizacion.html'' id='ver'>Actualizar</a>
            <a href='consulta.html' id='consulta'>Hacer consulta</a>
            <a href='tabla.php' id='consulta'>Ver tabla</a>
            <a href='login.html' id='login'>Logeate</a>
            </nav>";
    print "<table>";
    print "<tr>";
    print "<th>Nº Seguridad Social</th>";
    print "<th>Nombre</th>";
    print "<th>Apellidos</th>";
    print "<th>Salario</th>";
    print "<th>Turno</th>";
    print "<th>Tipo</th>";
    print "<th>Puesto</th>";
    print "<th>Descripcion</th>";
    print "<th>Dire</th>";
    print "</tr>";
    print "<tbody>";
    while ($row = mysqli_fetch_array($r)) {
        print "<tr>";
        print "<td>" . $row["NºSS"] . "</td>";
        print "<td>" . $row["nom"] . "</td>";
        print "<td>" . $row["ape"] . "</td>";
        print "<td>" . $row["salar"] . "</td>";
        print "<td>" . $row["turno"] . "</td>";
        print "<td>" . $row["tipo"] . "</td>";
        print "<td>" . $row["puesto"] . "</td>";
        print "<td>" . $row["descripcion"] . "</td>";
        print "<td>" . $row["dire"]. "</td>";
        print "</tr>";
    }
    print "</tbody>";
    print "</table>";
} else {
    print "<p>Error al ejecutar la consulta</p>";
}
