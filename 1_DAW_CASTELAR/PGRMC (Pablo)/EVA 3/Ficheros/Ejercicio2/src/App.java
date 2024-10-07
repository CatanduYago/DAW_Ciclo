import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class App {
    public static void main(String[] args) {
        ej3();
}

public static void ej1(){
    String archivo = "archivo.txt"; 
    
        try {
            FileReader fr = new FileReader(archivo);
            BufferedReader br = new BufferedReader(fr);
            
            String linea;
            int letras = 0;
            int numeros = 0;
            
            while ((linea = br.readLine()) != null) {
                for (char c : linea.toCharArray()) {
                    if (Character.isLetter(c)) {
                        letras++;
                    } else if (Character.isDigit(c)) {
                        numeros++;
                    }
                }
                System.out.println(linea); 
            }
            
            System.out.println("Total de letras: " + letras);
            System.out.println("Total de digitos: " + numeros);
            
            br.close();
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        }
    }

    public static void ej2(){
    
        String archivo = "archivo.txt"; 
    
        try {
            FileReader fr = new FileReader(archivo);
            BufferedReader br = new BufferedReader(fr);
            
            String linea;
            int vocal = 0;
            int consonantes = 0;
            
            while ((linea = br.readLine()) != null) {
                for (char c : linea.toCharArray()) {
                c = Character.toLowerCase(c);
                    if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
                        vocal++;
                    } else if (Character.isLetter(c)) {
                        consonantes++;
                    }
                }
            }

            System.out.println("Total de vocales: " + vocal);
            System.out.println("Total de consonantes: " + consonantes);

        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        }
    }

public static void ej3(){
    String archivo = "Restaurants.csv";
    String linea;

    try {
        FileReader fr = new FileReader(archivo);
        BufferedReader br = new BufferedReader(fr);
    
        while ((linea = br.readLine()) != null) {
        String[] datos = linea.split(",");
        String postal = datos[4];
        
        if (postal.startsWith("6")) {
            System.out.println(linea);
        }
    }
    
} catch (IOException e) {
    System.err.println("Error al leer el archivo: " + e.getMessage());
}

}


}