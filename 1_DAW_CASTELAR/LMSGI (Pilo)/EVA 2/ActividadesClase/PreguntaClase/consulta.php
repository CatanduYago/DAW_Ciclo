<?php
require_once("conexion.php"); 
$host= "127.0.0.1";
$usuario= "root";
$clave="";
$db="daw";

$conn= mysqli_connect($host,$usuario,$clave,$db) or die ("Error en la conexion.");

$nexpediente = $_REQUEST["nexpediente"];

$strSQL="SELECT * FROM alumno WHERE nexpediente='$nexpediente'";


$r=mysqli_query($conn,$strSQL);


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
        background-color: #5ee41b;
        font-weight: bold;
        border: 2px solid;
        border-radius: 10px;
        font-size: 15px;
    }
    
    #cancelar {
        background-color: #EF3E36;
        font-weight: bold;
        border: 2px solid;
        border-radius: 10px;
        font-size: 15px;
    }
    
    #guardar:hover,
    #cancelar:hover {
        cursor: pointer;
        scale: 1.1;
    }
    
    #eliminacion:hover,
    #insertar:hover,
    #consulta:hover,
    #ver:hover {
        cursor: pointer;
        color: black;
    
    }
    
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
    
    #insertar {
        background-color: #96c723;
        color: white;
    }
    
    #eliminacion {
        background-color: #96c723;
        color: white;
    }
    
    #ver {
        background-color: #96c723;
        color: white;
    }
    
    #hacer {
        background-color: #96c723;
        color: white;
    }
    
    #consulta {
        background-color: #96c723;
        color: white;
    }
    
    #login {
        border-radius: 10px;
        background-color: #96c723;
        color: #ffffee;
        font-size: 16px;
        padding: 5px;
    }
    
    #login:hover {
        color: black;
        cursor: pointer;
    }
</style>';

    print"<nav>
            <a href='index.html' id='insertar'>Insertar</a>
            <a href='eliminacion.html' id='eliminacion'>Eliminar</a>
            <a href='actualizacion.html'' id='ver'>Actualizar</a>
            <a href='consulta.html' id='consulta'>Hacer consulta</a>
            <a href='tabla.php' id='consulta'>Ver tabla</a>
            <a href='login.html' id='login'>Logeate</a>
            </nav>";
    print "<table>";
    print "<thead>";
    print "<tr>";
    print "<th>Nombre</th>";
    print "<th>LMSGI</th>";
    print "<th>ENTDL</th>";
    print "<th>BBDD</th>";
    print "<th>SI</th>";
    print "<th>PGRMC</th>";
    print "<th>Media</th>";
    print "<th>Promociona</th>";
    print "</tr>";
    print "</thead>";
    print "<tbody>";
    while ($row = mysqli_fetch_array($r)) {
        print "<tr>";
        print "<td>" . $row["nombre"] . "</td>";
        print "<td>" . $row["notaLM"] . "</td>";
        print "<td>" . $row["notaED"] . "</td>";
        print "<td>" . $row["notaBD"] . "</td>";
        print "<td>" . $row["notaSI"] . "</td>";
        print "<td>" . $row["notaPR"] . "</td>";
        print "<td>";
        $media = ($row["notaLM"] + $row["notaED"] + $row["notaBD"] + $row["notaSI"] + $row["notaPR"]) / 5;
        print $media;
        print "</td>";
        print "<td>";
        if ($row["promocion"] == 1) {
            print "Sí";
        } else {
            print "No";
        }
        print "</td>";
        print "</tr>";
    }
    print "</tbody>";
    print "</table>";

    
} else {
    print "<p>Error al ejecutar la consulta</p>";
}

