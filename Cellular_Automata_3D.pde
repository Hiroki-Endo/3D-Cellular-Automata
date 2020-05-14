final int[] BORN = {3};
final int[] SURVIVAL = {2, 3};
Box[][][] source;

public boolean findElement(int[] arr, int ele) {
  int i = 0;
  while (i < arr.length) {
    if (arr[i++] == ele) return true;
  }
  return false;
}
