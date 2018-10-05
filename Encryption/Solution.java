import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the encryption function below.
    static String encryption(String s) {
        String result = "";
        
        String whitespaceRemoved = s.replaceAll("\\s+","");
        int stringLength = whitespaceRemoved.length();
        double sqrtOfLength = Math.sqrt((double) stringLength);
        int smallerSide = (int) Math.floor(sqrtOfLength);
        int largerSide = (int) Math.ceil(sqrtOfLength);
        
        char[][] grid = new char[smallerSide][largerSide];
        
        int rowIndex = -1;
        for (int i = 0; i < stringLength; i++) {
            
            if (i % largerSide == 0) {
                rowIndex++;
            }
            
            char c = whitespaceRemoved.charAt(i);
            grid[rowIndex][i % largerSide] = c;
            
        }
        
        for (int i = 0; i < largerSide; i++) {
            for (int j = 0; j < smallerSide; j++) {
                String toBeAdded = "" + grid[j][i];
                if (!toBeAdded.equals("")) {
                    result += toBeAdded;
                }
            }
            result += " ";
        }
        return result.substring(0, result.length() - 1);

    }

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) throws IOException {
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        String s = scanner.nextLine();

        String result = encryption(s);

        bufferedWriter.write(result);
        bufferedWriter.newLine();

        bufferedWriter.close();

        scanner.close();
    }
}
