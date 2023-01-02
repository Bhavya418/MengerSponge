float rotatex=0;
float rotatey=0;
float rotatez=0;
ArrayList<Box> MengerSponge;
void setup() {
  //This commond creates a  canvas and P3D is 3d library for 3D sketches
  size(400, 400, P3D);
  //Box(x,y,z,r)
  //First, create a basic cube at the center to start with menger sponge
  MengerSponge= new ArrayList<Box>();
  Box b=new Box(0, 0, 0, 200);
  MengerSponge.add(b);
}
void mouseClicked() {
  //Adding the arrayList for the next 27 boxes which gets created on every click for every boxes in mengersponge
  ArrayList<Box> nextGeneration= new ArrayList<Box>();
  for (Box b : MengerSponge) {
    ArrayList<Box> newBoxes = b.generate();
    nextGeneration.addAll(newBoxes);
  }
  MengerSponge = nextGeneration;
}
void draw() {
  //Setting up the workspace with background
  background(50);
  stroke(230);
  lights();
  translate(width/2, height/2);
  rotateX(rotatex);
  rotateY(rotatey);
  rotateZ(rotatez);
  for (Box b : MengerSponge) {
    b.show();
  }
  rotatex+=0.01;
  rotatey+=0.02;
  rotatez+=0.01;
}
