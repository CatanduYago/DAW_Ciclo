import java.util.Scanner;
public class App {
    public static void ejercicio1 (){

    }
    public static void ejercicio2 () {
        Scanner s = new Scanner (System.in);
        String texto = s.nextLine();
        String resultado="";
        for (int i = texto.length()-1;i>=0;i--) {
            resultado += texto.charAt(i);
        }
        System.out.println(resultado);

    }
    public static void ejercicio3() {
        for (int i = 0; i <16; i++){
            for (int j = 0; j <16; j++){
                for (int k = 0; k <16; k++){
                    System.out.println(codificarHex(i)+codificarHex(j)+codificarHex(k));
                }
            }
        }
    }
        public static String codificarHex (int numero){
            String resultado = "" + numero;

            switch(numero) {
                case 10:
                resultado = "A";
                break;
                case 11:
                resultado = "B";
                break;
                case 12:
                resultado = "C";
                break;
                case 13:
                resultado = "D";
                break;
                case 14:
                resultado = "E";
                case 15:
                resultado = "F";
                break;
            }
            return resultado;
        }
        public static void ejercicio4(){
            Scanner s = new Scanner(System.in);
            int n=s.nextInt();
            int contador = 0;
            int sumaPrimos = 0;
            int i=0;

            while (contador<n) {
                if (esPrimo(i)){
                    sumaPrimos+=i;
                    contador++;
                }
                i++;
            }
            System.out.println(sumaPrimos);

        }
        public static boolean esPrimo(int numero){
            Scanner s = new Scanner(System.in);
            boolean esPrimo=true;
            if (numero<=1) esPrimo=false;
            for (int i=2; i<numero; i++) {
                if (numero%i==0)
                esPrimo=false;
            }    
            return esPrimo;
}
}


