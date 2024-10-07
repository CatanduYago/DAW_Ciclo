import java.util.Scanner;

public class Actividad3 {
    public static void main(String[] args) throws Exception{
        
        Scanner leer = new Scanner(System.in);
        System.out.println("Escriba una frase");
        String frase = leer.nextLine();
        long longitud = frase.length();
        System.out.println(longitud);
        System.out.println(frase.charAt(0));
        System.out.println(frase.charAt((int) (longitud-1)));


    leer.close();
       
        
    }
}