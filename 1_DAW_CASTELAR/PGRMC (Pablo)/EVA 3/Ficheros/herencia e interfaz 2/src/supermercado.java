
public class supermercado {
    private static supermercado instancia;
    supermercado(){
        
    }

    public static supermercado getInstance(){
        if(instancia == null){
            instancia = new supermercado();
        }
        return instancia;
    }
    
}
