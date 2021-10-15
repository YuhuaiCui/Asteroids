class GameObject {
  int lives;
  int size;
  PVector loc;
  PVector velocity;
  
  GameObject() {
    
  }
  
  void show() {
    
  }
  void act() {
    loc.add(velocity);
    if (loc.y < -50)         loc.y = height + 50;
    if (loc.y > height + 50) loc.y = -50;
    if (loc.x < -50)         loc.x = width + 50;
    if (loc.x > width + 50)  loc.x = -50;
  }
}
