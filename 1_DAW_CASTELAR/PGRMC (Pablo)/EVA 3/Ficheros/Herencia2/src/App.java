public class App {
    public static void main(String[] args) throws Exception {
        repartidor repartidor = new repartidor("Juan", 20, 1300, 3);

        comercial comercial = new comercial("Ana", 31, 1500, 500);

        repartidor.aplicarPlus();
        comercial.aplicarPlus();

        System.out.println("Repartidor:");
        System.out.println(repartidor.toString());
        System.out.println("Comercial:");
        System.out.println(comercial.toString());



        }
    }

