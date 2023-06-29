// A subarray is the sequence of consecutive elements of the array. Subarray is called increasing if each element of this subarray strictly greater than previous.
// i/p-5 1  7  2  11  15
// o/p -3

class Subarray {
    public static int maxLengthOfSubArr(int arr[]) {
        int n = arr.length;
        int maxlength = 0;
        int length = 0;

        for (int i = 1; i < n; i++) {
            if (arr[i] > arr[i - 1]) {
                length++;
            } else {
                if (maxlength < length) {
                    maxlength = length;
                    length = 0;
                }
            }

            if (maxlength < length) {
                maxlength = length;
            }
        }
        return maxlength;
    }

    


    public static void main(String[] args) {
        int arr[] = { 5, 1, 7, 2, 11, 15 };

        int res = maxLengthOfSubArr(arr);
        System.out.println("The maximum length of subarray is : " + res);
    }
}