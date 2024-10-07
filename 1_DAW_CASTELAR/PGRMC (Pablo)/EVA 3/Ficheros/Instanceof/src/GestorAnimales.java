import java.util.ArrayList;
import java.util.List;

public class GestorAnimales{
        private List<Animal> animales;

        public GestorAnimales() {
            animales = new ArrayList<>();
        }

        public void agregarAnimal(Animal animal) {
            animales.add(animal);
        }

        public void eliminarAnimal(Animal animal) {
            animales.remove(animal);
        }

        public void actualizarAnimal(Animal animal) {
            int index = animales.indexOf(animal);
            if (index != -1) {
                animales.set(index, animal);
            }
        }

        public List<Animal> obtenerAnimales() {
            return animales;
        }
    @Override
    public String toString() {
        for (Animal animal : animales) {
            animal.toString();
        }
        return toString();
    }
}