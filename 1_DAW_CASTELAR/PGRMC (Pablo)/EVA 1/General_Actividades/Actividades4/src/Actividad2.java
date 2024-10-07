import java.util.Scanner;

public class Actividad2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        /* Pide al usuario que ingrese un número */
        System.out.print("Ingresa un número: ");
        int numero = scanner.nextInt();
        
        /* Multiplica el número por 2 utilizando un desplazamiento de bits */
        int resultado = numero << 1;
        
        /* Muestra el resultado por pantalla */
        System.out.println("El resultado de multiplicar " + numero + " por 2 es: " + resultado);
        
        /* Cierra el scanner */
        scanner.close();
    }
}
