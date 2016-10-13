

void setup() {
  size(400,400);
  ellipse(200,200,100,100);
  loadPixels();
  createGraphics(400,400);
  
}

boolean checkClick() {
  return (mousePressed && (pixels[mouseY*width+mouseX] == -1));
}

void draw() {
  if (checkClick()) {
    clear();
    ellipse(mouseX, mouseY, 100, 100);
  }

}