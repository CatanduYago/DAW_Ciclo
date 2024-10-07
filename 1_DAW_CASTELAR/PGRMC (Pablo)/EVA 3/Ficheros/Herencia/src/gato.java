public class gato extends Animal {
    private String pelaje;
    private String longitud;
    private String independencia;

    public gato(String nombre, String tipo_alimentacion, int edad, String pelaje, String longitud,
            String independencia) {
        super(nombre, tipo_alimentacion, edad);
        this.pelaje = pelaje;
        this.longitud = longitud;
        this.independencia = independencia;
    }

    public String getPelaje() {
        return pelaje;
    }

    public void setPelaje(String pelaje) {
        this.pelaje = pelaje;
    }

    public String getlongitud() {
        return longitud;
    }

    public void setlongitud(String longitud) {
        this.longitud = longitud;
    }

    public String getindependencia() {
        return independencia;
    }

    public void setindependencia(String independencia) {
        this.independencia = independencia;
    }
    @Override
    public String toString() {
        return super.toString()+ "\nPelaje: " + getPelaje() + "\nLongitud: " + getlongitud() + "\nIndependencia: " + getindependencia()+"\n";
    }
}
