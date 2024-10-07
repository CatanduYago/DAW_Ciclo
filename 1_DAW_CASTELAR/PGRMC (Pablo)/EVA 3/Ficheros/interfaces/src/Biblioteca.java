public class Biblioteca {
    private String identificador;
    private String titulo;
    private int año;

    public Biblioteca(String identificador, String titulo, int año) {
        this.identificador = identificador;
        this.titulo = titulo;
        this.año = año;
    }

    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    @Override
    public String toString() {
        return "Identificador: " + getIdentificador() + "\nTitulo: " + getTitulo() + "\nAño: " + getAño() + "\n";
    }
}
