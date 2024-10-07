public class empleado {

    private String nombre;
    private int edad, salario;
    private final int PLUS = 100;

    public empleado(String nombre, int edad, int salario) {
        this.nombre = nombre;
        this.edad = edad;
        this.salario = salario;

    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }

    public int getPLUS() {
        return PLUS;
    }

    
    @Override
    public String toString() {
        return "Nombre: " + nombre + "\nEdad: " + edad + "\nSalario: " + salario;
    }
}
