public class App {
 
    public static void main(String[] args) throws Exception {
        perro perro = new perro("Laika", "Pienso compy", 10, "Mediano", "Breton", "Alta", "Corto");
        gato gato = new gato("Gines", "Pienso compy", 2, "Corto", "Mediano", "Alta");
        caballo caballo = new caballo("Vicente", "Alfalfa", 10, "150", "Alta");
        
        System.out.println(perro.toString());
        System.out.println(gato.toString());
        System.out.println(caballo.toString());


    }

}
