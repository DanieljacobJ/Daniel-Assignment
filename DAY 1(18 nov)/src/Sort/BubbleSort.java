package Sort;

import java.util.Arrays;

public class BubbleSort {
    static void main() {
        int [] arr ={100,4,5,75,1};
        bubblesort(arr);
    }

    private static void bubblesort(int[] arr) {
        int n = arr.length;
        for(int i=0;i<n;i++){
            for(int j=0;j<n-1-i;j++){
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;

                }
            }
        }
        System.out.println(Arrays.toString(arr));

    }


}
