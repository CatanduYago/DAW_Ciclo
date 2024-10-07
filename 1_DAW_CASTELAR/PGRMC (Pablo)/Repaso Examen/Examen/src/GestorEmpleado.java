import java.util.ArrayList;
import java.util.Comparator;
/*
2. Contamos con las siguientes clases:
        - Clase Empleado con los atributos int numero SS, String DNI, String nombre, String apellidos y String posicion.
    - Clase GestoEmpleado, que contiene un atributo ArrayList <Empleado> empleados y las operaciones CRUD con implementaciones basicas.

Queremos implementar la busqueda binaria por numeroSS para loalizar empledos mas eficientemente. Peo debe cumplirse un requisito, implementa las modificaciones necesarias en
la clase Ej2 para que sea viable la busqueda binraria (No hace falta implementar la busqueda binarai).

        * */
public class GestorEmpleado {
    private ArrayList<Empleado> empleados;

    public GestorEmpleado() {
        this.empleados = new ArrayList<>();
    }


    private void ordenarPorNumeroSS() {
        empleados.sort(Comparator.comparingInt(Empleado::getNumeroSS));
    }
}

