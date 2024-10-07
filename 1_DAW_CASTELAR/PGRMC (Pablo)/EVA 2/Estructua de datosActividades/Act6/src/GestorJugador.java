import java.util.ArrayList;
import java.util.Scanner;

public class GestorJugador {

    public ArrayList<jugador> jugadores;

    public GestorJugador() {
        jugadores = new ArrayList<>();
    }

    public static void añadir(ArrayList<jugador> jugadores) {

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
            System.out.println("Ingresa la fecha de nacimiento");
            String nacimiento = sc.nextLine();
            jugadores.add(new jugador(nom, ape, pos, nacimiento));
        }
        
    }
    public static void busquedabinaria(ArrayList<jugador> jugadores){

        ArrayList.length();
    }
    public static void buscar(ArrayList<jugador> jugadores) {
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
            System.out.println("Ingresa la fecha de nacimiento");
            String nacimiento = sc.nextLine();
            jugadores.add(0, new jugador(nom, ape, pos, nacimiento));
        } else {
            System.out.println("El jugador " + nombre + " no esta entre los jugadores");
        }
    }

}