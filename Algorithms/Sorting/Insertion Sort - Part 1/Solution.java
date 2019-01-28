import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the insertionSort1 function below.
    static void insertionSort1(int n, int[] arr) {
        int lastEntry = arr[arr.length - 1];
        for (int i = arr.length - 2; i >= 0; i--) {
            int lowerIndexValue = arr[i];
            if (lowerIndexValue > lastEntry) {
                arr[i + 1] = lowerIndexValue;
                printArray(arr);
                if (i == 0) {
                    arr[i] = lastEntry;
                    printArray(arr);
                }
            } else {
                arr[i + 1] = lastEntry;
                printArray(arr);
                break;
            }
        }
    }

    static void printArray(int[] arr) {
        for (int num : arr) {
            System.out.print(num + " ");
        }
        System.out.println();
    }

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        int n = scanner.nextInt();
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        int[] arr = new int[n];

        String[] arrItems = scanner.nextLine().split(" ");
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        for (int i = 0; i < n; i++) {
            int arrItem = Integer.parseInt(arrItems[i]);
            arr[i] = arrItem;
        }

        insertionSort1(n, arr);

        scanner.close();
    }
}
