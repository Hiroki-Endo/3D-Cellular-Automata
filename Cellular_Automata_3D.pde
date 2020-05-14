import peasy.*; 
PeasyCam cam; 

final int[] BORN = {3};
final int[] SURVIVAL = {2, 3};
Box[][][] source;//null pointer error

void setup() {
  cam=new PeasyCam(this, 300);
  frameRate(50);
  fullScreen(P3D);
  background(0);

  spawn("data.txt");
}

void draw() {
}


public void spawn() {
}

public void spawn(String path) {
  String[] lines = loadStrings(path);
  for (int i = 0; i < lines.length; i++) {
    String[] list = split(lines[i], "\t");
    int x = Integer.parseInt(list[0]);
    int y = Integer.parseInt(list[1]);
    int z = Integer.parseInt(list[2]);
    source[x][y][z] = new Box(x, y, z, true, false); //null pointer error
  }
}


public boolean findElement(int[] arr, int ele) {
  int i = 0;
  while (i < arr.length) {
    if (arr[i++] == ele) return true;
  }
  return false;
}
