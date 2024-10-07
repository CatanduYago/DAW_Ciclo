    public class tragaperras {
        private Rodillo rodillo1;
        private Rodillo rodillo2;
        private Rodillo rodillo3;
        private int precio;
        private int bote;
        private int dineroDisponible;
        private int rachaPerdidas;
        private int boteSeguro;
        private int perderSeguro;
    
    public tragaperras(){
        this.rodillo1 = new Rodillo();
        this.rodillo2 = new Rodillo();
        this.rodillo3 = new Rodillo();
        this.precio=10;
        this.bote=500;
        this.dineroDisponible=0;
        this.rachaPerdidas=0;
        this.boteSeguro=5;
        this.perderSeguro=3;
    }
    public tragaperras(int precio, int boteSeguro,int perderSeguro){
        this.rodillo1 = new Rodillo();
        this.rodillo2 = new Rodillo();
        this.rodillo3 = new Rodillo();
        this.precio=precio;
        this.bote= 500;
        this.dineroDisponible = 0;
        this.rachaPerdidas=0;
        this.boteSeguro=boteSeguro;
        this.perderSeguro=perderSeguro;
    }
public int tirar() {
    if (tiradaLegal()) {
        recibirPago();
        return otorgarPremio();
    } else {
        return 0; 
    }
}

public boolean tiradaLegal() {
    int resultado1 = rodillo1.girarRodillo();
    int resultado2 = rodillo2.girarRodillo();
    int resultado3 = rodillo3.girarRodillo();

    return resultado1 == resultado2 || resultado2 == resultado3;
}

public boolean tiradaTrucada() {
    int resultado1 = rodillo1.girarRodilloTrucado();
    int resultado2 = rodillo2.girarRodilloTrucado();
    int resultado3 = rodillo3.girarRodilloTrucado();

    return resultado1 == resultado2 || resultado2 == resultado3;
}

public void recibirPago() {
    dineroDisponible += precio;
    bote += precio / 2;
}

public int otorgarPremio() {
    if (tiradaTrucada()) {
        int premio = bote;
        bote = 0;
        rachaPerdidas = 0;
        return premio;
    } else {
        rachaPerdidas++;
        return 0;
}
}
 }