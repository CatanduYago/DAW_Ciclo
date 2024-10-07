import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = null;
        try {
            System.out.println("Leemos el fichero");
            sc = new Scanner(new File("archivo.txt"));
            String linea;
            while (sc.hasNextLine()){
                linea = sc.nextLine();
                System.out.println(linea);
            }
        }
        catch (FileNotFoundException e){
            System.err.println("Error" + e.getMessage());
        }
        finally {
            if (sc != null) sc.close();
        }
        System.out.println("Lectura Finalizada");
        }
        
}
