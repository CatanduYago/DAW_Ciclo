public class Cuenta {
    private String nombre;
    private String apellido1;
    private String apellido2;
    private int edad;
    private int genero;
    private double peso;
    private double altura;

    public Cuenta(String nombre, String apellido1, String apellido2) {
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
    }

    public Cuenta(String nombre, String apellido1, String apellido2, int genero) {
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.genero = genero;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public int getGenero() {
        return genero;
    }

    public void setGenero(int genero) {
        this.genero = genero;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    private double calcularIMC() {
        if (altura <= 0) {
            return 0; 
        }
        return peso / (altura * altura);
    }

    public boolean isMayordeedad() {
        return edad > 18;
    }

    public boolean isSobrepeso() {
        double imc = calcularIMC();
        return imc > 20;
    }
    public class Main {
        public static void main(String[] args) {
            Cuenta mayorDeEdad = new Cuenta("Yago", "Catalano", "Andújar");
            mayorDeEdad.setEdad(19);
            mayorDeEdad.setPeso(61.9);
            mayorDeEdad.setAltura(1.71);
    
            Cuenta menorDeEdad = new Cuenta("María", "Gómez", "Martínez");
            menorDeEdad.setEdad(15);
            menorDeEdad.setPeso(55.0);
            menorDeEdad.setAltura(1.60);
    
            Cuenta conSobrepeso = new Cuenta("Carlos", "Sánchez", "Rodríguez");
            conSobrepeso.setEdad(30);
            conSobrepeso.setPeso(85.0);
            conSobrepeso.setAltura(1.70);
    
            Cuenta menosPeso = new Cuenta("Luis", "Fernández", "García");
            menosPeso.setEdad(22);
            menosPeso.setPeso(45.0);
            menosPeso.setAltura(1.80);
    
            System.out.println(mayorDeEdad.getNombre() + " es mayor de edad: " + mayorDeEdad.isMayordeedad());
            System.out.println(menorDeEdad.getNombre() + " es mayor de edad: " + menorDeEdad.isMayordeedad());
    
            System.out.println(conSobrepeso.getNombre() + " tiene sobrepeso: " + conSobrepeso.isSobrepeso());
            System.out.println(menosPeso.getNombre() + " tiene sobrepeso: " + menosPeso.isSobrepeso());
        }
    }
}

