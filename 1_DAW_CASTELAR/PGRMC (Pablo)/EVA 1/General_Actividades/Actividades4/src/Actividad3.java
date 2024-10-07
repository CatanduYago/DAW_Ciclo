import java.util.Scanner;

public class Actividad3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        /* Pide al usuario que ingrese un número */
        System.out.print("Ingresa un número: ");
        int numero1 = scanner.nextInt();
        
        /* Pide al usuario que ingrese otro número */
        System.out.print("Ingresa otro número: ");
        int numero2 = scanner.nextInt();

        System.out.println("El resultado de dividir " + numero1 + " entre " + numero2 + " es: " + (numero1 / numero2)+ " y el resto es " + (numero1 % numero2));
        
        /* Cierra el scanner */
        scanner.close();
    }

}
