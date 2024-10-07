import java.util.Scanner;

public class JuegoDeLaVida {
    private static int rows;
    private static int cols;
    private boolean[][] grid;
    private boolean[][] generacion;

    public JuegoDeLaVida(int rows, int cols) {

        this.rows = rows;
        this.cols = cols;
        this.grid = new boolean[rows][cols];
        this.generacion = new boolean[rows][cols];
    }

    public void random() {
        Scanner sc = new Scanner(System.in);
        System.out
                .println("Escribe la densidad de celulas vivas siendo 0 ninguna y 1 todas siguiendo el formato '0,X'");
        Double densidad = sc.nextDouble();
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                grid[i][j] = Math.random() < densidad; // Este numerin es el que elige la cantidad de casillas vivas
                                                       // contra las muertas iniciales
            }
        }
    }

    public void generacion() {
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                int vivos = countvivos(i, j);

                if (grid[i][j]) {

                    if (vivos < 2 || vivos > 3) {
                        generacion[i][j] = false;
                    } else {
                        generacion[i][j] = true;
                    }
                } else {

                    if (vivos == 3) {
                        generacion[i][j] = true;
                    } else {
                        generacion[i][j] = false;
                    }
                }
            }
        }
        for (int i = 0; i < rows; i++) {
            System.arraycopy(generacion[i], 0, grid[i], 0, cols);
        }

    }

    public int countvivos(int row, int col) {
        int contador = 0;
        for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {
                if (i == 0 && j == 0) {
                    continue;
                }

                int rowsvivos = row + i;
                int colsvivos = col + j;

                if (rowsvivos >= 0 && rowsvivos < rows && colsvivos >= 0 && colsvivos < cols) {
                    if (grid[rowsvivos][colsvivos]) {
                        contador++;
                    }
                }
            }
        }
        return contador;
    }

    public void matriz() {
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (grid[i][j]) {
                    System.out.print("█");
                } else {
                    System.out.print("░");
                }
            }
            System.out.println();
        }
        System.out.println();

    }

    public static int[][] generacino(int patron[][]) {
        int height = 10, width = 10;
        int[][] future = new int[height][width];
    
        for (int x = 0; x < height; x++) {
            for (int y = 0; y < width; y++) {
                int countvivos = 0;
                int encima = Math.max(x -1, 0); 
                int debajo = Math.min(x + 1, height - 1); 
                int izq = Math.max(y -1, 0); 
                int dere = Math.min(y + 1, width - 1); 
                for (int comprobar = encima; comprobar <= debajo; comprobar++)
                    for (int comprobar2 = izq; comprobar2 <= dere; comprobar2++)
                        countvivos += patron[comprobar][comprobar2];
    
                countvivos -= patron[x][y];
    
                if (countvivos == 3)
                    future[x][y] = 1;
                else if (countvivos < 2)
                    future[x][y] = 0;
                else if (countvivos >= 4)
                    future[x][y] = 0;
                else if (countvivos == 2)
                    future[x][y] = patron[x][y];
            }
        }
        return future;
    }
    

    public static void arbol() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Escribe el numero de generaciones deseadas");
        int generaciones = sc.nextInt();

        for (int generacion = 1; generacion <= generaciones; generacion++) {
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.print("\033[H\033[2J");
            System.out.println("Generacion: " + generacion);
            int[][] game =
                {{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 1, 0, 0, 0, 1, 0, 0, 0, 0},
                 {1, 1, 0, 0, 1, 1, 1, 0, 0, 0},
                 {0, 1, 0, 1, 1, 1, 1, 1, 0, 0},
                 {0, 1, 0, 0, 0, 1, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 1, 0, 0, 0, 0}
                };
            
        var nueva = generacino(game);
            
        for(var row : nueva)
        {
            for(var vida : row)
            {
                System.out.print(vida);
            }
            System.out.println();
        }
    }

        

    }

       public static void nave() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Escribe el numero de generaciones deseadas");
        int generaciones = sc.nextInt();

        for (int generacion = 1; generacion <= generaciones; generacion++) {
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.print("\033[H\033[2J");
            System.out.println("Generacion: " + generacion);
            int[][] game =
                {{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
                };
    
        var nueva = generacino(game);
    
        for(var row : nueva)
        {
            for(var vida : row)
            {
                System.out.print(vida);
            }
            System.out.println();
        }
    }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("¿Qué quieres hacer? \n1. Cargar un patron \n2. Crear un patron aleatorio basado en densidad");
        int opcion = sc.nextInt();
        if (opcion == 2) {
            System.out.println("Escribe el alto");
            int rows = sc.nextInt();
            System.out.println("Escribe el ancho");
            int cols = sc.nextInt();
            System.out.println("Escribe el numero de generaciones deseadas");
            int generaciones = sc.nextInt();
            JuegoDeLaVida game = new JuegoDeLaVida(rows, cols);
            game.random();

            for (int generacion = 1; generacion <= generaciones; generacion++) { // Aquie esta el numero de generaciones
                                                                                 // que se desean
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.print("\033[H\033[2J");
                System.out.println("Generacion: " + generacion);
                game.matriz();
                game.generacion();

            }

        } else {
            System.out.println(
                    "Has elegido cargar un patron. Elige entre los siguientes escribiendo el número correspondiente:\n1.Arbol de minecraft \n2.Nave espacial \n3.Salir");
            int opcion2 = sc.nextInt();
            switch (opcion2) {
                case 1:
                    arbol();
                    break;
                case 2:
                    nave();
                    break;

                default:
                    break;
            }
        }

    }
}