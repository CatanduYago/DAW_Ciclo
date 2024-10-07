
import java.util.Scanner;
import static java.lang.Math.sqrt;

public class Programa2 {
     public static void main(String[] args) throws Exception{
        Scanner leer = new Scanner(System.in);
        int x = leer.nextInt();
        println ("La raiz cuadrada es: " + (sqrt(x)));  
    
    leer.close();
}

    private static void println(String string) {
    System.out.println(string);}        
}