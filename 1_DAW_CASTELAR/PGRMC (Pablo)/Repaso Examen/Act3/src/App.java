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
            lista.add(r.nextInt(10));
        }

        for (int i = 0; i < 1; i++) {
            System.out.println(lista);
        }
        System.out.print("[");

        for (int numero : lista) {
            System.out.print(+numero + ", ");
        }
        System.out.print("]");
        System.out.println("\n" + lista.toString());

    }

    public static void añade(ArrayList<jugador> jugadores) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Cuántos jugadores quieres añadir?");
        int jugador = sc.nextInt();
        sc.nextLine();
        for (int i = 0; i < jugador; i++) {
            System.out.println("Ingresa el nombre");
            String nom = sc.nextLine();
            System.out.println("Ingresa los apellidos");
            String ape = sc.nextLine();
            System.out.println("Ingresa la posicion");
            String pos = sc.nextLine();
            jugadores.add(new jugador(nom, ape, pos));
        }
        System.out.println(jugadores);
    }

    public static void busca(ArrayList<jugador> jugadores) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Escribe el nombre de un jugador");
        String nombre = sc.nextLine();

        boolean encontrado = false;
        jugador jugadorEncontrado = null;
        for (jugador jugador : jugadores) {
            if (jugador.getNombre().equals(nombre)) {
                encontrado = true;
                jugadorEncontrado = jugador;
                break;
            }
        }
        if (encontrado) {
            System.out.println("El jugador " + nombre + " esta entre los jugadores");
            System.out.println(jugadorEncontrado);
        } else {
            System.out.println("El jugador " + nombre + " no esta entre los jugadores");
        }
    }

    public static void elimina(ArrayList<jugador> jugadores) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Escribe el nombre del jugador a eliminar");
        String nombre = sc.nextLine();
        boolean encontrado = false;

        for (jugador jugador : jugadores) {
            if (jugador.getNombre().equals(nombre)) {
                encontrado = true;
                jugadores.remove(jugador);
                break;
            }
        }
        if (encontrado) {
            System.out.println("El jugador ha sido eliminado");
        } else {
            System.out.println("El jugador no ha podido ser eliminado");
        }
    }

    public static void edita(ArrayList<jugador> jugadores) {
        Scanner sc = new Scanner(System.in);
        boolean encontrado = false;

        System.out.println("Escribe el nombre del jugador a editar");
        String nombre = sc.nextLine();

        for (jugador jugador : jugadores) {
            if (jugador.getNombre().equals(nombre)) {
                encontrado = true;
                jugadores.remove(jugador);
                break;
            }
        }
        if (encontrado) {
            System.out.println("Ingresa el nombre");
            String nom = sc.nextLine();
            System.out.println("Ingresa los apellidos");
            String ape = sc.nextLine();
            System.out.println("Ingresa la posicion");
            String pos = sc.nextLine();
            jugadores.add(0, new jugador(nom, ape, pos));
        } else {
            System.out.println("El jugador " + nombre + " no esta entre los jugadores");
        }
    }

    public static void ej2() {
        ArrayList<jugador> jugadores = new ArrayList<jugador>();
        int opcion = 0;
        while (opcion != 5) {
            Scanner sc = new Scanner(System.in);
            System.out.println(
                    "\nIngrese una opcion: \n 1.Añadir un jugador  \n 2.Busca un jugador  \n 3.Elimina un jugador  \n 4.Edita un jugador  \n 5.Salir\n");
            opcion = sc.nextInt();

            switch (opcion) {
                case 1:
                    System.out.println("Añade un jugador\n ");
                    añade(jugadores);
                    break;
                case 2:
                    System.out.println("Busca un jugador\n  ");
                    busca(jugadores);
                    break;
                case 3:
                    System.out.println("Elimina un jugador\n  ");
                    elimina(jugadores);
                    break;
                case 4:
                    System.out.println("Edita un jugador\n  ");
                    edita(jugadores);
                    break;
                case 5:
                    break;
                default:
                    System.out.println("Opción incorrecta, solo numeros entre 1 y 5");
                    break;
            }
        }
    }

    public static void main(String[] args) throws Exception {
        int opcion;
        Scanner sc = new Scanner(System.in);
        System.out.println(
                "\nIngrese una opcion: \n 1.Ejercicio 1  \n 2.Ejercicio 2  \n 3.Salir\n");
        opcion = sc.nextInt();

        switch (opcion) {
            case 1:
                System.out.println("Ejercicio 1\n ");
                ej1();
                break;
            case 2:
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
