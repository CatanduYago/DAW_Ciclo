import java.util.Scanner;

public class App {

    public static void multiplo() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Escriba el primer numero: ");
        float x = sc.nextInt();
        System.out.println("Escriba el segundo numero: ");
        float y = sc.nextInt();
        if (EsMultiplo(x, y) == 0)
            System.out.println("El número " + x + " es multiplo de " + y);
        else
            System.out.println("El número " + x + " no es multiplo de " + y);

    }

    public static float EsMultiplo(float x, float y) {
        return (x % y);

    }

    public static void TempMedia() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Cuantas medias quieres calcular");
        int calculosTotales = sc.nextInt();
        for (int i = 0; i < calculosTotales; i++) {
            System.out.println("Dame una temperatura máxima");
            float tempMax = sc.nextInt();
            System.out.println("Dame una temperatura mínima");
            float tempMin = sc.nextInt();
            System.out.println(
                    "En el día " + i + " tenemos una temperatura media de: " + calcularMedia(tempMax, tempMin));
        }
    }

    public static float calcularMedia(float temperaturaMin, float temperaturaMax) {
        return (temperaturaMax + temperaturaMin) / 2;
    }

    public static void espaciado() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un texto: ");
        String entrada = scanner.nextLine();
        String resultado = espaciado(entrada);

        System.out.println("" + resultado);
    }

    public static String espaciado(String texto) {
        String resultado="";
        for (int i = 0; i < texto.length(); i++) {

            resultado= texto.charAt(i) + "";
        }
        return resultado;
    }

    public static double calcularArea(double radio) {
        return Math.PI * Math.pow(radio, 2);
    }

    public static double calcularPerimetro(double radio) {
        return 2 * Math.PI * radio;
    }

    public static void areayperimetro() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingresa el radio de la circunferencia: ");
        double radio = scanner.nextDouble();

        double area = calcularArea(radio);
        double perimetro = calcularPerimetro(radio);

        System.out.println("El área de la circunferencia es: " + Math.round(area));
        System.out.println("El perímetro de la circunferencia es: " + Math.round(perimetro));
    }

    static int intentos = 0;

        public static boolean Login(String usuario, String contraseña) {
        
            if (usuario.equals("usuario1") && contraseña.equals("asdasd")) {
                return true;
            } else {
                intentos++;
                return false;
            }
        }

        public static void loginAp() {
            Scanner scanner = new Scanner(System.in);

            for (int i = 0; i < 3; i++) {
                System.out.print("Nombre de usuario: ");
                String usuario = scanner.nextLine();
                System.out.print("Contraseña: ");
                String contraseña = scanner.nextLine();

                if (Login(usuario, contraseña)) {
                    System.out.println("Inicio de sesión correcto");
                    break;
                } else {
                    System.out.println(
                            "Nombre de usuario o contraseña incorrectos. Intentos restantes: " + (3 - intentos));
                }
            }

            if (intentos == 3) {
                System.out.println("Se han agotado los intentos. Se ha cerrado sesión");
            }
        }

            public static int calcularMCD(int num1, int num2) {
                while (num2 != 0) {
                    int temp = num2;
                    num2 = num1 % num2;
                    num1 = temp;
                }
                return num1;
            }
        
            public static void mcd() {
                try {
                    
                    Scanner sc = new Scanner(System.in);
        
                    System.out.print("Ingresa un número entero: ");
                    int numero1 = sc.nextInt();
                    System.out.print("Ingrese otro número entero: ");
                    int numero2 = sc.nextInt();
                    
                    if (numero1 < 0 || numero2 < 0) {
                        System.out.println("Los números deben ser enteros");
                    } else {
                        int mcd = calcularMCD(numero1, numero2);
                        System.out.println("El MCD de " + numero1 + " y " + numero2 + " es: " + mcd);
                    }
                    
                    sc.close();
                } catch (java.util.InputMismatchException e) {
                    System.out.println("Debes ingresar números enteros válidos");
                }
            }
        

            public static void tiempo() {
                Scanner scanner = new Scanner(System.in);
                
                while (true) {
                    System.out.println("Elija una opción:");
                    System.out.println("1. Convertir a segundos");
                    System.out.println("2. Convertir a horas, minutos y segundos");
                    System.out.println("3. Salir del programa");
                    
                    int opcion = scanner.nextInt();
                    
                    switch (opcion) {
                        case 1:
                            System.out.println("Introduzca las horas, minutos y segundos:");
                            int horas = scanner.nextInt();
                            int minutos = scanner.nextInt();
                            int segundos = scanner.nextInt();
                            int totalSegundos = tiempoASegundos(horas, minutos, segundos);
                            System.out.println("El tiempo en segundos es: " + totalSegundos + " segundos");
                            break;
                        case 2:
                            System.out.println("Cantidad de segundos:");
                            int tiempoEnSegundos = scanner.nextInt();
                            int[] resultado = segundosATiempo(tiempoEnSegundos);
                            System.out.println("El tiempo es: " + resultado[0] + " horas, " + resultado[1] + " minutos y " + resultado[2] + " segundos");
                            break;
                        case 3:
                            System.out.println("Saliendo del programa");
                            scanner.close();
                            System.exit(0);
                            break;
                        default:
                            System.out.println("Opción no válida. Por favor, elija una opción válida");
                    }
                }
            }
            
            public static int tiempoASegundos(int horas, int minutos, int segundos) {
                return horas * 3600 + minutos * 60 + segundos;
            }
            
            public static int[] segundosATiempo(int totalSegundos) {
                int horas = totalSegundos / 3600;
                int minutos = (totalSegundos % 3600) / 60;
                int segundos = totalSegundos % 60;
                int[] resultado = {horas, minutos, segundos};
                return resultado;
            }
        
        

    public static void main(String[] args) throws Exception {

        int opcion;
        Scanner sc = new Scanner(System.in);
        {
            opcion = 0;
            boolean salir = false;

            while (!salir) {
                System.out.println("\n1. ¿Es multiplo? " + "\n2. Media de temperaturas " + "\n3. Espaciado "
                        + "\n4. Area y Perimetro de una circunferencia"
                        + "\n5. Login " + "\n6. MCD de dós números " + "\n7. Conversor de tiempo" + "\n8. Salir");

                try {
                    System.out.print("Ingrese una opcion: \n");
                    opcion = sc.nextInt();

                    switch (opcion) {
                        case 1:
                            multiplo();
                            break;
                        case 2:
                            TempMedia();
                            break;
                        case 3:
                            espaciado();
                            break;
                        case 4:
                            areayperimetro();
                            break;
                        case 5:
                            loginAp();
                            break;
                        case 6:
                            mcd();
                            break;
                        case 7:
                        tiempo();
                            break;
                        default:
                            System.out.println("Opcion incorrecta, solo numeros entre 1 y 7");
                            salir = false;
                            break;
                    }
                    break;

                }

                catch (Exception e) {
                    System.out.println("Error: " + e.getMessage());

                }
                while (salir = false)
                    ;
            }
     

   } }
}
