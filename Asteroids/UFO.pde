class UFO extends GameObject {
  int r;

  UFO() {
    lives = 1;
    velocity = new PVector(0, 1);
    r = (int)((random(0, 1)) * 4 + 1);
    if (r == 1) {
      loc = new PVector(random(0, width), 0);
      velocity.rotate(PI);
    } else if (r == 2) {
      loc = new PVector(random(0, width), height);
    } else if (r == 3) {
      loc = new PVector(0, random(0, height));
      velocity.rotate(HALF_PI);
    } else if (r == 3) {
      loc = new PVector(width, random(0, height));
      velocity.rotate(-HALF_PI);
    } else {
      println("ERROR WITH INT \"r\" in UFO CLASS!");
    }
    size = 100;
  }

  void show() {
    fill(yellow);
    strokeWeight(5);
    stroke(turquoise);
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();

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
