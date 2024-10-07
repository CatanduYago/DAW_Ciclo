import java.util.Scanner;
import java.util.Random;

public class Dado {
    private int identificador = 1;
    public static int ultimoIdentificador;
    private Random random;
    private int nCaras = 6;
    private int modificador = 1;

    public Dado(){
        this.identificador = Dado.ultimoIdentificador+1;
        Dado.ultimoIdentificador ++;
        this.nCaras = 6;
        this.modificador=0;
        this.random = new Random();
    }

    public Dado(int nCaras, int modificador) {
        identificador = Dado.ultimoIdentificador+1;
        Dado.ultimoIdentificador ++;
        if (nCaras==4||nCaras==6||nCaras==8||nCaras==10||nCaras==12||nCaras==20||nCaras==100) {
            this.nCaras = nCaras;
            
        }
        else {
            this.nCaras=6;
        }
        this.modificador = modificador;
        this.random=new Random();
    }

    public int getIdentificador() {
        return this.identificador;
    }
    public void setIdentificador(int identificador) {

    }
    public int tirardado(){
        return random.nextInt(this.nCaras)+1;
    }
    public int tirarDadoMod(){
        return tirardado()+this.modificador();
    }
    public int tirardados(int veces){
        int resultado=0;
        for (int i=0;i<veces;i++){
            resultado+=tirardado();
        }
        return resultado;
    }
}


