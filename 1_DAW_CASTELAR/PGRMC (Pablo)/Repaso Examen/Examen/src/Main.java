/*
Arrays

1. Dada la matrix int[][] resultados = {{10,5,9,2,7,4,0},
                                            {10,0,2,5,4,6,3},
                                            {9,1,10,2,3,2,3},
                                            {4,1,2,8,5,8,3},
                                            {6,5,7,5,4,2,6},
                                            {4,7,5,6,9,9,5}};
- Crea un programa que recupere la puntuacion media de los alumnos y los alumnos que aprobaron en la ultima prueba.

2. Estamos creando una clase Pila usando arrays:

       public class Pila{
           private int [] pila = new int[50];

           public void push (int nuevo){
           //TODO
           }
           public int pop(){
           //Ya implementado
           }
      }

Estructuras de control

1. Se proporciona la clase nOdo para elementos de tipo entero con los siguientes atributos int contenido; Nodo nodoSiguieten;
    La clase cuenta con un contrstuctor parametriuzado con ambos atributos, asi como getters y setter para cada uno de ellos.

    Implementeta para una pclase pila el metodo pop, para una clase pila el metodo peek y para unca clase Cola el metodo add


2. Contamos con las siguientes clases:
    - Clase Empleado con los atributos int numero SS, String DNI, String nombre, String apellidos y String posicion.
    - Clase GestoEmpleado, que contiene un atributo ArrayList <Empleado> empleados y las operaciones CRUD con implementaciones basicas.

Queremos implementar la busqueda binaria por numeroSS para loalizar empledos mas eficientemente. Peo debe cumplirse un requisito, implementa las modificaciones necesarias en
la clase Ej2 para que sea viable la busqueda binraria (No hace falta implementar la busqueda binarai).


Teoria:

Preguntas del tipo cuantas operaciones hacemos con X tipo de busqueda en X tamaño.
Para Busqueda Binaria log en base 2 (a qué numero debe estar elevado 2 para que de ese tamaño)
Para Busqueda Secuencual el mismo numero operaciones que tamaño

Que estructuras consumen mas memoria, las estaticas o las dinamicas?
- Las dinamicas, ya que las estaticas reservan memoria en tiempo de compilacion y las dinamicas en tiempo de ejecucion.

Cuales son los elemtnos de los que se compone una lista doblemente enlazada?
- Nodo, que contiene un puntero al nodo anterior y al siguiente.
- Lista, que contiene un puntero al primer y ultimo nodo.

Describe los pasos que sigue una lista siepmle a la hora de insertar un elemento en laposicion del indice
- Se crea un nuevo nodo con el contenido deseado 
- Se recorre la lista hasta el nodo anterior al indice deseado
- Se cambian los punteros del nodo anterior y el nuevo nodo
- Se cambian los punteros del nuevo nodo y el nodo siguiente al indice deseado

c, b, b, d, a, b, c, a, a, d.

* */


public class Main{
    public static void main(String[] args) {
        int[][] resultados = {{10,5,9,2,7,4,0},
                              {10,0,2,5,4,6,3},
                              {9,1,10,2,3,2,3},
                              {4,1,2,8,5,8,3},
                              {6,5,7,5,4,2,6},
                              {4,7,5,6,9,9,5}};

       double promedio = 0;
       int aprobados =0;

       for (int i = 0; i < resultados.length; i++) {
           double suma = 0;
           for (int j = 0; j < resultados.length; j++) {
               suma += resultados [i][j];
               }
           double promedios= suma /resultados [i].length;
           promedio += promedios;
           if(resultados[i][resultados[i].length-1]>= 5) {
               aprobados++;
           }
       }
        promedio /= resultados.length;

        System.out.println("El promedio general es de " + Math.round(promedio));
        System.out.println("El numero de aprobados es de " +aprobados);
    }


}
