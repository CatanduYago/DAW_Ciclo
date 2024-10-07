public class Contador {
    private String nombre;
    private int valor;

    public Contador(String nombre) {
        this.nombre = nombre;
        this.valor = 0;
    }

    public void incrementar() {
        if (valor < 100) {
            valor++;
        } else {
            System.out.println("El maximo es 100");
        }
    }

    public void decrementar() {
        if (valor > 0) {
            valor--;
        } else {
            System.out.println("El minimo debe ser 0");
        }
    }

    public void mostrar() {
        System.out.println("Contador: " + nombre + ", Valor: " + valor);
    }

    public static void main(String[] args) {
        Contador contador1 = new Contador("Contador1");
        Contador contador2 = new Contador("Contador2");

        contador1.incrementar();
        contador1.incrementar();
        contador1.incrementar();

        contador2.incrementar();
        contador2.decrementar();

        contador1.mostrar();
        contador2.mostrar();
    }
}
