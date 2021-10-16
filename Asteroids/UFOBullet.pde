class UFOBullet extends GameObject {
  
  int timer; 
  
  UFOBullet(float x, float y, float vx, float vy) {
    timer = 60;
    lives = 1;
    loc = new PVector(x, y);
    velocity = new PVector(vx, vy);
    //velocity = new PVector(mouseX - location.x, mouseY - location.y);
    velocity.setMag(10);
    size = 20;
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
