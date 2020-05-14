class Box {
  Box[][][] neighbors;
  int[] location;
  boolean state;

  public Box(int x, int y, int z, boolean state) {
    location = new int[3];
    location[0] = x;
    location[1] = y;
    location[2] = z;
    neighbors = new Box[3][3][3];

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          if (i*j*k!=1) {
            if (source[location[0]+i-1][location[1]+j-1][location[2]+k-1] == null) {
              neighbors[i][j][k] = new Box (location[0]+i-1, location[1]+j-1, location[2]+k-1, false);
            } else {
              neighbors[i][j][k]=source[location[0]+i-1][location[1]+j-1][location[2]+k-1];
            }
            neighbors[i][j][k].neighbors[2-i][2-j][2-k]=this;
          } else {
            neighbors[i][j][k] = this;
          }
        }
      }
    }
    this.state = state;
  }

  public boolean visible() {
    return !(neighbors[0][1][1].state && neighbors[1][0][1].state && neighbors[1][1][0].state
      &&neighbors[2][1][1].state && neighbors[1][2][1].state && neighbors[1][1][2].state);
  }

  public void iterate() {
    int sum = 0;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          if (neighbors[i][j][k].state)sum++;
        }
      }
    }

    if (state) {
      if (!findElement(SURVIVAL, --sum)) state = false;
    } else {
      if (findElement(BORN, sum)) state = true;
    }
  }
}
