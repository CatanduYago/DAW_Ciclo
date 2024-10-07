import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner (System.in);
        Calculadora calculadora = new Calculadora();

            System.out.println(calculadora.resultado());
            String operador = sc.next();

            switch (operador) {
                case "+":
                    int numSuma = sc.nextInt();
                    calculadora.sumar(numSuma);
                    break;
                case "-":
                    int numResta = sc.nextInt();
                    calculadora.restar(numResta);
                    break;
                case "*":
                    int numMultiplicacion = sc.nextInt();
                    calculadora.multiplicar(numMultiplicacion);
                    break;
                case "/":
                    int numDivision = sc.nextInt();
                    calculadora.dividir(numDivision);
                    break;
                case "factorial":
                    calculadora.factorial();
                    break;
                case "primo":
                    calculadora.esPrimo();
                    break;
                case "CE":
                    calculadora.inicializar();
                    break;
                case "FIN":
                    System.out.println("Programa terminado");
                    System.exit(0);
                    break;
                default:
                break;
            }
            sc.close();
        }
    }
