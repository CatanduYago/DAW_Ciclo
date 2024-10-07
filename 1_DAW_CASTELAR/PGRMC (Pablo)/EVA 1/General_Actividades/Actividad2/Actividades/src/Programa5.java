import java.util.Scanner;
import java.lang.Math;

public class Programa5 {
    public static void main(String[] args) throws Exception{
        Scanner leer = new Scanner(System.in);
        int x = leer.nextInt();
        println ("El perimetro de la circunferencia es: " + (2*Math.PI * x));
       leer.close();
    }

    private static void println(String string) {
        System.out.println(string); 
}  
    
}