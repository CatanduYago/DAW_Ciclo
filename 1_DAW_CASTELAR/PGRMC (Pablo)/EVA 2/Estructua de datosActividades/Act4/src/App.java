import java.util.Stack;
import java.util.Scanner;
import java.util.LinkedList;
import java.util.ArrayList;
import java.util.Queue;
import java.util.Random;

public class App {

    public static void ej1() {
        Random r = new Random();
        LinkedList<Integer> lista = new LinkedList<Integer>();

        int cantidad = 10;

        for (int i = 0; cantidad > i; i++) {
            lista.add(r.nextInt(15));
        }
        System.out.println(lista);
        int largo = lista.size();
        for (int i = 0; i < largo; i++) {
            int num = lista.remove();
            if (num % 2 == 0) {

            } else {
                lista.add(num);
            }
        }
        System.out.println(lista);
    }

    public static void ej2() {
        Random r = new Random();
        LinkedList<Integer> lista = new LinkedList<Integer>();

        int cantidad = 10;

        for (int i = 0; cantidad > i; i++) {
            lista.add(r.nextInt(15));
        }
        System.out.println(lista);

        for (int i = 1; i < cantidad; i++) {
            int num = lista.removeLast();
            lista.set(lista.size() - 1, num + lista.get(lista.size() - 1));

            System.out.println(lista);
        }
    }

    public static void ej3() {
        Random r = new Random();
        LinkedList<Integer> lista = new LinkedList<Integer>();
        LinkedList<Integer> lista2 = new LinkedList<Integer>();

        int num = 0;
        for (int i = 0; 100 > i; i++) {
            int num2 = 1;

            lista.add((num + num2));
            num++;
        }
        for (int j = 0; j < 100; j++) {
            lista2.add(lista.remove(r.nextInt(lista.size())));
        }
        System.out.println(lista2);

    }

    public static void ej4() {
        ArrayList<String> nombres = new ArrayList<>();
        ArrayList<String> nombres1 = new ArrayList<>();
        ArrayList<String> nombres2 = new ArrayList<>();
        ArrayList<String> nombres3 = new ArrayList<>();
        ArrayList<String> nombres4 = new ArrayList<>();
        ArrayList<String> nombres5 = new ArrayList<>();

        nombres.add("Juan");
        nombres.add("María");
        nombres.add("Carlos");
        nombres.add("Ana");
        nombres.add("Pedro");
        nombres.add("Laura");
        nombres.add("Luis");
        nombres.add("Sofía");
        nombres.add("Javier");
        nombres.add("Elena");
        nombres.add("Diego");
        nombres.add("Paula");
        nombres.add("Alejandro");
        nombres.add("Lucía");
        nombres.add("Miguel");
        nombres.add("Carmen");
        nombres.add("Pablo");
        nombres.add("Rosa");
        nombres.add("Roberto");
        nombres.add("Isabel");
        nombres.add("Daniel");
        nombres.add("Teresa");
        nombres.add("Jorge");
        nombres.add("Beatriz");
        nombres.add("Fernando");
        nombres.add("Raquel");
        nombres.add("José");
        nombres.add("Patricia");
        nombres.add("David");
        nombres.add("Eva");

        Random r = new Random();

        for (int j = 0; j < 5; j++) {
            nombres1.add(nombres.remove(r.nextInt(nombres.size())));
            nombres2.add(nombres.remove(r.nextInt(nombres.size())));
            nombres3.add(nombres.remove(r.nextInt(nombres.size())));
            nombres4.add(nombres.remove(r.nextInt(nombres.size())));
            nombres5.add(nombres.remove(r.nextInt(nombres.size())));

        }

        System.out.println(nombres);
        System.out.println(nombres1);
        System.out.println(nombres2);
        System.out.println(nombres3);
        System.out.println(nombres4);
        System.out.println(nombres5);

    }

    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);

        System.out.println(
                "\nIngrese una opcion: \n 1.Ejercicio 1  \n 2.Ejercicio 2  \n 3.Ejercicio 3 \n 4. Ejercicio 4 \n 5.Salir \n ");

        int opcion = sc.nextInt();

        switch (opcion) {
            case 1:
                System.out.println("Ejercicio 1\n ");
                ej1();
                break;
            case 2:
                System.out.println("Ejercicio 2\n ");
                ej2();
                break;
            case 3:
                System.out.println("Ejercicio 3\n ");
                ej3();
                break;
            case 4:
                System.out.println("Ejercicio 3\n ");
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
