import java.util.Scanner;

public class App {

    public static void alumnos() {
        Scanner sc = new Scanner(System.in);
        String[][] matriz = new String[100][2];
        boolean fin = false;
        int numAlumnos = 0;

            for (int i = 0; i < matriz.length && !fin; i++) {
                System.out.println("Introduce el nombre del alumno: ");
                matriz[i][0] = sc.nextLine();

                if (matriz[i][0].equals("*")) {
                    fin = true;
                    break;
                  }
                    System.out.println("Introduce la edad del alumno: ");
                    matriz[i][1] = sc.nextLine();
                    numAlumnos++;
                if (fin==true){
                break;
            }
            if (matriz[i][1]>=18)
            System.out.println(System.out.println(matriz[i][1]));
                }
            
        }
    

    public static void main(String[] args) throws Exception {

        int opcion;
        Scanner sc = new Scanner(System.in);
        System.out.println(
                "\nIngrese una opcion: \n 1.Edad de los alumnos  \n 2.  \n 3.  \n 4.  \n 5.  \n 6. Salir\n");
        opcion = sc.nextInt();

        switch (opcion) {
            case 1: //
                System.out.println("Ejercicio 1\n ");
                alumnos();
                break;
            case 2: //
                System.out.println("Ejercicio 2\n  ");

                break;
            case 3: //
                System.out.println("Ejercicio 3\n  ");

                break;
            case 4: //
                System.out.println("Ejercicio 4\n  ");

                break;
            case 5://
                System.out.println("Ejercicio 5\n ");

                break;
            case 6:
                break;
            default:
                System.out.println("Opción incorrecta, solo numeros entre 1 y 6");
                break;
        }
    }
}
