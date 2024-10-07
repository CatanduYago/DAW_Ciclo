public class Actividad1{

        public static void main(String[] args) {
                
                /*  Notas del alumno */
                double nota1 = 5.25;
                double nota2 = 7.85;
                double nota3 = 3.4;
                
                /**  Calculamos la media de las notas */
                double media = (nota1 + nota2 + nota3) / 3.0;
                
                /* Añadimos 1 punto a la media */
                double notaFinal = media + 1.0;
                
                /* Muestra la media y la nota final por pantalla*/
        
                System.out.println("La media es: " + media);
                System.out.println("La nota final es: " + notaFinal);
            }
 }
        
