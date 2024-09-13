import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SaveFile {

    public static void main(String[] args) {
        try {
            saveToFile();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    public static void saveToFile() throws IOException {
        byte[] data = "Hello, Byte Array!".getBytes();
        Path path = Paths.get("d:/file.txt");
        Files.write(path, (byte[]) data);
    }
}