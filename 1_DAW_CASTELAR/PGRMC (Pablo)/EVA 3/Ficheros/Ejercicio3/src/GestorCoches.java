import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class GestorCoches {
     
    public static void cargar(coches coche) {
        List<coches> vehiculo = new ArrayList<>();

        String archivo = "coches.csv";
        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] data = linea.split(",");
                String marca = data[0];
                String modelo = data[1];
                int año = Integer.parseInt(data[2]);
                String color = data[3];
                int precios = Integer.parseInt(data[4]);

                coches coches = new coches(marca, modelo, año, color, precios);
                vehiculo.add(coches);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}