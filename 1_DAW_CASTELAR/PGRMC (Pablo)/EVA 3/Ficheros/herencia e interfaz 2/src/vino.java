import java.time.LocalDate;

public class vino implements esLiquido, conDescuento, esAlimento {

    private String marca;
    private String tipoVino;
    private double gradoalcohol;
    private double precio;

    public vino(String marca, String tipoVino, double gradoalcohol, double precio) {
        this.marca = marca;
        this.tipoVino = tipoVino;
        this.gradoalcohol = gradoalcohol;
        this.precio = precio;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getTipoVino() {
        return tipoVino;
    }

    public void setTipoVino(String tipoVino) {
        this.tipoVino = tipoVino;
    }

    public double getGradoAlcohol() {
        return gradoalcohol;
    }

    public void setGradoAlcohol(double gradoalcohol) {
        this.gradoalcohol = gradoalcohol;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public void setVolumen(double v) {

    }

    public double getVolumen() {
        return 1;

    }

    public void setTipoEnvase(String env) {

    }

    public String getTipoEnvase() {
        return null;

    }

    public void setCaducidad(LocalDate fc) {

    }

    public LocalDate getCaducidad() {
        return LocalDate.now().plusDays(23);
    }

    public int getCalorias() {
        return (int) (gradoalcohol * 10);
    }

    public void setDescuento(double des) {
    }

    public double getDescuento() {
        return getDescuento();
    }

    public double getPrecioDescuento() {
        precio -= (precio * (getDescuento() / 100));
        return precio;
    }
    public String toString() {
        return "\nVino:" + "\nmarca: " + marca + "\nTipo Vino: " + tipoVino + "\n Grado alcohol: " + gradoalcohol + "\nPrecio: "
                + precio + '\n';
    }
}
