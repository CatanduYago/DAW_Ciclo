import java.util.Scanner;

public class Arrays {
    public static void main(String[] args) throws Exception {
        Ej2();

    }

    public static void Ej1() {
        int[][] matrizA = new int[10][10];
        int[][] matrizB = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };

        Scanner sc = new Scanner(System.in);

        int x = sc.nextInt();
        int y = sc.nextInt();

        if (matrizB.length + x <= matrizA.length && matrizB[0].length + y <= matrizA[0].length) {
            for (int i = 0; i < matrizB.length; i++) {
                for (int j = 0; j < matrizB[0].length; j++) {
                    matrizA[i + x][j + y] = matrizB[i][j];
                }
            }

            for (int i = 0; i < matrizA.length; i++) {
                for (int j = 0; j < matrizA[0].length; j++) {
                    System.out.print(matrizA[i][j]);
                }
                System.out.println();
            }
        }
    }

    public static void Ej2() {
        int[][] matrizPruebas = { { 1, 5, 1, 2, 3, 4, 0 },
                                  { 1, 0, 2, 5, 4, 6, 3 },
                                  { 1, 1, 1, 2, 3, 2, 3 },
                                  { 4, 1, 2, 3, 5, 0, 3 },
                                  { 6, 5, 1, 5, 4, 2, 6 },
                                  { 4, 2, 5, 6, 1, 1, 5 } };

        int puntosGanador = 0;
        int ganador = 0;
        for (int i = 0; i < matrizPruebas.length; i++) {
            int puntosJugador = 0;
            for (int j = 0; j < matrizPruebas[0].length; j++) {;
                puntosJugador += matrizPruebas[i][j];
            }
            System.out.println("El jugador " + i + " tiene " + puntosJugador + " puntos");
            if (puntosJugador > puntosGanador) {
                puntosGanador = puntosJugador;
                ganador = i;
            }
        }

        System.out.println("El ganador es el jugador " + ganador + " con " + puntosGanador + " puntos");

        int ganador0 = 0;
        int puntos0 = 0;
        for (int i = 0; i < matrizPruebas.length; i++) {
            if (matrizPruebas[i][0] > puntos0) {
                puntos0 = matrizPruebas[i][0];
                ganador0 = i;
            }
        }

        System.out.println("El ganador de la primera prueba es " + ganador0 + " con " + puntos0 + " puntos");
    }

    public static void Ej3(){
        String[] nombres = {"Juan","Maria","Carlos","Laura","Pedro","Ana","Luis","Sofía","Diego","Elena"};
        int tam = nombres.length-1;
        for (int i = 0 ;i< nombres.length;i++){
            System.out.println(nombres[0]);
            for (int j=0;j<tam;j++){
                nombres[j]=nombres[j+1];
            }
            nombres[tam]="";
            tam--;
        }

    }
}