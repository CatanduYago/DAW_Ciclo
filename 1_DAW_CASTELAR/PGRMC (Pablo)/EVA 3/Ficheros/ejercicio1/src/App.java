import java.io.File;
import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        System.out.println("1. Ej 1 \n 2. Ej2");
        int opcion = sc.nextInt();
        switch (opcion) {
            case 1:
                ej1();
                break;
        
            default:
                break;
        }
    }

    public static void ej1(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Qué quieres hacer: crear, eliminar o salir?");
        String accion = sc.nextLine();
        accion = accion.toLowerCase();
        while (!accion.equals("salir")){
            if (accion.equals("crear")){
                crear();
            }else if (accion.equals("eliminar")){
                eliminar();
            }else{
                System.out.println("Error al introducir la operacion");
            }
                System.out.println("Qué quieres hacer: crear, eliminar o salir?");
                accion = sc.nextLine();
        }
    }
    public static void crear(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Qué quieres hacer: un archivo o un directorio?");
        String tipo = sc.nextLine();
        tipo = tipo.toLowerCase();

        if (tipo.equals("archivo")){
            System.out.println("Introduce el nombre del archivo");
            String nombre = sc.nextLine();
            File fichero = new File(nombre);
            if (!fichero.exists()) {
                try {
                    fichero.createNewFile();
                    System.out.println("Fichero creado");
                } catch (Exception e) {
                    System.out.println("Error al crear el fichero");
                }
            }else {
                System.out.println("El fichero ya existe");
            }
        }else if (tipo.equals("directorio")){
            System.out.println("Introduce el nombre del directorio");
            String nombre = sc.nextLine();
            File fichero = new File(nombre);
            if (!fichero.exists()) {
                try {
                    fichero.mkdir();
                    System.out.println("Directorio creado");
                } catch (Exception e) {
                    System.out.println("Error al crear el directorio");
                }
            }else {
                System.out.println("El directorio ya existe");
            }
            
    }else{
        System.out.println("Error al introducir el tipo");
         }
    }
    public static void eliminar(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduce el nombre del archivo o directorio que quieres eliminar");
        String nombre = sc.nextLine();
        File fichero = new File(nombre);
        if (fichero.exists()) {
            try {
                fichero.delete();
                System.out.println("Fichero eliminado");
            } catch (Exception e) {
                System.out.println("Error al eliminar el fichero");
            }
        }else {
            System.out.println("El fichero no existe");
        }
    }
    public static void ej2(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduce la ruta ABSOLUTA de un archivo");
        String ruta = sc.nextLine();
        File fichero = new File(ruta);
        if (fichero.isFile()) {
            System.out.println(fichero.getName());
            System.out.println(fichero.length());
            System.out.println(fichero.canRead());
            System.out.println(fichero.canWrite());

        }else if (fichero.isDirectory()){
            System.out.println(fichero.listFiles());
        }
    }
}