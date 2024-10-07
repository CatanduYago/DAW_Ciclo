import java.util.Random;
import java.util.Scanner;

public class App {
    public static void ej1() {
        int filas = 5;
        int colum = 6;
        int[][] matriz = new int[filas][colum];
        Random r = new Random();

        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[i].length; j++) {
                matriz[i][j] = r.nextInt(10);
            }
        }

        for (int i = 0; i < matriz.length; i++) {
            int sumaFila = 0;
            for (int j = 0; j < matriz[i].length; j++) {
                sumaFila += matriz[i][j];
            }
            matriz[i][5] = sumaFila;
        }

        for (int j = 0; j < matriz[0].length; j++) {
            int sumaColumna = 0;
            for (int i = 0; i < matriz.length; i++) {
                sumaColumna += matriz[i][j];
            }
            matriz[4][j] = sumaColumna;
        }

        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[i].length; j++) {
                System.out.print(matriz[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static void ej2() {
        Scanner sc = new Scanner(System.in);

        System.out.println("Introduce el tamaño del array: ");
        int tamaño = sc.nextInt();

        int[] numeros = new int[tamaño];

        for (int i = 0; i < numeros.length; i++) {
            numeros[i] = (int) (Math.random());
        }

        System.out.println("Introduce el numero a buscar: ");
        int digito = sc.nextInt();

        int[] nums = new int[numeros.length];

        for (int i = 0; i < numeros.length; i++) {
            if (numeros[i] % 10 == digito) {
                nums[i] = numeros[i];
            }
        }

        for (int i = 0; i < nums.length; i++) {
            System.out.println(nums[i]);
        }
    }

    public static void ej3() {
        Scanner sc = new Scanner(System.in);

        int[] numeros = new int[100];

        for (int i = 0; i < numeros.length; i++) {
            System.out.println("Introduce un numero: ");
            int numero = sc.nextInt();

            if (numero == 0) {
                break;
            }

            for (int j = numeros.length - 2; j >= i; j--) {
                numeros[j + 1] = numeros[j];
            }

            numeros[i] = numero;
        }

        for (int i = 0; i < numeros.length; i++) {
            if (numeros[i] != 0) {
                System.out.println(numeros[i]);
            }
        }
    }

    public static void ej4(){
        Scanner sc = new Scanner(System.in);

        System.out.println("Introduce la cantidad de interacionees: ");
        int iteraciones = sc.nextInt();

        int[] numeros = new int[150];

        for (int i = 0; i < numeros.length; i++) {
            numeros[i] = (int) (Math.random() * 6) + 5;
        }

        for (int i = 0; i < iteraciones; i++) {
            for (int j = 0; j < numeros.length - 1; j++) {
                numeros[j] = numeros[j] + numeros[j + 1];
            }
        }

        for (int i = 0; i < numeros.length; i++) {
            System.out.println(numeros[i]);
        }
    }
    public static void main(String[] args) throws Exception {
        int opcion;
        Scanner sc = new Scanner(System.in);
        System.out.println(
                "\nIngrese una opcion: \n 1.Ejercicio 1  \n 2.Ejercicio 2  \n 3.Ejercicio 3  \n 4.Ejercicio 4  \n 5.Salir\n");
        opcion = sc.nextInt();

        switch (opcion) {
            case 1: //
                System.out.println("Ejercicio 1\n ");
                ej1();
                break;
            case 2: //
                System.out.println("Ejercicio 2\n  ");
                ej2();
                break;
            case 3: //
                System.out.println("Ejercicio 3\n  ");
                ej3();
                break;
            case 4: //
                System.out.println("Ejercicio 4\n  ");
            ej4();
                break;
            case 5:
                break;
            default:
                System.out.println("Opción incorrecta, solo numeros entre 1 y 5");
                break;
        }
    }
}
