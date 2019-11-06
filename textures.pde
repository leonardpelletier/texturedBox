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

  //directionalLight(, 126, 126, 0, -100, 0);
  
  for (int x = -1000; x < 1000; x += 100) {
    for (int z = -1000; z < 0; z += 100) {
      texturedBox(dirt_top, dirt_side, dirt_bottom, x, height/2+200, z, 50);
    }
  }
 
  
}

void texturedBox(PImage top, PImage side, PImage bottom, float x, float y, float z, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  
  rotateX(rotx);
  rotateY(roty);
  
  beginShape(QUADS);
  noStroke();
  texture(side);
  
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
  
  // +X Side Face
  vertex(1, -1,  1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1,  1, -1, 1, 1);
  vertex(1,  1,  1, 0, 1);
  
  // -X Side Face
  vertex(-1, -1,  1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
  
  endShape();
  
  beginShape();
  texture(bottom);
  
  // +Y Bottom Face
  vertex(-1, 1, -1, 0, 0);
  vertex( 1, 1, -1, 1, 0);
  vertex( 1, 1,  1, 1, 1);
  vertex(-1, 1,  1, 0, 1);
  
  endShape();
  
  beginShape();
  texture(top);
  
  // -Y Top Face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);
  
  endShape();
  
  popMatrix();
}



void mouseDragged() {
    rotx = rotx + (pmouseY - mouseY) * 0.01;
    roty = roty + (pmouseX - mouseX) * 0.01;
}
