import java.time.LocalDate;

public class App {
    private int numero;
    private char letra;
    private String nombre;
    private String apellidos;
    private int añoNacimiento;
    private int edad;

  
    public DNI() {
        this.edad=
    }

   
    public DNI(int numero, String nombre, String apellidos, int añoNacimiento) {
        setNumero(numero);
        this.nombre = nombre;
        this.apellidos = apellidos;
        int AñoNacimiento=añoNacimiento;
    }

    
    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        if (numero >= 0 && numero <= 99999999) {
            this.numero = numero;
            calcularLetra();
        }
    }
    


    private void calcularLetra() {
    }


    public int getAñoNacimiento() {
        return añoNacimiento;
    }
}

   