public class App {
    public static void main(String[] args) {
        examenescrito examenescrito1 = new examenescrito(true, "01/04/2024", 60, 8);
        examenescrito examenescrito2 = new examenescrito(false, "05/04/2024", 75, 2);
        
        examenoral examenoral1 = new examenoral("10/04/2024", "suficiente", true);
        examenoral examenoral2 = new examenoral("12/04/2024", "excelente", true);
        
        Alumno alumno1 = new Alumno("12345678A", "García", "Juan", 2);
        
        
    }
}