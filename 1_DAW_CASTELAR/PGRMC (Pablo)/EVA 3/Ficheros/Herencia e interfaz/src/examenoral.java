public class examenoral extends examen {

    public static boolean aprobar;
    private String satisfaccion;

    public examenoral(String fechaRealizacion, String satisfaccion, boolean aprobar) {
        super(fechaRealizacion);
        this.satisfaccion = satisfaccion;
        this.aprobar=aprobar;

    }

    public String getSatisfaccion() {
        return satisfaccion;
    }

    public void setSatisfaccion(String satisfaccion) {
        this.satisfaccion = satisfaccion;

    }
    public void aprobar(){
        if(satisfaccion == "insuficiente"){
             aprobar = false;
        }
        else if (satisfaccion == "suficiente" || satisfaccion == "excelente") {
             aprobar = true;
            
        }
    }

}
