
public class Gato {
    private String nombre;
    private int edad;
    private String raza;

    public Gato() {
        this.nombre = "";
        this.edad = 0;
        this.raza = "";
    }

    public Gato(String nombre, int edad, String raza) {
        this.nombre = nombre;

        if (edad > 0) {
            this.edad = edad;
        } else {
            this.edad = 0;
        }

        this.raza = raza;
    }

    public String getNombre() {
        return this.nombre;
    }

    public int getEdad() {
        return this.edad;
    }

    public String getRaza() {
        return this.raza;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String maullar() {
        return this.nombre + ": miau";
    }

    public static boolean gatoMayor(Gato gato1, Gato gato2) {
        return gato1.getEdad() > gato2.getEdad();
    }
}
