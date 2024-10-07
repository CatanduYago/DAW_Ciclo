package Ejercicios1Tema2;

import java.util.Scanner;

public class App {  
    public static void multiplo(){
        Scanner sc = new Scanner(System.in); 
        int num = sc.nextInt();
        if (num % 3 == 0) {
            System.out.println(num + " es multiplo de 3");
        } else {
            System.out.println(num + " no es multiplo de 3");
        }
        sc.close();
}

public static void mayor() {
Scanner sc = new Scanner(System.in);
    int num1 = sc.nextInt();
    int num2 = sc.nextInt();
    int num3 = sc.nextInt();{
        if (num1 > num2 && num1 > num3) {
            System.out.println(num1 + " es el mayor");
        } else if (num2 > num1 && num2 > num3) {  
            System.out.println(num2 + " es el mayor");
         } else { 
            System.out.println(num3 + " es el mayor");
}
sc.close();

}
}
public static void hora() {
Scanner sc = new Scanner(System.in);

int nume1 = sc.nextInt();
int nume2 = sc.nextInt();
int nume3 = sc.nextInt();
 if (nume1 > 23 || nume2 > 59 || nume3 > 59) {
    System.out.println("Hora incorrecta");
} else {
    System.out.println("Hora correcta");
    System.out.println(nume1 + ":" + nume2 + ":" + nume3);
}
sc.close();

}
public static void mes(){
Scanner sc = new Scanner(System.in);
int mes = sc.nextInt();{
    switch (mes) {
        case 1:
            System.out.println("Enero");
            break;
        case 2:
            System.out.println("Febrero");
            break;
        case 3:
            System.out.println("Marzo");
            break;
        case 4:
            System.out.println("Abril");
            break;
        case 5:
            System.out.println("Mayo");
            break;
        case 6:
            System.out.println("Junio");
            break;
        case 7:
            System.out.println("Julio");
            break;
        case 8:
            System.out.println("Agosto");
            break;
        case 9:
            System.out.println("Septiembre");
            break;
        case 10:
            System.out.println("Octubre");
            break;
        case 11:
            System.out.println("Noviembre");
        break;
        case 12:
            System.out.println("Diciembre");
        break;
    default:
            System.out.println("Mes incorrecto");         
    }   
    sc.close();
}
}
public static void notafinal() {
Scanner sc = new Scanner(System.in);
int nota1 = sc.nextInt();
        int nota2 = sc.nextInt();
        int nota3 = sc.nextInt();
        
        if (nota1 >= 5 && nota2 >= 5 && nota3 >= 5) {
            double notaFinal = (nota1 + nota2 + nota3) / 3;
            System.out.println("La nota final es: " + notaFinal);
        } else {
           
            if (nota1 < 5) {
                System.out.println("Debes recuperar la primera evaluación.");
            }
            if (nota2 < 5) {
                System.out.println("Debes recuperar la segunda evaluación.");
            }
            if (nota3 < 5) {
                System.out.println("Debes recuperar la tercera evaluación.");
            }
              sc.close();
        }
      
}


public static void horasTrabajadas(){
Scanner sc = new Scanner(System.in);
int horasTrabajadas = sc.nextInt();
        double tarifaNormal = 10.0;
        double tarifaExtra = 20.0;
        double sueldo;

        if (horasTrabajadas <= 150) {
            sueldo = horasTrabajadas * tarifaNormal;
        } else {
            sueldo = 150 * tarifaNormal + (horasTrabajadas - 150) * tarifaExtra;
        }
        
        System.out.println("El sueldo total es: " + sueldo + " euros");
        sc.close();    

}


public static void parimpar(){
Scanner sc = new Scanner(System.in);
int numero = sc.nextInt();

        if (numero % 2 == 0) {
            System.out.println("El número " + numero + " es par.");
        } else {
            System.out.println("El número " + numero + " es impar.");
        }
    sc.close();

    }




public static void numeroletra(){
    Scanner sc = new Scanner (System.in);
int nume = sc.nextInt();
        switch (nume) {
            case 0:
            System.out.println("cero");
            break;
            case 1:
            System.out.println("uno");
            break;
            case 2:
            System.out.println("dos");
            break;
            case 3:
            System.out.println("tres");
            break;
            case 4:
            System.out.println("cuatro");
            break;
            case 5:
            System.out.println("cinco");
            break;
            case 6:
            System.out.println("seis");
            break;
            case 7:
            System.out.println("siete");
            break;
            case 8:
            System.out.println("ocho");
            break;
            case 9:
            System.out.println("nueve");
            break;
            case 10:
            System.out.println("diez");
            break;
            default:
            System.out.println("Opcion incorrecta");
            break;
        }
        sc.close();
    }
    public static void letranumero(){
        Scanner sc = new Scanner (System.in);
        String numeroLetras = sc.nextLine();
        switch (numeroLetras) {
                    case "cero":
                        System.out.println("0") ;
                    case "uno":
                        System.out.println("1") ;
                    case "dos":
                        System.out.println("2") ;
                    case "tres":
                        System.out.println("3") ;
                    case "cuatro":
                        System.out.println("4") ;
                    case "cinco":
                        System.out.println("5") ;
                    case "seis":
                        System.out.println("6") ;
                    case "siete":
                        System.out.println("7") ;
                    case "ocho":
                        System.out.println("8") ;
                    case "nueve":
                        System.out.println("9") ;
                    case "diez":
                        System.out.println("10");

            break;
            
        } 
    
    sc.close();
}

public static void bisiesto(){ 
Scanner sc = new Scanner (System.in);

int año = sc.nextInt();
    if ( año % 400 == 0) {
        System.out.println("El año " + año + " es bisiesto");
    } else {
        System.out.println("El año " + año + " no es bisiesto");
    }
    sc.close();
}

    public static void main(String[] args){


        int opcion;
        Scanner sc = new Scanner(System.in); 
        opcion = 0;
        boolean salir = false;
    
        while(!salir){
            System.out.println("\n1. Ejercicio 1 "+"\n2. Ejercicio 2 "+ "\n3. Ejercicio 3 "+"\n4. Ejercicio 4 "+"\n5. Ejercicio 5 "+"\n6. Ejercicio 6 "+"\n7. Ejercicio 7 "+"\n8. Ejercicio 8 "+"\n9. Ejercicio 9 "+"\n10. Ejercicio 10 "+"\n11. Salir.\n\n");
        
        
    
        try {System.out.print("Ingrese una opcion: \n");
            opcion = sc.nextInt();

        switch (opcion) {
            case 1: //Si un numero es multiplo de 3.
                System.out.println("Ejercicio 1\n Ingrese un numero entero: ");
                multiplo();            
                break;
            case 2: //Lee por teclado tres numeros enters y calcula y muestra el mayor
                System.out.println("Ejercicio 2\n Ingrese tres numeros: ");
                mayor();
                break;
            case 3: // Tres numeros enteros hora minutos y segundos y validar si es una hora
                System.out.println("Ejercicio 3\n Ingrese tres numeros en horas, minutos y segundos: ");
                hora();           
                break;
            case 4: // leer variable entera mes y comprobar si corresponde a un mes de 30, 31 o 28 dias e imprimir el mes.
                System.out.println("Ejercicio 4\n Ingrese número de mes: ");
                mes();
                break;
            case 5://pedir 3 notas de evaluacion y si las 3 estan aprobadasm hacer la media. Si no, imprimir la evaluacion suspensa.
                System.out.println("Ejercicio 5\n Ingrese tres notas: ");
                notafinal();
                break;
            case 6: // horas trabajadas y sueldo 
                System.out.println("Ejercicio 6\n Ingrese las horas trabajadas: ");
                horasTrabajadas();
                break;
            case 7: // Par o impar
                System.out.println("Ejercicio 7 \n Ingrese un numero: ");
                parimpar();
                break;
            case 8: //Nombre en letras de un numero ingresado
                System.out.println("Ejercicio 8\n Ingrese un numero del 1 al 10: ");
                numeroletra();
                break;
            case 9: //numero en letras a un numero en cifras
                System.out.println("Ejercicio 9\n Escribe con letras un numero entre el 1 y el 10");                  
                letranumero();
                break;
            case 10: //año bisiesto
                System.out.println("Ejercicio 10 \n Ingrese un año: ");
                bisiesto();
                break;
            case 11:
                break;
            default:
                System.out.println("Opcion incorrecta, solo numeros entre 1 y 10");
                salir = false;
                break;
        }
       break;
       
       }
       
       catch (Exception e) {
            System.out.println("Error: " + e.getMessage());

        } while ( salir = false); 


            }
        }

    }

