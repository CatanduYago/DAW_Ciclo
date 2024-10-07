public class caballo extends Animal {
    private String altura;
    private String velocidad;
    private String relinchar = "hiii";

    public caballo(String nombre, String tipo_alimentacion, int edad, String altura, String velocidad) {
        super(nombre, tipo_alimentacion, edad);
        this.altura = altura;
        this.velocidad = velocidad;
    }

    public String getaltura() {
        return altura;
    }
    public void setaltura(String altura) {
        this.altura = altura;
    }
    public String getVelocidad(){
        return velocidad;
    }
    public void setvelocidad(String velocidad){
        this.velocidad = velocidad;
    }
    public String getRelinche(){
        return relinchar;
    }
    public String toString() {
        return super.toString() + "\nAltura: " + getaltura() + "\nVelocidad: " + getVelocidad() + "\n" ;
    }
}