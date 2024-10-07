import java.util.Scanner;

public class Actividad2 {
    public static void main(String[] args) throws Exception{
        
        Scanner leer = new Scanner(System.in);
        System.out.println("Ingrese la contraseña: ");
        String contraseña = leer.nextLine();
        if(contraseña.equals("12345")){
            System.out.println("Contraseña correcta");
        }else{
            System.out.println("Contraseña incorrecta");
        }
    leer.close();
       
        
    }
}