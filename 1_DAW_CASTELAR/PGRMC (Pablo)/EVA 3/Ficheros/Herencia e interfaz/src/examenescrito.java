public class examenescrito extends examen {

    public static boolean aprobar;
    private int duracion;
    private int nota;

    public examenescrito(boolean aprobar,String fechaRealizacion, int duracion, int nota) {
        super(fechaRealizacion);
        this.duracion = duracion;
        this.nota = nota;
        this.aprobar=aprobar;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public void aprobar() {
        if (nota< 6 || duracion > 90) {
        aprobar = false;
        } else {
            aprobar = true;
        }
    }
}
