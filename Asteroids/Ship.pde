class Ship extends GameObject {
  //1. Instance Variables
  PVector direction;
  //PVector directionX, directionY;
  int shotTimer, threshold;


  //2. Constructor(s)
  Ship() {
    lives = 3000000;
    loc = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    //directionX = new PVector(-0.1, 0);
    //directionY = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 30;
    size = 35;
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(direction.heading());
    //rotate(atan2(mouseY - location.y, mouseX - location.x)); //https://forum.processing.org/one/topic/make-a-movable-object-player-turn-to-face-where-the-mouse-is.html
    fill(brightBlue);
    noStroke();
    triangle(-20, -10, -20, 10, 20, 0);
    //the circle is for checking the hitbox
    //circle(0, 0, size);
    popMatrix();
  }

  void act() {
    super.act();
    
    println(lives);

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof UFOBullet || myObj instanceof Asteroid || myObj instanceof UFO) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size) {
          myObj.lives = 0;
          lives--;
        }
      }
      i++;
    }

    shotTimer++;

    //if (upkey || wkey) velocity.add(directionY);
    //if (downkey || skey) velocity.sub(directionY);
    //if (leftkey || akey) velocity.add(directionX);
    //if (rightkey || dkey) velocity.sub(directionX);
    
    //if (sqrt(velocity.x*velocity.x + velocity.y*velocity.y) > 2) {
    //  velocity.setMag(5);
    //}
    if (upkey || wkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
    }
    if (downkey || skey) {
      velocity.sub(direction);
      myObjects.add(new Fire());
    }
    if (leftkey || akey) {
      direction.rotate(-radians(5));
    }
    if (rightkey || dkey) {
      direction.rotate(radians(5));
    }
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }
  }
}//End of Ship class
