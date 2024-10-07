public class Cola {
    private Nodo inicio;
    private Nodo fin;

    public Cola() {
        this.inicio = null;
        this.fin = null;
    }

    public void add(int contenido) {
        Nodo nuevoNodo = new Nodo(contenido);
        if (inicio == null) {
            inicio = nuevoNodo;
            fin = nuevoNodo;
        } else {
            fin.setNodoSiguiente(nuevoNodo);
            fin = nuevoNodo;
        }
    }
}