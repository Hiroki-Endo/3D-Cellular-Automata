import peasy.*; 
PeasyCam cam; 

final int[] BORN = {3}; //born conditions
final int[] SURVIVAL = {2, 3}; //survival conditions
Box[][][] source; //null pointer error

void setup() {
  cam=new PeasyCam(this, 300);
  frameRate(50);
  fullScreen(P3D);
  background(0);

  spawn("data.txt"); //file path
}

void draw() {
}

public void spawn() {
}

public void spawn(String path) {
  String[] lines = loadStrings(path);
  for (int i = 0; i < lines.length; i++) {
    String[] list = split(lines[i], "\t");
    source[Integer.parseInt(list[0])][Integer.parseInt(list[0])][Integer.parseInt(list[0])] //null pointer error
      = new Box(Integer.parseInt(list[0]), Integer.parseInt(list[0]), Integer.parseInt(list[0]), true, false);
  }
}

public boolean findElement(int[] arr, int ele) {
  int i = 0;
  while (i < arr.length) {
    if (arr[i++] == ele) return true;
  }
  return false;
}
