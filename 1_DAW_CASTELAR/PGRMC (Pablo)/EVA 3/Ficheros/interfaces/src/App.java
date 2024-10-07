public class App {
    public static void main(String[] args) throws Exception {
        libro libro = new libro("1", "El Quijote", 1605, false);
        revista revista = new revista("3", "El nano | Marca", 2021, 33);

        System.out.println(libro.toString());
        System.out.println(revista.toString());

        libro.prestar();
        System.out.println("Prestar");


        libro.prestado();
        System.out.println("Prestado");

        libro.devolver();
        System.out.println("Devolver");

    }
}
