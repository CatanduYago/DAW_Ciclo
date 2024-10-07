import java.util.Scanner;
import java.lang.Math;

public class Programa3 {
    public static void main(String[] args) throws Exception{
        Scanner leer = new Scanner(System.in);
        int x = leer.nextInt();
        int y = leer.nextInt();

        System.out.println("Tu resultado es " + Math.pow(x, y));

    leer.close();
    }
    
}