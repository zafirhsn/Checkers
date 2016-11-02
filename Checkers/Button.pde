public class Button {
  private int x_cor;
  private int y_cor;
  private int b_length;
  private int b_height;
  private String text;
  private float x_buffer;
  private float y_buffer;
  private int text_size;
   
  public Button(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    this.x_cor = x_cor;
    this.y_cor = y_cor;
    this.b_length = b_length;
    this.b_height = b_height;
    this.text = text;
    this.text_size = text_size;
    textSize(text_size);
    float text_length = textWidth(text);
    float text_height = text_size - 15;
    y_buffer = b_height - (b_height - text_height)/2;
    x_buffer = (b_length - text_length)/2;   
  }   
  public void drawButton() {
    fill(255);
    rect(x_cor, y_cor, b_length, b_height, 6, 6, 6, 6);
    fill(0);
    textSize(text_size);
    text(text, (x_cor + x_buffer), (y_cor + y_buffer));
  }
  public void drawHoverButton() {  
     fill(0,200,0,50);
     rect(x_cor, y_cor, b_length, b_height, 6, 6, 6, 6);
     fill(0);
     text(text, (x_cor + x_buffer), (y_cor + y_buffer));
  } 
  public boolean overButton() {
    if ((mouseX >= x_cor && mouseX <= (x_cor + b_length)) 
      && (mouseY >= y_cor && mouseY <= (y_cor + b_height))) {
        return true;
    }
    return false;
  }
  public boolean clickButton() {
    if ((mousePressed && (mouseButton == LEFT)) && overButton()) {
      return true;
    }
    return false;
  }
}