
import java.util.Scanner;

class Cuenta {
    private int identificador;
    private double saldo;

    public Cuenta(int identificador) {
        this.identificador = identificador;
        this.saldo = 0;
    }

    public Cuenta(int identificador, double saldoInicial) {
        this.identificador = identificador;
        this.saldo = saldoInicial;
    }

    public double getSaldo() {
        return saldo;
    }

    public int getIdentificador() {
        return identificador;
    }

    public double ingresar(double importe) {
        saldo += importe;
        return saldo;
    }

    public double retirar(double importe) {
        saldo -= importe;
        return saldo;
    }

    public boolean isMorosa() {
        return saldo < 0;
    }

    public double saldoTotal(double saldo) {
        saldo += saldo;
        return saldo;
    }

    public class App {
        public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);
            Cuenta cuenta = null;
            int contador = 0;

            while (true) {
                String comando = scanner.nextLine();

                if (comando.equals("FIN")) {
                    break;
                } else if (comando.equals("crear")) {
                    int identificador = Integer.parseInt(scanner.nextLine());
                    cuenta = new Cuenta(identificador);
                    System.out.printf("\n", cuenta.getSaldo());
                    contador++;

                } else if (comando.equals("crearsaldo")) {
                    int identificador = Integer.parseInt(scanner.nextLine());
                    double saldoInicial = Double.parseDouble(scanner.nextLine());
                    cuenta = new Cuenta(identificador, saldoInicial);
                    System.out.printf("\n", cuenta.getSaldo());

                } else if (comando.equals("ingresar")) {
                    double importe = Double.parseDouble(scanner.nextLine());
                    cuenta.ingresar(importe);
                    System.out.printf("\n", cuenta.getSaldo());
                } else if (comando.equals("retirar")) {
                    double importe = Double.parseDouble(scanner.nextLine());
                    cuenta.retirar(importe);
                    System.out.printf("\n", cuenta.getSaldo());
                } else if (comando.equals("morosa?")) {
                    if (cuenta.isMorosa()) {
                        System.out.println("Sí");
                    } else {
                        System.out.println("No");

                    }
                }
            }
        }
    }
}
