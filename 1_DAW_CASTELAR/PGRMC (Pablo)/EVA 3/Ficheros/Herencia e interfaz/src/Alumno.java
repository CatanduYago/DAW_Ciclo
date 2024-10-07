public class Alumno {
    private String DNI;
    private String apellido;
    private String nombre;
    private int examenes;

    public Alumno(String DNI, String apellido, String nombre, int examenes) {
        this.DNI = DNI;
        this.apellido = apellido;
        this.nombre = nombre;
        this.examenes = examenes;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getExamenes() {
        return examenes;
    }

    public void setExamenes(int examenes) {
        this.examenes = examenes;
    }

    public static int cantAprobados() {
        int aprobados = 0;
        if (examen.aprobado == true) {
            aprobados++;
        }
        System.out.println("El numero de alumnos aprobados es: " + aprobados);
        return aprobados;
        
    }
}
