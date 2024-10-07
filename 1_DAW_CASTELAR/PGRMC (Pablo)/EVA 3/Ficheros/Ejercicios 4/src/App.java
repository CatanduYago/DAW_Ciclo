import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class App {

    public static void main(String[] args) {
        CambiarJSON();
    }

    public static void CambiarJSON() {
        String csvFile = "valo_agents_stat.csv";
        String jsonFile = "valo_agents_stat.json";

        try {
            BufferedReader br = new BufferedReader(new FileReader(csvFile));
            String line;
            String[] headers = null;
            List<String[]> data = new ArrayList<>();

            if ((line = br.readLine()) != null) {
                headers = line.split( ",");
            }

            while ((line = br.readLine()) != null) {
                data.add(line.split(","));
            }

            try (FileWriter file = new FileWriter(jsonFile)) {
                file.write("[\n");
                for (String[] row : data) {
                    file.write("{\n");
                    for (int i = 0; i < headers.length; i++) {
                        file.write("\"" + headers[i] + "\":\"" + row[i] + "\"");
                        if (i < headers.length - 1) {
                            file.write(",\n");
                        }
                    }
                    file.write("\n}");
                    if (data.indexOf(row) < data.size() - 1) {
                        file.write(",\n");
                    }
                }
                file.write("\n]");
            } catch (IOException e) {
                e.printStackTrace();
            }

            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
