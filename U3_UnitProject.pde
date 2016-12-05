import peasy.*;

ArrayList<Line> l;


float rotX = -0.5;

float randomX = 10;
float randomY = 10;
float randomZ = 10;

PVector sPoint = new PVector(randomX, randomY, randomZ);
PVector ePoint = new PVector(randomX, randomY, randomZ);

float red = random(0, 255);
float green =random(0, 255);
float blue = random(0, 255);


PeasyCam Cam;
void setup()
{
  size(1280, 700, P3D);
  Cam = new PeasyCam(this, 100);
  Cam.setMinimumDistance(50);
  Cam.setMaximumDistance(500);
  l = new ArrayList<Line>();
  //strokeWeight(10);
    sPoint = new PVector(random(50, 1230), random(50, 650), random(50, 100));
}

void draw() 
{
  background(0);
  //rotateX(radians(rotX));
  //rotateY(-.5);
  randomX = random(0, 1200);
  randomY = random(0, 680);
  randomZ = random(0, 10);
  //fill(255, 0 , 0);
  //stroke(255, 0, 0);
  //println(dist(randomX,randomY, 50, 50));
  
  
  //Get the PVector for the starting point

  
  //Get the Pvector for the ending point

  ePoint = new PVector(random(50, 1230), random(50, 650), random(50, 100));
  //Draw a line between the two
  //line(sPoint.x, sPoint.y, ePoint.x, ePoint.y);
  l.add (new Line(sPoint,ePoint));
  //The ending point now becomes the starting point
  sPoint = ePoint;
  //Repeat the process
  
  randomX = randomX + 1;//random(1,20);
  randomY = randomY + 2;//random(1,20);
  randomZ = randomZ + 3;//random(1,20);
  ePoint = new PVector(randomX, randomY, randomZ);

    
    for (int i = 0; i < l.size() ; i++)
    {
      l.get(i).Draw();
    }
    
}