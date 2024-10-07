import java.util.Scanner;

public class Actividad4 {
    public static void main(String[] args) throws Exception{
        
        Scanner leer = new Scanner(System.in);
       System.out.println(" Escriba 'Hola amigo ¿cómo estás?' ");
       String amigo = leer.nextLine();
       
       System.out.println(amigo.substring(5, 10));
       
    leer.close();
       
        
    }
}