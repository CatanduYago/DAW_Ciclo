import java.util.Random;
import java.util.Scanner;

public class App {
    public static void funcion1() {
        Random r = new Random ();
        int[] vector = new int[5];
        int i = 0;
        boolean repetido = false;
        while (i<vector.length){
            repetido = false;
            vector[i] = (r.nextInt(9)+1);
        for (int j = 0; j <= i; j++) {
            if (vector[i] == vector[j]&& i != j){
                repetido = true;
            }
        }
        if (repetido==false) {
            i++;
            
        }
        }
        for (int k : vector){
            System.out.println(k);
        }
    }
}
