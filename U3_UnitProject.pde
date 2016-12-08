import ddf.minim.*;
import ddf.minim.analysis.BeatDetect;
import peasy.*;

Minim minim;
AudioPlayer player;
BeatDetect beat;
PeasyCam Cam;

boolean beatIt = false;

float kickSize, snareSize, hatSize;

ArrayList<Line> l;

float rotX = -0.5;

float randomX = 10;
float randomY = 10;
float randomZ = 10;

PVector sPoint = new PVector(randomX, randomY, randomZ);
PVector ePoint = new PVector(randomX, randomY, randomZ);

void setup()
{
  frameRate(30);
  fullScreen(P3D);

  Cam = new PeasyCam(this, 100);
  Cam.setMinimumDistance(20);
  Cam.setMaximumDistance(700);

  l = new ArrayList<Line>();
  sPoint = new PVector(random(width), random(height), random(0, 500));


  minim = new Minim(this); 
  player = minim.loadFile("Outkast - Aquemini.mp3");
  player.play();
  beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  beat.setSensitivity(100);
}

void draw() 
{
  background(0);
  beatDetect();
  rotateX(radians(rotX));
  rotateY(-.5);
  randomX = random(width);
  randomY = random(height);
  randomZ = random(0, 100);

  //Get the Pvector for the ending point
  ePoint = new PVector(random(width), random(height), random(0, 1000));
  //draw a new line between starting point and ending point -- from class Line
  l.add (new Line(sPoint, ePoint));
  //The starting point now becomes the ending point
  sPoint = ePoint;
  //set variables so that lines will be randomized sizes
  randomX = randomX + random(1, 20);
  randomY = randomY + random(1, 20);
  randomZ = randomZ + random(1, 20);
  //get the new end point
  ePoint = new PVector(randomX, randomY, randomZ);
}

void beatDetect()
{
  beat.detect(player.mix);

  if (beat.isKick())
  {
    beatIt = true;
    println("BUMP");
  }

  if (beatIt)
  {
    for (int i = 0; i < l.size(); i++)
    {
      l.get(i).Draw();
    }
  }
  beatIt = false;
}