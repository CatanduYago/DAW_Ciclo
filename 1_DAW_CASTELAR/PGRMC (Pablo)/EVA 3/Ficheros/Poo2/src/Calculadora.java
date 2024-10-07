import java.lang.Math;

public class Calculadora {

    public float sumar(float a, float b) {
        return a + b;
    }

    public float restar(float a, float b) {
        return a - b;
    }

    public float multiplicar(float a, float b) {
        return a * b;
    }

    public float dividir(float a, float b) {
        return a / b;
    }

    public double potencia(float a, float b) {
        return (Math.pow(a, b));
    }

    public double Logaritmo(float a) {
        return Math.log(a);
    }

    public double raiz(float a) {
        return Math.sqrt(a);
    }

    public float factorial(float a) {
        float n = 1;
        for (int i = 1; i <= a; i++) {
            n *= i;
        }
        return n;
    }

    public double seno(float a) {
        return Math.sin(a);
    }

    public double coseno(float a) {
        return Math.cos(a);
    }

    public double tangente(float a) {
        return Math.tan(a);
    }

    public double arcoseno(float a) {
        return Math.asin(a);
    }

    public double arcocoseno(float a) {
        return Math.acos(a);
    }

    public double cotangente(float a) {
        return Math.atan(a);
    }

}
