int currentFrame = 1;
int gifTimer;
int gifThreshold = 1;

void home() {
  //background gif
  leadingZero= "0";
  imageMode(CORNER);
  image(gif[currentFrame], 0, 0, width, height);
  gifTimer++;
  if (gifTimer > gifThreshold) {
    currentFrame++;
    gifTimer = 0;
  }
  if (currentFrame ==  numberOfFrames) {
    currentFrame = 1;
  }
  if (currentFrame >= 10) leadingZero= "";
  
  //Asteroids text
  noStroke();
  fill(orange);
  textFont(nasa);
  textSize(100);
  text("Asteroids", width/2, height/2 - 20);
  
  //Start text
  startButton = new Button(width/2, height/2, 100, 100, blue, orange, purple, base);
  startButton = new Button(width/2, height/2, 100, gray, orange, purple);
  if (startButton.clicked == true) {
    mode = GAME;
  }
}

void homePressed() {
  //main = GAME;
}
