ColorRect rect1, rect2, rect3;
int range;
boolean a, b, c;

void setup() {
  colorMode(HSB);
  size(1024, 600);
  background (200);
  range = 100;
  a = true;
  b = true;
  c = true;

  rect1 = new ColorRect(width/3 - 75, height/2, range*2, "ENVIRONMENTS", 255);
  rect2 = new ColorRect(width/2, height/2, range*2, "RELATIONSHIPS", 255);
  rect3 = new ColorRect(width-width/3 + 75, height/2, range*2, "SELF", 255);

  rect1.display();
  rect2.display();
  rect3.display();
}

void draw() {
  if (a == true) {
    if (mouseX < rect1.x + range && mouseX > rect1.x - range 
      && mouseY < rect1.y + range && mouseY > rect1.y - range) {
      displayRect1();
      if (mousePressed == true) {
        a = false;
      }
      if (key == 'a') {
        rect1.rectz = rect1.rectz - 5;
      }
      if (key == 's') {
        rect1.rectz = rect1.rectz + 5;
      }
    }
  }

  if (b == true) {
    if (mouseX < rect2.x + range && mouseX > rect2.x - range 
      && mouseY < rect2.y + range && mouseY > rect2.y - range) {
      displayRect2();
      if (mousePressed == true) {
        b = false;
      }
      if (key == 'a') {
        rect2.rectz = rect2.rectz - 5;
      }
      if (key == 's') {
        rect2.rectz = rect2.rectz + 5;
      }
    }
  }

  if (c == true) {
    if (mouseX < rect3.x + range && mouseX > rect3.x - range 
      && mouseY < rect3.y + range && mouseY > rect3.y - range) {
      displayRect3();
      if (mousePressed == true) {
        c = false;
      }
      if (key == 'a') {
        rect3.rectz = rect3.rectz - 5;
      }
      if (key == 's') {
        rect3.rectz = rect3.rectz + 5;
      }
    }
  }
}

void displayRect1() { 

  noStroke();
  fill(200);
  rectMode(CENTER);
  rect(width/3, height/2 + 175, 220, 100);
  rect1.display();

  rect1.rectx = map(mouseX, rect1.x - range, rect1.x + range, 0, 255);
  rect1.recty = map(mouseY, rect1.y - range, rect1.y + range, 255, 0);
  //rect1.rectz = hueBrightness1;
}

void displayRect2() {
  noStroke();
  fill(200);
  rectMode(CENTER);
  rect(width/2, height/2 + 175, 220, 100);
  rect2.display();

  rect2.rectx = map(mouseX, rect2.x - range, rect2.x + range, 0, 255);
  rect2.recty = map(mouseY, rect2.y - range, rect2.y + range, 255, 0);
  //rect2.rectz = hueBrightness2;
}

void displayRect3() {
  noStroke();
  fill(200);
  rectMode(CENTER);
  rect(width-width/3, height/2 + 175, 220, 100);
  rect3.display();

  rect3.rectx = map(mouseX, rect3.x - range, rect3.x + range, 0, 255);
  rect3.recty = map(mouseY, rect3.y - range, rect3.y + range, 255, 0);
  // rect3.rectz = hueBrightness3;
}

void keyPressed() {

  if (keyCode == ' ') {
    a = true;
    b = true;
    c = true;
  }
}


class ColorRect {

  float rectx, recty, rectz; //HSB color
  float x, y; //location
  float t; //width and height
  String name; //swatch name



    ColorRect (float ix, float iy, float it, String iname, float irectz) {
    x = ix;
    y = iy;
    t = it;
    name = iname;
    rectz = irectz;
  }

  void display() {
    smooth();
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(x, y, 225, 225);
    fill(rectx, recty, rectz);
    rect(x, y, t, t);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text(name, x, y - 150);
    textAlign(LEFT);
    textSize(16);
//    text("HUE: " + rectx, x-100, y + 150);
//    text("SATURATION: " + recty, x-100, y + 170);
  }
}

