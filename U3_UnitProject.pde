import peasy.*;

float rotX = -0.5;

PeasyCam Cam;
void setup()
{
  size(1280, 700, P3D);
  Cam = new PeasyCam(this, 100);
  Cam.setMinimumDistance(50);
  Cam.setMaximumDistance(500);
}

void draw() 
{
  pushMatrix();
  rotateX(radians(rotX));
  rotateY(-.5);
  background(0);
  fill(255, 0, 0);
  strokeWeight(4);
  line(100,100, width/2, height/2);
  popMatrix();
  rotX -= 0.5;
}