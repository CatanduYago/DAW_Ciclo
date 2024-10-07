import java.io.File;

public class App {
    public static void main(String[] args) throws Exception {
        File fichero1 = new File("prueba1.txt");
        File fichero2 = new File("prueba2.txt");
        File fichero3 = new File("directorio");
    if (!fichero2.exists()) {
        fichero2.createNewFile();
        System.out.println("Fichero creado");
    }else {
        System.out.println("El fichero ya existe");
    }
    if (!fichero3.exists()) {
        fichero2.mkdir();
        System.out.println("Directorio creado");
    } else {
        System.out.println("El directorio ya existe");
    }

        System.out.println("Datos del fichero");

        
            System.out.println(fichero1.getName());
            System.out.println(fichero1.getAbsolutePath());
            System.out.println(fichero1.getParent());
            System.out.println(fichero1.getPath());
            System.out.println(fichero1.canRead());
            System.out.println(fichero1.canWrite());
            System.out.println(fichero1.length());
        
    }
}
   
