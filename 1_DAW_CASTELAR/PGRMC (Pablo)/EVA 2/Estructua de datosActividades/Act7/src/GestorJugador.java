import java.util.ArrayList;
import java.util.Scanner;

public class GestorJugador {

    public ArrayList<jugador> jugadores;

    public GestorJugador() {
        jugadores = new ArrayList<>();
    }

    public static void añadir1(ArrayList<jugador> jugadores) {
        jugadores.add(new jugador("78192381R","Yago", "Catalano", "arriba", "21/11/2004"));
        jugadores.add(new jugador("19238723X","Paco", "Ibai", "arriba", "21/11/2004"));
        jugadores.add(new jugador("12983616B","Dani", "Llanso", "arriba", "21/11/2004"));
        jugadores.add(new jugador("92181364D","Yoya", "Estopa", "arriba", "21/11/2004"));
        jugadores.add(new jugador("19823714Z","YaSupago", "Morla", "arriba", "21/11/2004"));
        jugadores.add(new jugador("78492381R","Alvaro", "Andujar", "arriba", "21/11/2004"));

    }
    public static void añadir(ArrayList<jugador> jugadores) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Cuántos jugadores quieres añadir?");
        int jugador = sc.nextInt();
        sc.nextLine();
        for (int i = 0; i < jugador; i++) {
            System.out.println("Ingresa el DNI");
            String DNI = sc.nextLine();
            System.out.println("Ingresa el nombre");
            String nom = sc.nextLine();
            System.out.println("Ingresa los apellidos");
            String ape = sc.nextLine();
            System.out.println("Ingresa la posicion");
            String pos = sc.nextLine();
            System.out.println("Ingresa la fecha de nacimiento");
            String nacimiento = sc.nextLine();
            
            jugadores.add(new jugador(DNI,nom, ape, pos, nacimiento));
        }
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
public static void BusquedaBinaria(ArrayList<jugador> jugadores){
        Scanner sc = new Scanner(System.in);
        System.out.println("Escribe el nombre de un jugador");
        String nombre = sc.nextLine();
        boolean encontrado = false;
        int centro;
        int a=0;
        int tamaño=jugadores.size()-1;
        while(a<=tamaño){
            centro=(tamaño+a)/2;
            if(jugadores.get(centro).getNombre().compareTo(nombre)==0){
                encontrado=true;
                break;
            }
            if(jugadores.get(centro).getNombre().compareTo(nombre)>0){
                tamaño=centro-1;
            }
            if(jugadores.get(centro).getNombre().compareTo(nombre)<0){
                a=centro+1;
            }
        }
        int centro1 = -1; 
        if (encontrado) {
            System.out.println("El jugador " + nombre + " esta entre los jugadores");
            System.out.println(jugadores.get(centro1));
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
            System.out.println("Ingresa el DNI");
            String DNI = sc.nextLine();
            System.out.println("Ingresa el nombre");
            String nom = sc.nextLine();
            System.out.println("Ingresa los apellidos");
            String ape = sc.nextLine();
            System.out.println("Ingresa la posicion");
            String pos = sc.nextLine();
            System.out.println("Ingresa la fecha de nacimiento");
            String nacimiento = sc.nextLine();
            
            jugadores.add(0, new jugador(DNI,nom, ape, pos, nacimiento));
        } else {
            System.out.println("El jugador " + nombre + " no esta entre los jugadores");
        }
    }
    
    public static void OrdenarporDNI(ArrayList<jugador> jugadores){
        // Insercion directa
        
        System.out.println(jugadores);
       }
       

    
    public static void OrdenarporApellido(ArrayList<jugador> jugadores) {
        for (int i = 0; i < jugadores.size() - 1; i++) {
            for (int j = 0; j < (jugadores.size() - 1 - i); j++) {
                if (jugadores.get(j).getApellidos().compareTo(jugadores.get(j + 1).getApellidos()) > 0) {
                    jugador tamaño2 = jugadores.get(j);
                    jugadores.set(j, jugadores.get(j + 1));
                    jugadores.set(j + 1, tamaño2);
                }
            }
            
        }
        System.out.println(jugadores);
    }
}
