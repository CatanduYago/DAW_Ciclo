
public class perro extends Animal {

    private String tamaño;
    private String raza;
    private String energia;
    private String pelaje;

    public perro(String nombre, String tipo_alimentacion, int edad, String tamaño, String raza, String energia,
            String pelaje) {
        super(nombre, tipo_alimentacion, edad);
        this.tamaño = tamaño;
        this.raza = raza;
        this.energia = energia;
        this.pelaje = pelaje;
    }

    public String getTamaño() {
        return tamaño;
    }

    public void setTamaño(String tamaño) {
        this.tamaño = tamaño;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getEnergia() {
        return energia;
    }

    public void setEnergia(String energia) {
        this.energia = energia;
    }

    public String getPelaje() {
        return pelaje;
    }

    public void setPelaje(String pelaje) {
        this.pelaje = pelaje;
    }
    public String toString() {
        return super.toString() + "\nTamaño: " + getTamaño() + "\nRaza: " + getRaza() + "\nEnergia: " + getEnergia() + "\nPelaje: " + getPelaje() + "\n";}
}