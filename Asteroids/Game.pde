void game() {
  background(0);

  //Ship
  myShip.show();
  myShip.act();

  //Bullets
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
    i++;
  }
}

void gamePressed() {
  main = GAMEOVER;
}
