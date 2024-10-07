public class examen {
    private String fechaRealizacion;
    public static boolean aprobado;

    public examen(String fechaRealizacion) {
        this.fechaRealizacion = fechaRealizacion;
    }

    public String getfechaRealizacion() {
        return fechaRealizacion;
    }

    public void setfechaRealizacion(String fechaRealizacion) {
        this.fechaRealizacion = fechaRealizacion;
    }

    public void aprobar() {
        if (examenescrito.aprobar == true && examenoral.aprobar == true) {
            aprobado = true;
        } else {
            aprobado = false;
        }
    }
}
