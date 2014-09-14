void setup() {
  size(600, 600); // set the dimensions of the window
  background(255, 255, 255); // set background color to white
}

void draw() {
//  background(255);
  
  fill(255, 255, 0); // fill color: yellow
  stroke(0, 0, 0); // outline: black
  
  /*
  mouseX and mouseY are built-in variables
  that contain the current x and y position
  of the mouse cursor.  
  */
  // draw with a diameter of 20 pixels at mouse position
  ellipse(mouseX, mouseY, 20, 20);
}

