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
PImage[] introGif;
PImage[] endGif;
int introFrameNum;
int endFrameNum;
int introF;
int endF;

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
float colorP=random(0, 1);
float patternP=random(0, 1);
int CindexNum;
int TindexNum;

//pattern-up-down
int textY;
int vy;

//score
int highScore;
int score;

boolean matched;
boolean answerCorrect;

//font 
PFont font;
PFont title; 
int tSize;

void setup() {
  size(800, 800);
  mode=INTRO;
  
  //gif
  introF=0;
  introFrameNum=48;
  endFrameNum=15;
  introGif=new PImage[introFrameNum];
  endGif=new PImage[endFrameNum];

  for (int i=0; i<introFrameNum; i++) {
    introGif[i]=loadImage("frame_"+i+"_delay-0.03s.gif");
  }
  
  for(int i=0; i<endFrameNum; i++){
    endGif[i]=loadImage("endframe_"+i+"_delay-0.07s.gif");
  }
  
  //intro
  titlex=width/2;
  titley=height/2;
  textAlign(CENTER);
  add=false; 
  
  colorGenerator();
  
  //font
  font=createFont("diet-again.otf", 500);
  tSize=50;
  
  //pattern-up-down
  textY=height/2;
  vy=-10;
  
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
