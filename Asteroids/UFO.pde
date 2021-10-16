class UFO extends GameObject {
  int r;
  int timer;
  int shotUFOTimer;
  int UFOThreshold;

  UFO() {
    lives = 1;
    velocity = new PVector(0, 1);
    r = (int)(random(0, 4));
    if (r == 0) {
      loc = new PVector(random(0, width), -size);
    } else if (r == 1) {
      loc = new PVector(random(0, width), height + size);
      velocity.rotate(PI);
    } else if (r == 2) {
      loc = new PVector(0, random(-size, height));
      velocity.rotate(HALF_PI * 3);
    } else if (r == 3) {
      loc = new PVector(width + size, random(0, height));
      velocity.rotate(HALF_PI);
    } else {
      println("ERROR WITH INT \"r\" in UFO CLASS!");
    }
    size = 100;
    shotUFOTimer = 0;
    UFOThreshold = 40;
  }

  void show() {
    fill(yellow);
    strokeWeight(5);
    stroke(turquoise);
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();

    shotUFOTimer++;
    if (shotUFOTimer > UFOThreshold) {
      myObjects.add(new UFOBullet(loc.x, loc.y, myShip.loc.x - loc.x, myShip.loc.y - loc.y));
      shotUFOTimer = 0;
    }

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size) {
          myObj.lives = 0;
          lives = 0;
        }
      }
      i++;
    }
  }
}
