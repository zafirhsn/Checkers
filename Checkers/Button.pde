public class Button {
  private int x_cor;
  private int y_cor;
  private int b_length;
  private int b_height;
  private String text;
  private float x_buffer;
  private float y_buffer;
  private int text_size;
   
   
  //Constructor 
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
    //buffer on the top and bottom of buttons
    y_buffer = b_height - (b_height - text_height)/2;
    //buffer on the left and right of buttons
    x_buffer = (b_length - text_length)/2;   
  }   
  
  //Draw the button as a white rectangle with text in it
  public void drawButton() {
    fill(255);
    rect(x_cor, y_cor, b_length, b_height, 6, 6, 6, 6);
    fill(0);
    textSize(text_size);
    //place text at x_buffer from x_cor etc. 
    text(text, (x_cor + x_buffer), (y_cor + y_buffer));
  }
  
  //Behavior of button when mouse is hovering over it (fill it green)
  public void drawHoverButton() {  
     fill(0,200,0,50);
     rect(x_cor, y_cor, b_length, b_height, 6, 6, 6, 6);
     fill(0);
     text(text, (x_cor + x_buffer), (y_cor + y_buffer));
  } 
  
  //Check to see if mouse is over the button
  public boolean overButton() {
    if ((mouseX >= x_cor && mouseX <= (x_cor + b_length)) 
      && (mouseY >= y_cor && mouseY <= (y_cor + b_height))) {
        return true;
    }
    return false;
  }
  
  //Check to see if the button is clicked 
  public boolean clickButton() {
    if ((mousePressed && (mouseButton == LEFT)) && overButton()) {
      return true;
    }
    return false;
  }
}