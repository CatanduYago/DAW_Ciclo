import java.util.Stack;
import java.util.Scanner;
import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Random;

public class App {

    public static void busca(int elemento, LinkedList<Integer> cola) {
        System.out.println(cola);

        int tamaño = cola.size();
        for (int i = 0; i < tamaño; i++) {

            int num = cola.poll();

            if (num == elemento) {
                System.out.println("Encontrado");
            } else {
                System.out.println("No encontrado");
                cola.add(num);
            }
        }
        System.out.println(cola);
    }

    public static void ej1() {
        Random r = new Random();
        Scanner sc = new Scanner(System.in);

        LinkedList<Integer> cola = new LinkedList<Integer>();
        int veces = 10;
        System.out.println("Qué número quieres encontrar? \n");

        int elemento = sc.nextInt();

        for (int i = 0; veces > i; i++) {
            cola.add(r.nextInt(10));
        }
        busca(elemento, cola);
    }

    public static void ej2() {
        Random r = new Random();
        Scanner sc = new Scanner(System.in);
        Stack<Integer> stack = new Stack<Integer>();
        Stack<Integer> stack2 = new Stack<Integer>();
        Stack<Integer> stack3 = new Stack<Integer>();

        int veces = 10;
        for (int i = 0; veces > i; i++) {
            stack.add(r.nextInt(10));

        }
        System.out.println(stack);
        int cantidad = stack.size();

        for (int i = 0; i < cantidad; i++) {
            int num = stack.pop();
            stack2.push(num);
        }
        for (int i = 0; i < cantidad; i++) {
            int num = stack2.pop();
            stack3.push(num);
        }
        System.out.println(stack3);

    }

    public static void main(String[] args) throws Exception {
        int opcion;
        Scanner sc = new Scanner(System.in);
        System.out.println(
                "\nIngrese una opcion: \n 1.Ejercicio 1  \n 2.Ejercicio 2  \n 3.Salir\n");
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
            case 3:
                break;
            default:
                System.out.println("Opción incorrecta, solo numeros entre 1 y 3");
                break;
        }
    }
}