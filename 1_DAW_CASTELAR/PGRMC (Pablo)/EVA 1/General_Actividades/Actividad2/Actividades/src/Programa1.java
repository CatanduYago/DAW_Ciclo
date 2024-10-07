
import java.util.Scanner;

public class Programa1 {
    public static void main(String[] args) throws Exception{
        Scanner leer = new Scanner(System.in);
        int x = leer.nextInt();
        int y = leer.nextInt();

        println("Tu suma es " + (x+y));
        println("Tu resta es " + (x-y));
        println("Tu multiplicacion es " + (x*y));

        leer.close();
    }

    
    public static void println(String mensaje){
        System.out.println(mensaje);
}
}