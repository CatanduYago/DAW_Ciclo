public class detergente implements conDescuento, esLiquido {
    private String marca;
    private double precio;

    public detergente(String marca, double precio) {
        this.marca = marca;
        this.precio = precio;
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

    @Override

    public void setDescuento(double des) {
        des = 4;
    }

    public double getDescuento() {
        int descuento = setDescuento(des)/100;
        return getDescuento();
    }

    public double getPrecioDescuento() {
        precio -= (precio * (getDescuento() / 100));
        return precio;
    }

    public void setVolumen(double v) {

    }

    public double getVolumen() {
        return precio;

    }

    public void setTipoEnvase(String env) {

    }

    public String getTipoEnvase() {
        return marca;

    }

    public String toString() {
        return "\ndetergente \nmarca: " + marca + "\nPrecio: " + precio + "\n";
    }
}
