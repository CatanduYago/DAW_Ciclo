import java.util.Stack;
import java.util.Scanner;
import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Random;

public class App {

    public static void ej1() {
        Stack<Integer> stack = new Stack<Integer>();
        Scanner sc = new Scanner(System.in);
        Random r = new Random();

        System.out.println("Cuantos elementos quieres introducir?");
        int contador = sc.nextInt();

        for (int i = 0; i < contador; i++) {
            stack.push(r.nextInt(15));
        }
        while (!stack.isEmpty()) {
            System.out.println(stack.pop());
        }
    }

    public static void ej2() {
        PriorityQueue<Integer> cola = new PriorityQueue<Integer>();
        Scanner sc = new Scanner(System.in);
        Random r = new Random();

        System.out.println("Cuantos elementos quieres introducir?");
        int contador = sc.nextInt();

        for (int i = 0; i < contador; i++) {
            cola.add(r.nextInt(15));
        }

        while (!cola.isEmpty()) {
            System.out.println(cola.poll());
        }
    }

    public static void ej3() {
        Queue<coche> coches = new LinkedList<coche>();

        coches.add(new coche("Hyundai", "3663-LGR"));
        coches.add(new coche("Aston Martin", "1433-FAD"));
        coches.add(new coche("Renault", "9012-GHI"));

        int numTickets = (int) (Math.random() * 5 + 5);

        for (int i = 0; i < numTickets; i++) {
            if (!coches.isEmpty()) {
                coche coche = coches.poll();
                System.out.println(
                        "El coche " + coche.getModelo() + " " + coche.getMatricula() + " tiene un ticket");
            }
        }
        if (coches.isEmpty()) {
            System.out.println("No quedan coches");
        } else {
            System.out.println("Quedan " + coches.size() + " coches");
        }
    }

    public static void ej4(){

        Scanner sc = new Scanner(System.in);

        Stack<libro> stack = new Stack<libro>();

        stack.push(new libro ("La oca loca","Gloria Fuertes"));
        stack.push(new libro ("Atherton: Rios de Fuego","Patrick Carman"));
        stack.push(new libro ("La puerta falsa","Alfredo Gómez Cerdá"));

        System.out.println("Escribe el nombre de un libro");
        String titulo = sc.nextLine();
        
        boolean encontrado = false;

        for (libro libro : stack) {
            if (libro.getNombre().equals(titulo)) {
                encontrado = true;
                break;
            }
        }

        if (encontrado) {
            System.out.println("El libro " + titulo + " esta en la pila");
        } else {
            System.out.println("El libro " + titulo + " no esta en la pila");
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

