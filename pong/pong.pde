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
  size(1000,700);
  mode = INTRO;
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
  logoSize = height/4;
  logoExpansionVariable = 1;
  //initalize paddles =======================================
  redX = 0;
  redY = height/2;
  pD = width/6;
  blueX = width;
  blueY = height/2;
  
  //initalize ball ==========================================
  ballX = width/2;
  ballY = height/2;
  bD = width/20; 
  if (random(0,1) < 0.5) vx = -5;
  else vx = 5;
  vy = 0;
  
  //initialize keyboard variables ===========================
  wKey = sKey = upKey = downKey = false;
  
  //initializing score ======================================
  redScore = blueScore = 0;
  timer = 50;
  
  //initializing font and images ============================
  font = createFont("dafont.ttf",200);
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
  } else {
    stroke(white);
  }
  fill(lightGreen);
  square(width/2,height/8,height/12);
}
