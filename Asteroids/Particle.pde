class Particle extends GameObject {
  int t; // transparency
  
  Particle() {
    lives = 1;
    size = 10;
    t = 255;
    //location = new PVector(myShip.location.x, myShip.location.y);
    loc = myShip.loc.copy();
    velocity = myShip.direction.copy();
    velocity.rotate(PI); //180 degrees
    velocity.setMag(5);
    
  }
  
  void show() {
    noStroke();
    fill(255, 0, 0, t);
    square(loc.x, loc.y, size);
  }
  
  void act() {
    super.act();
    t = t - 10;
    if (t <= 0) lives = 0;
  }
}
