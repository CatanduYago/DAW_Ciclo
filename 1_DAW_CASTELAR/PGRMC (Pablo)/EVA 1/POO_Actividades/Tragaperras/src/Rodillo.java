import java.util.Scanner;
import java.util.Random;

public class Rodillo {
    private int identificador = 1;
    public static int ultimoidentificador;
    private int nNumeros = 10;
    private Random random;

    public Rodillo() {
        this.ultimoidentificador = Rodillo.ultimoidentificador++;
        this.ultimoidentificador++;
        this.nNumeros = 10;
        this.random = new Random();
    }

    public Rodillo(int identificador, int nNumero) {
        identificador = Rodillo.ultimoidentificador + 1;
        Rodillo.ultimoidentificador++;
        if (nNumeros <= 30 || nNumeros > 0) {
            this.nNumeros = nNumero;
        } else {
            this.nNumeros = 10;
        }
    }

    public int girarRodillo() {
        return random.nextInt(nNumeros) + 1;
    }

    public int girarRodilloTrucado() {
        return girarRodillo() + 1;
    }

    public int girarRodilloGanador() {
        return girarRodillo();
    }
}
