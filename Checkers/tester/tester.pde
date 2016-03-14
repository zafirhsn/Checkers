public class Button {
  private int x_cor;
  private int y_cor;
  private int b_length;
  private int b_height;
  private String text;
  private float x_buffer;
  private float y_buffer;
   
  public Button(int x_cor, int y_cor, int b_length, int b_height, String text) {
    this.x_cor = x_cor;
    this.y_cor = y_cor;
    this.b_length = b_length;
    this.b_height = b_height;
    this.text = text;
    textSize(50);
    float text_length = textWidth(text);
    float text_height = 40;
    //float text_height = text_size - 10;
    y_buffer = b_height - (b_height - text_height)/2;
    x_buffer = (b_length - text_length)/2;   
  }  
  
  public void drawButton() {
    fill(255);
    rect(x_cor, y_cor, b_length, b_height, 6, 6, 6, 6);
    fill(0);
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

//==============================================================
public abstract class Screen {
  private PImage bg;
  private PImage fg;
  private int fg_length;
  private int fg_height;
  private boolean state;
  
  public Screen(String bg_pic, String fg_pic, int fg_length, int fg_height) {
    bg = loadImage(bg_pic);
    fg = loadImage(fg_pic);
    this.fg_length = fg_length;
    this.fg_height = fg_height;
    state = false;
  }
  
  public void screenDraw() {
    image(bg, 0, 0);
    tint(255, 150);
    image(fg, (width-fg_length)/2, (height-fg_height)/2, fg_length, fg_height);
  }
  
  public void screenClear() {
    background(255);
  }
  
  public boolean getState() {
    return state;
  }
  
  public void setState(boolean state) {
    this.state = state;
  }
}

public class Menu extends Screen {
  public Menu(String bg_pic, String fg_pic, int fg_length, int fg_height) {
    super(bg_pic, fg_pic, fg_length, fg_height);
  }
}

public class Help extends Screen {
  public Help(String bg_pic, String fg_pic, int fg_length, int fg_height) {
    super(bg_pic, fg_pic, fg_length, fg_height);
  }
}

public class boardScreen extends Screen {
    public boardScreen(String bg_pic, String fg_pic, int fg_length, int fg_height) {
      super(bg_pic, fg_pic, fg_length, fg_height);
    }
    
    public void screenDraw() {
      image(bg, 0, 0);
      image((width-fg_length)/2, (height-fg_height)/2, fg_length, fg_height);
    }
}
  
private Button start;
private Button help;
private Button title;
private Menu menu;
void setup() {
  size(800, 800);
  start = new Button(185, 370, 180, 70, "START");;
  help = new Button(450, 370, 180, 70, "HELP");
  title = new Button(135, 110, 550, 100, "CHECKERS");
  menu = new Menu("wood.png", "checkers.jpg", 650, 650);
  menu.screenDraw();
  //menu.screenClear();
  //title.drawButton();
}



void draw() {
  start.drawButton();
  /*
  help.drawButton();
  if (start.overButton()) {
    start.drawHoverButton();
  }
  else {
    start.drawButton();
  }
  */
}