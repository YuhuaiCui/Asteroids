int fireTimer;
int fireThreshold = 15;
int ufoTimer = 1000;
boolean mouseHold;

void game() {
  background(0);

  //Ship
  myShip.show();
  myShip.act();

  //Bullets
  fireTimer++;
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();


    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
  
  //UFO
  if (ufoTimer > 0) {
    ufoTimer--;
  } else {
    ufoTimer = 1000;
    myObjects.add(new UFO());
  }
  
  
  //holding mouse down to fire
  if (mousePressed && fireTimer > fireThreshold) {
    myObjects.add(new Bullet());
    fireTimer = 0;
  }
}

void gamePressed() {
/*  if (shotTimer > threshold) {
    myObjects.add(new Bullet());
    shotTimer = 0;
  } */
  //mouseHold = true;
}

void gameReleased() {
  //mouseHold = false;
}
