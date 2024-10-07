public class libro extends Biblioteca implements prestable {

    private boolean prestado = false;

    public libro(String identificador, String titulo, int año, boolean prestado) {
        super(identificador, titulo, año);
        this.prestado = prestado;
    }

    public boolean getPrestado() {
        return prestado;
    }

    public void setPrestado(boolean prestado) {
        this.prestado = prestado;
    }

    @Override
    public String toString() {
        return super.toString() + "prestado: " + prestado + "\n";
    }

    public void prestar() {
        if (!prestado) {
            prestado = true;
            System.out.println("\nEl libro ha sido prestado");
        } else {
            System.out.println("\nEl libro ya esta prestado");
        }
    }
    public boolean prestado() {
        if (prestado = true) {
            System.out.println("\nEl libro esta prestado");
        } else {
            System.out.println("\nEl libro no esta prestado");
        }
        return prestado;
    }

    public void devolver() {
        if (prestado = true) {
            prestado = false;
            System.out.println("\nEl libro ha sido devuelto");
        } else {
            System.out.println("\nEl libro no esta prestado");
        }
    }
}
    