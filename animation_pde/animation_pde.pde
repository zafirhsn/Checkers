

void setup() {
  size(400,400);
  ellipse(200,200,100,100);
  ellipse(300,300,100,100);
  loadPixels();
  frameRate(120);
  
}

boolean checkClick() {
  return (mousePressed && get(mouseX, mouseY) == -1);
  
 //(pixels[mouseY*width+mouseX] == -1));
}

void draw() {
  if (checkClick()) {
    background(124);
    ellipse(300,300,100,100);
    ellipse(mouseX, mouseY, 100, 100);
     
  }

}