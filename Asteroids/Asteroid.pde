class Asteroid extends GameObject {

  Asteroid() {
    lives = 1;
    loc = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = 100;
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    loc = new PVector(x, y);
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = s;
  }

  void show() {
    noFill();
    strokeWeight(5);
    stroke(255);
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
          if (size > 25) {
            myObjects.add(new Asteroid(size/2, loc.x, loc.y));
            myObjects.add(new Asteroid(size/2, loc.x, loc.y));
          }
        }
      }
      i++;
    }
  }
} //End of Asteroid
