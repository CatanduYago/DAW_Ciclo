public class comercial extends empleado {
    private double comision;

    public comercial(String nombre, int edad, int salario,  double comision) {
        super(nombre, edad, salario);
        this.comision = comision;
    }

    public double getComision() {
        return comision;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    public void aplicarPlus() {
        if (getEdad() > 30 && comision > 200) {
            setSalario(getSalario() + getPLUS());
        }
    }
    @Override
    public String toString() {
        return super.toString()+ "\nComision: " + getComision() + "\n";
    }
}
