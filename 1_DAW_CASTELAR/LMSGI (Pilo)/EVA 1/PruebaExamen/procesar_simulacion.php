<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $capital_inicial = floatval($_POST['capital_inicial']);
        $intereses_aplicados = floatval($_POST['intereses_aplicados']);
        $num_anios = intval($_POST['num_anios']);

        echo "Capital inicial: $" . number_format($capital_inicial, 2) . "<br>";
        echo "Intereses aplicados: " . $intereses_aplicados . "%<br>";
        echo "Número de años: " . $num_anios . "<br><br>";

        echo "<table border='1'>";
        echo "<tr><th>Año</th><th>Capital</th></tr>";

        $capital_actual = $capital_inicial;

        for ($i = 1; $i <= $num_anios; $i++) {
            $capital_actual += $capital_actual * ($intereses_aplicados / 100);
            echo "<tr><td>$i</td><td>$" . number_format($capital_actual, 2) . "</td></tr>";
        }

        echo "</table>";
    } else {
        echo "Acceso no válido a este archivo.";
    }
    ?>