import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Pong

//mode framework ============================================
int mode;
final int INTRO     = 1;
final int GAME      = 2;
final int PAUSE     = 3;
final int GAMEOVER  = 4;

//game variables ===========================================
float redX, redY, pD, blueX, blueY; //paddles
float ballX, ballY, bD; //balllllllllll
float vx, vy; // determining the ball's movement
int redScore, blueScore, timer;
boolean AI;
float logoSize;
int logoExpansionVariable;

//keyboard variables =======================================
boolean wKey, sKey, upKey, downKey;

//font and image variables =================================
PFont font;

//sound variables ==========================================
Minim minim; 
AudioPlayer bump, goal, bounce, win, theme;

//color pallette
color white      = #FFFFFF; 
color red        = #FF0000;
color pink       = #FF6ABC;
color lightBlue  = #00FCEE;
color blue       = #324BE3;
color gray       = #818183;
color lightGreen = #00FF00;
color medGreen   = #006C27;
color yellow     = #F6FF05;
color orange     = #FF7E05;
color brown      = #341F18; 
color black      = #000000;

//functions ================================================
void setup() {
  size(1500,800);
  mode = INTRO;
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
  logoSize = height/4;
  logoExpansionVariable = 1;
  //initalize paddles =======================================
  redX = 0;
  redY = height/2;
  pD = height/3.5;
  blueX = width;
  blueY = height/2;
  
  //initalize ball ==========================================
  ballX = width/2;
  ballY = height/2;
  bD = height*0.0714; 
  //determine the direction and speed of the ball============
  float angle = random(-PI/4, PI/4);
  float leftRight = random(0, 1);
  if (leftRight > 0.5) {
    angle += PI; 
  }
  float hyp = 7;
  vx = cos(angle)*hyp;
  vy = sin(angle)*hyp;
  // ========================================================
  
  //initialize keyboard variables ===========================
  wKey = sKey = upKey = downKey = false;
  
  //initializing score ======================================
  redScore = blueScore = 0;
  timer = 50;
  
  //initializing font and images ============================
  font = createFont("dafont.ttf",200);
  
  //minim sound effect ======================================
  minim = new Minim(this);
  bump   = minim.loadFile("bounce.mp3"); //hit paddle
  goal   = minim.loadFile("goal.wav"); //scoring
  bounce = minim.loadFile("bump.mp3"); //hit wall
  win    = minim.loadFile("win.mp3"); //win!!!
  theme  = minim.loadFile("theme.mp3");
}

void draw() {
  textFont(font);
  if (mode==INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}

void pausing() {
  if (mouseX > width/2-height/24 && mouseX < width/2+height/24 && mouseY > height/8-height/12 && mouseY < height/8+height/24) {
    stroke(red);  
    fill(pink);
  } else {
    stroke(white);
    fill(lightBlue);
  }
  square(width/2,height/8,height/12);
}
