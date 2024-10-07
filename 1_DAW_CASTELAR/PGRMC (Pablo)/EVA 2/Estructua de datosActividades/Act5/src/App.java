import java.util.Scanner;
import java.util.HashMap;
import java.util.Map;

public class App {

    public static void añade(HashMap<String, Integer> hashMap) {
        Scanner sc = new Scanner(System.in);

        String partido;
        int votos;

        System.out.println("\nIntroduce la cantidad de partidos politicos a ingresar");
        int cantidad = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < cantidad; i++) {
            System.out.println("\nIntroduce el nombre del partido");
            partido = sc.nextLine();
            System.out.println("\nIntroduce el numero de votos de este");
            votos = sc.nextInt();
            hashMap.put(partido, votos);
            sc.nextLine();
        }
        sc.close();

    }

    public static void buscar(HashMap<String, Integer> hashMap) {
        Scanner sc = new Scanner(System.in);
        System.out.println("\nIntroduce el nombre del partido politico a buscar");
        String partido = sc.nextLine();

        if (hashMap.containsKey(partido)) {
            System.out.println("\nEl partido " + partido + " tiene " + hashMap.get(partido) + " votos");
        } else {
            System.out.println("\nEl partido " + partido + " no tiene votos");
        }
        sc.close();

    }

    public static void buscar2(HashMap<String, Integer> hashMap) {
        System.out.println("\nLos partidos politicos son: \n");

        for (String key : hashMap.keySet()) {
            System.out.println(key);
        }
    }

    public static void buscar3(HashMap<String, Integer> hashMap) {
        System.out.println(" \nLos partidos y sus votos son: \n");

        for (Map.Entry<String, Integer> entry : hashMap.entrySet()) {
            System.out.println(entry.getValue() + "-" + entry.getKey());
        }
    }

    public static void ganador(HashMap<String, Integer> hashMap) {
        int votos = 0;
        String partido = "";

        for (Map.Entry<String, Integer> entry : hashMap.entrySet()) {
            if (entry.getValue() > votos) {
                votos = entry.getValue();
                partido = entry.getKey();
            }
        }
        System.out.println("\nEl partido ganador es el " + partido + " con " + votos + " votos");

    }

    public static void ej1() {
        Scanner sc = new Scanner(System.in);

        HashMap<String, Integer> hashMap = new HashMap<>();
        int opcion = 0;
        while (opcion != 6) {
            System.out.println(
                    " \n1. Añadir partidos y votos\n 2. Buscar el numero de votos de un partido\n 3. Mostrar todos los partidos\n 4. Mostrar todos los partidos y sus votos \n 5. Mostrar el ganador de las elecciones \n 6. Salir \n");

            opcion = sc.nextInt();

            switch (opcion) {
                case 1:
                    añade(hashMap);
                    break;
                case 2:
                    buscar(hashMap);
                    break;
                case 3:
                    buscar2(hashMap);
                    break;
                case 4:
                    buscar3(hashMap);
                    break;
                case 5:
                    ganador(hashMap);
                    break;
                default:
                    break;
            }

        }
        sc.close();
    }

    public static void main(String[] args) throws Exception {
        ej1();
    }
}
