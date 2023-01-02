class Box
{
  //Box object to create a box
  PVector pos;
  float r;
  Box(float x, float y, float z, float rBox) {
    pos= new PVector(x, y, z);
    r=rBox;
  }
  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x=-1; x<2; x++) {
      for (int y=-1; y<2; y++) {
        for (int z=-1; z<2; z++) {
          //Adding boxes when sum is greater than 1 to ensure the center of every face and center of the cube is removed which is any two or more of x,y,z is not zero
          int sum = abs(x)+ abs(y)+ abs(z);
          float newR = r/3;
          if (sum>1) {
            //Adding the box a new position 
            Box b = new Box(pos.x+x*newR, pos.y+y*newR, pos.z+z*newR, newR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }
  void show() {
    //Using the passed values tranlating the box to given coordinates and making a box of size r over there
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(r);
    popMatrix();
  }
}
