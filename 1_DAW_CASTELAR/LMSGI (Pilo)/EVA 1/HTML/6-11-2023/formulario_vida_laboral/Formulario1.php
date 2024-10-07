<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nombre = $_POST["nombre"];
        $apellido = $_POST["apellido"];
        $edad = $_POST["edad"];
        $estado_civil = $_POST["estado_civil"];
        $autonomo = isset($_POST["autonomo"]) ? "Sí" : "No";
        $empresa = isset($_POST["empresa"]) ? "Sí" : "No";

        echo "<p>Su nombre es: $nombre $apellido</p>";
        echo "<p>Tienes $edad años</p>";
        echo "<p>Su estado civil es: $estado_civil</p>";
        echo "<p>La información de su vida laboral se resume en:</p>";

        
        if ($autonomo === "Sí") {
            echo "<li>Ha sido trabajador autónomo</li>";
        }
        if ($empresa === "Sí") {
            echo "<li>Ha trabajado para alguna empresa</li>";
        }
        echo "</ul>";
    }
    ?>