import java.util.ArrayList;

public class App {
    public static void main(String[] args) {
        supermercado constructor = new supermercado();

        tipoCereal tipo = tipoCereal.MAIZ;
        ArrayList productos = new ArrayList(); 

        productos.add(new cereales("Arroz inflado", 2.5, tipoCereal.ARROZ));
        productos.add(new detergente("Detergente hacendado", 5.4));
        productos.add(new vino("Tinto", "Rioja", 5.4, 12.5));

        System.out.println(productos.toString());
       
    }
}
