public class revista extends Biblioteca {

    private int edicion;

    public revista(String identificador, String titulo, int año, int edicion) {
        super(identificador, titulo, año);
        this.edicion = edicion;
    }

    public int getEdicion() {
        return edicion;
    }

    public void setEdicion(int edicion) {
        this.edicion = edicion;
    }

    @Override
    public String toString() {
        return super.toString() + "edicion: " + edicion + "\n";
    }

}
