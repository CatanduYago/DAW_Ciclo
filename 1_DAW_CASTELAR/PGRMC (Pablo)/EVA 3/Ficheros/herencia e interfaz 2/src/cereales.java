import java.time.LocalDate;

public class cereales implements esAlimento {
    private String marca;
    private double precio;
    private tipoCereal tipoCereal;

    public cereales(String marca, double precio, tipoCereal tipo) {
        this.marca = marca;
        this.precio = precio;
        this.tipoCereal = tipo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public tipoCereal getTipo() {
        return tipoCereal;
    }

    public void setTipo(tipoCereal tipo) {
        this.tipoCereal = tipo;
    }

    @Override
    public void setCaducidad(LocalDate fc) {

    }

    public LocalDate getCaducidad() {
        return LocalDate.now();

    }

    public int getCalorias() {
        return 0;

    }

    public String toString() {
        return "\ncereales \n marca: " + marca + "\nPrecio: " + precio + "\nTipo Cereal " + tipoCereal + "\n";
    }
}
