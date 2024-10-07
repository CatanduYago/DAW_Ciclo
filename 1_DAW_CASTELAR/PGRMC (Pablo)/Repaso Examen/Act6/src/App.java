import java.util.Stack;
import java.util.Scanner;
import java.util.LinkedList;
import java.util.ArrayList;
import java.util.Queue;
import java.util.Random;

public class App {


        

    public static void main(String[] args) throws Exception {
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
                    GestorJugador.añadir(jugadores);
                    break;
                case 2:
                    System.out.println("Busca un jugador\n  ");
                    GestorJugador.buscar(jugadores);
                    break;
                case 3:
                    System.out.println("Elimina un jugador\n  ");
                    GestorJugador.elimina(jugadores);
                    break;
                case 4:
                    System.out.println("Edita un jugador\n  ");
                    GestorJugador.edita(jugadores);
                    break;
                case 5:
                    break;
                default:
                    System.out.println("Opción incorrecta, solo numeros entre 1 y 5");
                    break;
            }
        }
    }
    }
