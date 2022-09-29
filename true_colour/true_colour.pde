import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer success;
AudioPlayer fail;
AudioPlayer backgroundMusic;

int mode;
int INTRO=0;
int GAME=1;
int PAUSE=2;
int GAMEOVER=3;

//gif variables
PImage[] gif;
int frameNum;
int f;

//intro vatiables
int titlex;
int titley;
boolean add;

//color pallete 
color red=#f94144;
color orange=#fa7921;
color yellow=#fdf148;
color green=#3ec300;
color blue=#147df5;
color pink=#ff70a6;
color purple=#9b5de5;

color[] pallete={red, orange, yellow, green, blue, pink, purple};
String[] colorName={"red", "orange", "yellow", "green", "blue", "pink", "purple"};

//boolean-response
float p=random(0, 1);
int CindexNum;
int TindexNum;

//score
int highScore;
int score;

boolean matched;
boolean answerCorrect;

//font 
PFont font;
int tSize;

void setup() {
  size(800, 800);
  mode=INTRO;
  
  //gif
  f=0;
  frameNum=48;
  gif=new PImage[frameNum];

  for (int i=0; i<frameNum; i++) {
    gif[i]=loadImage("frame_"+i+"_delay-0.03s.gif");
  }
  
  //intro
  titlex=width/2;
  titley=height/2;
  textAlign(CENTER);
  add=false;
  
  //color generator 
  /*CindexNum=int(random(6));
  
  if(p<0.5){
    TindexNum=CindexNum;
  }else{
    TindexNum=int(random(6));
  }*/ 
  
  colorGenerator();
  
  //font
  font=createFont("diet-again.otf", 500);
  tSize=50;
  
  //sound
  minim=new Minim(this);
  success=minim.loadFile("SUCCESS.wav");
  fail=minim.loadFile("FAILURE.wav");
  backgroundMusic=minim.loadFile("MUSIC.mp3");
  
  backgroundMusic.play();
  
  //score 
  highScore=0;
}

void draw() {
  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode==PAUSE) {
    pause();
  } else if (mode==GAMEOVER) {
    gameOver();
  }else{
    println("Mode Error: Mode is "+mode);
  }
}
