import java.util.Scanner;
import java.lang.Math;

public class Programa4 {
    public static void main(String[] args) throws Exception{
        Scanner leer = new Scanner(System.in);
        int x = leer.nextInt();
        int pow = (int) Math.pow(x,2);
        System.out.println ("El área del círculo es: " + (Math.PI * pow));
       leer.close();
    }


}