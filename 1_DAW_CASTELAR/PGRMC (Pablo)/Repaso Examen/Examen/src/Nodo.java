/*
 1. Se proporciona la clase nOdo para elementos de tipo entero con los siguientes atributos int contenido; Nodo nodoSiguieten;
    La clase cuenta con un contrstuctor parametriuzado con ambos atributos, asi como getters y setter para cada uno de ellos.

    Implementeta para una pclase pila el metodo pop, para una clase pila el metodo peek y para unca clase Cola el metodo add

*/
public class Nodo {
    int contenido;
    Nodo nodoSiguiente;

    public Nodo(int contenido) {
        this.contenido = contenido;
        this.nodoSiguiente = nodoSiguiente;
    }
    public int getContenido(){
        return contenido;
    }
    public void setContenido(int contenido){
        this.contenido = contenido;
    }
    public Nodo getNodoSiguiente(){
        return nodoSiguiente;
    }
    public void setNodoSiguiente(Nodo nodoSiguiente){
        this.nodoSiguiente = nodoSiguiente;
    }

}

