//Daniel Cui
//Asteroids
//Does this count as a shooter game?
//FINALLY DRY CODE WOOOOOOOOT!!!!!!! MADE A BUTTON CLASS!!!!!!

//booleans
boolean upkey, downkey, leftkey, rightkey, spacekey, wkey, skey, akey, dkey;

//colors
color indigo = #222B33;
color blue = #226275;
color turquoise = #80C0BF;
color darkGray = #C4BBBB;
color gray = #A09598;
color space = #506EE5;
color purple = #651F71;
color blurple = #7037CD;
color orange = #FF4D00;
color yellow = #FFC500;
color base;

//ints
int mode = 0;
final int HOME = 0;
final int GAME = 1;
final int GAMEOVER = 2;
int i;
int numberOfFrames;

//objects
Ship myShip;
ArrayList<GameObject> myObjects;
Button startButton;

//PImages
PImage[] gif;

//PFonts
PFont nasa;

//String
String leadingZero;

void setup() {
  size(1280, 720, FX2D);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);

  //nasa font
  nasa = createFont("nasalization-rg.otf", 128);

  //homescreen gif
  i = 1;
  leadingZero = "0";
  numberOfFrames = 40;
  gif = new PImage[numberOfFrames];
  while (i < numberOfFrames) {
    if (i < 10) leadingZero = "0";
    else leadingZero = "";
    gif[i] = loadImage("frame_apngframe" + leadingZero + i + ".png");
    i++;
  }

  //Game Objects
  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new UFO());
}

void draw() {
  if (mode == HOME) {
    home();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("MODE FRAMEWORK ERROR");
  }
}
