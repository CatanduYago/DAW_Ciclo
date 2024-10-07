public class jugador {

    public String nombre;
    public String apellidos;
    public String posicion;

    public jugador(String nombre, String apellidos, String posicion) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.posicion = posicion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPoiscion(String posicion) {
        this.posicion = posicion;
    }

    @Override
    public String toString() {
        return nombre + " " + apellidos + " " + posicion;
    }

}