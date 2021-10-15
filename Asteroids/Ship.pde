class Ship extends GameObject {
  //1. Instance Variables
  PVector direction;
  //PVector directionX, directionY;
  int shotTimer, threshold;

  //2. Constructor(s)
  Ship() {
    lives = 3;
    loc = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    //directionX = new PVector(-0.1, 0);
    //directionY = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 30;
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(direction.heading());
    //rotate(atan2(mouseY - location.y, mouseX - location.x)); //https://forum.processing.org/one/topic/make-a-movable-object-player-turn-to-face-where-the-mouse-is.html
    noFill();
    strokeWeight(5);
    stroke(255);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();
  }

  void act() {
    super.act();
    
    shotTimer++;
    
    //if (upkey || wkey) velocity.add(directionY);
    //if (downkey || skey) velocity.sub(directionY);
    //if (leftkey || akey) velocity.add(directionX);
    //if (rightkey || dkey) velocity.sub(directionX);
    if (upkey || wkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
    }
    if (downkey || skey) {
      velocity.sub(direction);
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
