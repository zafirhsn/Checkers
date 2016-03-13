public class Button {
  public Button(int x_cor, int y_cor, int b_length, int b_height, String text) {
    float text_length = textWidth(text) * 4;
    float text_height = 40;
    //float text_height = text_size - 10;
    float y_buffer = b_height - (b_height - text_height)/2;
    float x_buffer = (b_length - text_length)/2;


    println(textWidth(text));
    fill(255);
    rect(x_cor, y_cor, b_length, b_height, 6, 6, 6, 6);
    fill(0);
    textSize(50); 
    text(text, (x_cor + x_buffer), (y_cor + y_buffer));
  }
  
}


void setup() {
  size(800, 800);
  Button start = new Button(185, 370, 170, 70, "Hello");
  println(textWidth("Hello"));
  Button help = new Button(450, 370, 170, 70, "Help");
  println(textWidth("Help"));
  Button new_button = new Button(500, 300, 170, 70, "WTF");
  println(textWidth("WTF"));
}

void draw() {
}