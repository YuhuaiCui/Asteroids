class Ship extends GameObject {
  //1. Instance Variables

  PVector direction;

  //2. Constructor(s)
  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noFill();
    stroke(255);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();
  }

  void act() {
    super.act();
    if (upkey || wkey) velocity.add(direction);
    if (downkey || skey) velocity.sub(direction);
    if (leftkey || akey) direction.rotate(-radians(5));
    if (rightkey || dkey) direction.rotate(radians(5));
    if (spacekey) myObjects.add(new Bullet());
  }
}//End of Ship class
