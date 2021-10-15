//"DBUTTONS" VERSION 1.0 BY DANIEL CUI - ALL RIGHTS RESERVED © 2021 (hahahahaha)

//THANK YOU FOR USING "DRY BUTTONS (AKA DButtons)" BY DANIEL CUI :D

//Manual:
//Rectangular DButtons: 

//Requires parameters such as (x-coordinate, y-coordinate, width, height, base color, hovered color)

//Optional:
//If you would like to set a stroke, it requires parameters such as (x-coordinate, y-coordinate, width, height, base color, hovered color)

//If you would like to have your stroke change upon mouse hover, it requires parameters such as (x-coordinate, y-coordinate, width, height, base color, hovered color, base stroke color, hovered stroke color)

//Circular DButtons: 

//Requires parameters such as (x-coordinate, y-coordinate, diameter, base color, hovered color)

//Optional:
//If you would like to set a stroke, it requires parameters such as (x-coordinate, y-coordinate, diameter, base color, hovered color)

//If you would like to have your stroke change upon mouse hover, it requires parameters such as (x-coordinate, y-coordinate, diameter, base color, hovered color, base stroke color, hovered stroke color)

class Button { //Start of Buttons Class
  boolean clicked;
  color c = blue;

  //calling Base Buttons
  Button(float x, float y, float d, color baseColor, color hoverColor) {
    showCircle(x, y, d, baseColor, hoverColor);
    actCircle(x, y, d);
  }

  Button(float x, float y, float w, float h, color baseColor, color hoverColor) {
    showRect(x, y, w, h, baseColor, hoverColor);
    actRect(x, y, w, h);
  }
  //End of calling Base Buttons

  //calling Set Stroke Buttons
  Button(float x, float y, float d, color baseColor, color hoverColor, color strokeColor) {
    showCircleSStroke(x, y, d, baseColor, hoverColor, strokeColor);
    actCircle(x, y, d);
  }

  Button(float x, float y, float w, float h, color baseColor, color hoverColor, color strokeColor) {
    showRectSStroke(x, y, w, h, baseColor, hoverColor, strokeColor);
    actRect(x, y, w, h);
  }
  //End of calling Set Stroke Buttons

  //calling Changing Stroke Buttons
  Button(float x, float y, float d, color baseColor, color hoverColor, color baseStrokeColor, color hoverStrokeColor) {
    showCircleCStroke(x, y, d, baseColor, hoverColor, baseStrokeColor, hoverStrokeColor);
    actCircle(x, y, d);
  }

  Button(float x, float y, float w, float h, color baseColor, color hoverColor, color baseStrokeColor, color hoverStrokeColor) {
    showRectCStroke(x, y, w, h, baseColor, hoverColor, baseStrokeColor, hoverStrokeColor);
    actRect(x, y, w, h);
  }
  //End of calling Changing Stroke Buttons

  //Base Buttons
  void showCircle(float x, float y, float d, color baseColor, color hoverColor) {
    strokeWeight(5);
    stroke(c);
    if (dist(mouseX, mouseY, x, y) <= d/2) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    circle(x, y, d);
  }

  void actCircle(float x, float y, float d) {
    if (mousePressed && (dist(mouseX, mouseY, x, y) <= d/2)) {
      clicked = true;
    } else {
      clicked = false;
    }
  }

  void showRect(float x, float y, float w, float h, color baseColor, color hoverColor) {
    rectMode(CENTER);
    strokeWeight(5);
    stroke(c);
    if (mouseX >= x - w/2 && mouseY >= y - h/2 && mouseX <= x + w/2 && mouseY <= y + h/2) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    rect(x, y, w, h);
  }

  void actRect(float x, float y, float w, float h) {
    if (mouseX >= x - w/2 && mouseY >= y - h/2 && mouseX <= x + w/2 && mouseY <= y + h/2) {
      clicked = true;
    } else {
      clicked = true;
    }
  } //End of Base Buttons

  //Buttons with SET stroke
  void showCircleSStroke(float x, float y, float d, color baseColor, color hoverColor, color strokeColor) {
    strokeWeight(5);
    if (strokeColor == base) {
      stroke(c);
    } else {
      stroke(strokeColor);
    }
    if (dist(mouseX, mouseY, x, y) <= d/2) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    circle(x, y, d);
  }

  void showRectSStroke(float x, float y, float w, float h, color baseColor, color hoverColor, color strokeColor) {
    rectMode(CENTER);
    strokeWeight(5);
    if (strokeColor == base) {
      stroke(c);
    } else {
      stroke(strokeColor);
    } 
    if (mouseX >= x - w/2 && mouseY >= y - h/2 && mouseX <= x + w/2 && mouseY <= y + h/2) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    rect(x, y, w, h);
  }
  //End of Buttons with SET Stroke

  //Buttons with Changing Strokes
  void showCircleCStroke(float x, float y, float d, color baseColor, color hoverColor, color baseStrokeColor, color hoverStrokeColor) {
    strokeWeight(5);
    if (baseStrokeColor == base) {
      stroke(c);
    } else {
      stroke(baseStrokeColor);
    }
    if (dist(mouseX, mouseY, x, y) <= d/2) {
      if (hoverStrokeColor != base) {
        stroke(hoverStrokeColor);
      }
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    circle(x, y, d);
  }

  void showRectCStroke(float x, float y, float w, float h, color baseColor, color hoverColor, color baseStrokeColor, color hoverStrokeColor) {
    rectMode(CENTER);
    strokeWeight(5);
    if (baseStrokeColor == base) {
      stroke(c);
    } else {
      stroke(baseStrokeColor);
    } 
    if (mouseX >= x - w/2 && mouseY >= y - h/2 && mouseX <= x + w/2 && mouseY <= y + h/2) {
      if (hoverStrokeColor != base) {
        stroke(hoverStrokeColor);
      }
      fill(hoverColor);
    } else {
      fill(baseColor);
    }
    rect(x, y, w, h);
  }
  //End of Buttons with Changing Strokes
} //End of Buttons Class
