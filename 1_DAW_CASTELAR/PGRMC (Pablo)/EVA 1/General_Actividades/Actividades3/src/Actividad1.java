import java.util.Scanner;

public class Actividad1 {
    public static void main(String[] args) throws Exception{
        Scanner leer = new Scanner(System.in);
        System.out.println("Ingrese su nombre: \n");
        String nombre = leer.nextLine();
        System.out.println("Bienvenido, " + nombre);
        leer.close();
    }
}