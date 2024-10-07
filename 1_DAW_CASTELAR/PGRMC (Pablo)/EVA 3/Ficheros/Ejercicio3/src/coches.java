
public class coches {
    public String marca;
    public String modelo;
    public int año;
    public String color;
    public int precio;


    public coches(String marca, String modelo, int año, String color, int precio) {
        this.marca = marca;
        this.modelo = modelo;
        this.año = año;
        this.color = color;
        this.precio = precio;
    }


    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }
    public String getColor(){
        return color;
    }
    public void setColor(String color){
        this.color = color;
    }
    public int getPrecio(){
        return precio;
    }
    public void setPrecio(int precio){
        this.precio = precio;
    }
}   
