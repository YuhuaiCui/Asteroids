//Daniel Cui
//Asteroids
//Does this count as a shooter game?

//booleans
boolean upkey, downkey, leftkey, rightkey, spacekey, wkey, skey, akey, dkey;

//ints
int main = 0;
final int HOME = 0;
final int GAME = 1;
final int GAMEOVER = 2;

//objects
Ship myShip;
ArrayList<GameObject> myObjects;

void setup() {
  size(800, 600, FX2D);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);

  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
}

void draw() {
  if (main == HOME) {
    home();
  } else if (main == GAME) {
    game();
  } else if (main == GAMEOVER) {
    gameover();
  } else {
    println("MODE FRAMEWORK ERROR");
  }
}
