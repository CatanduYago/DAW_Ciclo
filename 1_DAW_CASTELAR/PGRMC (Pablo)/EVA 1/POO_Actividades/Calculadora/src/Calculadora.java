public class Calculadora {
    int resultado;

    public Calculadora() {
        this.resultado = 0;
    }

    public Calculadora(int resultadoInicial) {
        this.resultado = resultadoInicial;
    }

    public int resultado() {
        return this.resultado;
    }

    public void sumar(int n) {
        this.resultado += n;
    }

    public void restar(int n) {
        this.resultado -= n;
    }

    public void multiplicar(int n) {
        this.resultado *= n;
    }

    public void dividir(int n) {
        if (n != 0) {
            this.resultado /= n;
        } else {
            System.out.println("No se puede dividir por 0");
        }
    }

    public void factorial() {
        int factorial = 1;
        for (int i = 1; i <= this.resultado; i++) {
            factorial *= i;
        }
        this.resultado = factorial;
    }

    public void esPrimo() {
        boolean esPrimo = true;
        if (this.resultado < 2) {
            esPrimo = false;
        } else {
            for (int i = 2; i <= Math.sqrt(this.resultado); i++) {
                if (this.resultado % i == 0) {
                    esPrimo = false;
                    break;
                }
            }
        }

        if (esPrimo) {
            System.out.println("El número es primo");
        } else {
            System.out.println("El número no es primo");
        }
    }

    public void inicializar() {
        this.resultado = 0;
    }
}






