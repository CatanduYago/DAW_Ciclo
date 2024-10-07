import org.junit.Test;
import static org.junit.Assert.assertEquals; 
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
public class CalculadoraTest {

    @Test
    public void dividirTest(){
        Calculadora c = new Calculadora();

        assertEquals(2, c.dividir(10,5),0.0001); 
        assertEquals(-2, c.dividir(10,-5),0.0001); 
        assertEquals(2, c.dividir(-10,-5),0.0001); 
        assertEquals(-2, c.dividir(-10,5),0.0001); 
        
        try {
            assertThrows(ArithmeticException.class, () -> c.dividir(10, 0));
        } catch (Exception e) {

        }
        
    }
        @Test

    public void sumarTest(){
        Calculadora c = new Calculadora();

        assertEquals(15, c.sumar(10,5),0.0001); 
        assertEquals(12, c.sumar(10,2),0.0001); 

    }
    @Test

    public void restarTest(){
        Calculadora c = new Calculadora();

        assertEquals(5, c.restar(10,5),0.0001); 
        assertEquals(8, c.restar(10,2),0.0001); 

    }
    @Test
    public void multiplicarTest(){
        Calculadora c = new Calculadora();

        assertEquals(50, c.multiplicar(10,5),0.0001); 
        assertEquals(-20, c.multiplicar(10,-2),0.0001);
        assertEquals(0, c.multiplicar(10,0),0.0001);
        assertEquals(10, c.multiplicar(10,1),0.0001);
        assertEquals(-20, c.multiplicar(-10,2),0.0001);
    }
    @Test
    public void potenciaTest(){
        Calculadora c = new Calculadora();

        assertEquals(100, c.potencia(10,2),0.0001); 
        assertEquals(1, c.potencia(10,0),0.0001);
        assertEquals(0.01, c.potencia(10,-2),0.0001);
        assertEquals(100, c.potencia(-10,2),0.0001);
        assertEquals(-1000, c.potencia(-10,3),0.0001);

    }
    @Test
    public void logaritmoTest(){
        Calculadora c = new Calculadora();

        assertEquals(2.302585092994046, c.Logaritmo(10),0.0001);
        assertEquals(3.912023005428146, c.Logaritmo(50),0.0001); 
        assertEquals(0, c.Logaritmo(1),0.0001);
        assertEquals(0, c.Logaritmo(0),0.0001); // excepcion por aqui es infinito
    }
    @Test
    public void raizTest(){
        Calculadora c = new Calculadora();

        assertEquals(3.1622776601683795, c.raiz(10),0.0001);
        assertEquals(5, c.raiz(25),0.0001); 
        assertEquals(1, c.raiz(1),0.0001);
        assertEquals(0, c.raiz(0),0.0001);
        assertEquals(0, c.raiz(-25),0.0001); // excepcion por aqui no se puede

    }
    @Test public void factorialTest(){
        Calculadora c = new Calculadora();

        assertEquals(120, c.factorial(5),0.0001);
        assertEquals(1, c.factorial(0),0.0001);
        assertEquals(1, c.factorial(1),0.0001);
        assertEquals(3628800, c.factorial(10),0.0001);
        assertEquals(1, c.factorial(-5),0.0001); 
    }
}
