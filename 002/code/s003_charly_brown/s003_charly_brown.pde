int background_color = color(28, 150, 173);
int skin_color = color(246, 206, 157);
int shirt_color = color(253, 209, 12);

float stroke_weight = 8;

void setup() {
  size(640, 640);
//  noLoop();
}

void draw() {
  background(background_color);
  
  // I broke down the recipe for drawing the character
  // into multiple steps. for each of the steps I wrote
  // a new function (see below).
  draw_left_ear();
  draw_head();
  draw_right_ear();
  draw_eyes();
  draw_nose();
  draw_mouth();
}

void draw_head() {
  fill(skin_color);
  stroke(0);
  strokeWeight(stroke_weight);
  
  // upper half
  pushMatrix();
    translate(314, 278);
    beginShape();
      vertex(384/2, 0);
      quadraticVertex(+165, -149*1.5, 0, -149*1.5);
      quadraticVertex(-185, -149*1.5, -384/2, 0);
      vertex(-384/2, 0);
    endShape();
  popMatrix();
  
  // lower half
  pushMatrix();
    float stretch_factor = 1.0;
    translate(314, 278);
    scale(1.0/stretch_factor, 1);
    arc(0, 0, stretch_factor*384, 149*2, radians(0), radians(180), OPEN);
  popMatrix();
}

void draw_eyes() {
  noStroke();
  fill(0);
  
  // storing the diameter in a variable
  // makes it easier to change the size
  // of his eyes later.
  // we only have to change a single line
  // of code!
  float eye_diameter = 20;
  float eye_distance = 110;
  
  pushMatrix();
    translate(315, 207);
    ellipse(-eye_distance/2, 0, eye_diameter, eye_diameter);
    ellipse(eye_distance/2, 0, eye_diameter, eye_diameter);
    
    strokeWeight(stroke_weight / 2.5);
    stroke(0);
    noFill();
    float left_eyebrow_x_offset = -(eye_distance/2) -8;
    float left_eyebrow_y_offset = -45;
    pushMatrix();
      translate(left_eyebrow_x_offset, left_eyebrow_y_offset);
      scale(1, -1);
      arc(0, 0, 30, 15, radians(20), radians(180-20), OPEN);
    popMatrix();
    
    float right_eyebrow_x_offset = (eye_distance/2) - 5;
    float right_eyebrow_y_offset = left_eyebrow_y_offset + 3;
    pushMatrix();
      translate(right_eyebrow_x_offset, right_eyebrow_y_offset);
      scale(1, -1);
      arc(0, 0, 25, 15, radians(30), radians(180-30), OPEN);
    popMatrix();
  popMatrix();
}

void draw_nose() {
  noFill();
  stroke(0);
  strokeWeight(stroke_weight);
  
  beginShape();
    vertex(332, 182);
    quadraticVertex(285, 180, 279, 220);
    quadraticVertex(280, 260, 338, 246);
    vertex(338, 246);
  endShape();
}

void draw_left_ear() {
  fill(skin_color);
  stroke(0);
  strokeWeight(stroke_weight);
  
  ellipse(123, 278, 45, 60);
}

void draw_right_ear() {
  fill(skin_color);
  stroke(0);
  strokeWeight(stroke_weight);
  
  pushMatrix();
    translate(515, 260);
    scale(-1, 1);
    arc(0, 0, 60, 88, radians(45), radians(360-45), OPEN);
  popMatrix();
}

void draw_mouth() {
  noFill();
  stroke(0);
  strokeWeight(stroke_weight);
  
  pushMatrix(); // store the current transformation
    translate(315, 311); // move to center of mouth
    scale(1, -1); // mirror horizontally
    arc(0, 0, 118*2, 64*2, radians(170), radians(360+10), OPEN);
  popMatrix(); // restore transformation to previous state
}
