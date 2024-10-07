import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class jugador {
    private String DNI;
    private String nombre;
    private String apellidos;
    private String posicion;
    private String fechaNacimiento;

    public jugador(String DNI, String nombre, String apellidos, String posicion, String fechaNacimiento) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.posicion = posicion;
        this.fechaNacimiento = fechaNacimiento;
    }
    public String getDNI(){
        return DNI;
    }
    public void setDNI(String DNI){
        this.DNI = DNI;
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

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int calcularEdad() {
        return 0;
    }
   
    @Override
    public String toString() {
        return "jugador{" +
                "nombre='" + nombre + '\'' +
                ", apellidos='" + apellidos + '\'' +
                ", posicion='" + posicion + '\'' +
                ", fechaNacimiento='" + fechaNacimiento + '\'' +
                "}\n";
    }}

