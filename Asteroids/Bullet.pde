class Bullet extends GameObject {
  
  int timer; 
  
  Bullet() {
    timer = 60;
    lives = 1;
    loc = new PVector(myShip.loc.x, myShip.loc.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    //velocity = new PVector(mouseX - location.x, mouseY - location.y);
    velocity.setMag(10);
    size = 10;
  }

  void show() {
    strokeWeight(3);
    stroke(255);
    noFill();
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();
    timer--;
    if (timer == 0) {
     lives = 0; 
    }
  }
}//End of bullet
