import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class App {
    public static void main(String[] args) throws Exception {
        GestorCoches GestorCoches = new GestorCoches();

        LectorCSV lectorCSV = new LectorCSV();
        List<coches> cochesCSV = lectorCSV.leer("coches.csv");
        for (coches coche : cochesCSV) {
            GestorCoches.cargar(coche);
        }

        LectorJSON lectorJSON = new LectorJSON();
        List<coches> cochesJSON = lectorJSON.leer("coches.json");
        for (coches coche : cochesJSON) {
            GestorCoches.cargar(coche);
        }

        LectorXML lectorXML = new LectorXML();
        List<coches> cochesXML = lectorXML.leer("coches.xml");
        for (coches coche : cochesXML) {
            GestorCoches.cargar(coche);
        }

        for (coches coche : GestorCoches.getcoches()) {
            System.out.println(coche);
        }

        for (coches coches : coche) {
            System.out.println(coche);
        }
    }
}