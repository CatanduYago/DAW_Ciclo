public class repartidor extends empleado {
    private int zona;

    public repartidor(String nombre, int edad, int salario, int zona) {
        super(nombre, edad, salario);
        this.zona = zona;
    }

    public int getZona() {
        return zona;
    }

    public void setZona(int zona) {
        this.zona = zona;
    }

    public void aplicarPlus() {
        if (getEdad() < 25 && zona == 3) {
            setSalario(getSalario() + getPLUS());
        }
    }
    @Override
    public String toString() {
        return super.toString()+ "\nZona: " + getZona() + "\n";
    }
}

