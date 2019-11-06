PImage qblock, dirt_top, dirt_side, dirt_bottom;
float rotx = PI/4, roty = PI/4;

void setup() {
  size(800, 600, P3D);
  qblock      = loadImage("qblock.png");
  dirt_top    = loadImage("dirt_top.png");
  dirt_side   = loadImage("dirt_side.jpg");
  dirt_bottom = loadImage("dirt_bottom.jpg");
  
  textureMode(NORMAL);
}

void draw() {
  background(255);
  
  pushMatrix();
  translate(width/2, height/2);
  rotateX(rotx);
  rotateY(roty);
  scale(100);
 
  texturedBox(qblock);
 
  popMatrix();
}

void texturedBox(PImage tex) {
  beginShape(QUADS);
  noStroke();
  texture(tex);
  
  // +Z Front Face
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1,  1, 1, 1, 1);
  vertex(-1,  1, 1, 0, 1);
  
  // -Z Back Face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  
  endShape();
}



void mouseDragged() {
    rotx = rotx + (pmouseY - mouseY) * 0.01;
    roty = roty + (pmouseX - mouseX) * 0.01;
}
