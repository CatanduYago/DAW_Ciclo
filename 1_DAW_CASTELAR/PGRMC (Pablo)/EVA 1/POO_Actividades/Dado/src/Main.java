import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Dado dado = new Dado();
            String TipoDado = sc.nextLine();

            switch (TipoDado) {
                case "4":
                dado.nCaras=4;
                break;
                case "6":
                dado.nCaras=6;
                break;
                case "8":
                dado.nCaras=8;
                break;
                case "10":
                dado.nCaras=10;
                break;
                case "12":
                dado.nCaras=12;
                break;
                case "20":
                dado.nCaras=20;
                break;
                case "100":
                dado.nCaras=100;
                default:
                    break;
            }
            String tirarTipo = sc.nextLine();
            switch (tirarTipo.toLowerCase()) {
                case "tirardado":
                    Dado.random.nextInt();
                    break;
            
                default:
                    break;
            }
    }
}
