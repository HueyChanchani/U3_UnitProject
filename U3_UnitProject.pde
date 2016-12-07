import de.voidplus.soundcloud.*;
import ddf.minim.*;
import ddf.minim.analysis.BeatDetect;

SoundCloud soundcloud;
Minim minim;
AudioPlayer player;
BeatDetect beat;

boolean beatIt = false;

float kickSize, snareSize, hatSize;

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

  frameRate(60);
  fullScreen(P3D);

  Cam = new PeasyCam(this, 100);
  Cam.setMinimumDistance(50);
  Cam.setMaximumDistance(700);

  l = new ArrayList<Line>();
  sPoint = new PVector(random(width), random(height), random(0, 500));

  // http://soundcloud.com/you/apps for APP_CLIENT_ID and APP_CLIENT_SECRET
  soundcloud = new SoundCloud("Q4ck8fEuIGyH8YAEQtR9QE0bw3AfoYOj", "kftqice8woRAuNfyHWQB4Wo5GKioSesE");

  //If you need any permissions:
  soundcloud.login("hueychanchani", "manakasachin23");

  // show user details
  User me = soundcloud.get("me");
  println(me);

  // play the first track of search
  ArrayList<Track> result = soundcloud.findTrack("Kung Fu - Part Native Remix");
  if (result!=null)
  {
    println("Tracks: "+result.size());
    minim = new Minim(this); 
    player = minim.loadFile(result.get(0).getStreamUrl());
  }

  beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  beat.setSensitivity(100);
  player.play();
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
  //Draw a line between the two
  //line(sPoint.x, sPoint.y, ePoint.x, ePoint.y);
  l.add (new Line(sPoint, ePoint));
  //The ending point now becomes the starting point
  sPoint = ePoint;
  //Repeat the process

  randomX = randomX + 1;//random(1,20);
  randomY = randomY + 2;//random(1,20);
  randomZ = randomZ + 3;//random(1,20);
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
    fill(random(0, 255));
    for (int i = 0; i < l.size(); i++)
    {
      l.get(i).Draw();
    }
  }
  beatIt = false;
}