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
  public abstract void runScreen();
  public void screenDraw() {
    image(bg, 0, 0);
    tint(255, 150);
    image(fg, (width-fg_length)/2, (height-fg_height)/2, fg_length, fg_height);
  }
  public void screenClear() {
    background(255);
  }
  final public boolean getState() {
    return state;
  }
  public void setState(boolean state) {
    this.state = state;
  }
  final public PImage getBG() {
    return bg;
  }
  final public PImage getFG() {
    return fg;
  }
  final public int getFG_l() {
    return fg_length;
  }
  final public int getFG_h() {
    return fg_height;
  }
}

public class Menu extends Screen {
  private Button start;
  private Button help;
  private Button title;
  
  public Menu(String bg_pic, String fg_pic, int fg_length, int fg_height) {
    super(bg_pic, fg_pic, fg_length, fg_height);
  }
  
  public void setStart(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    start = new Button(x_cor, y_cor, b_length, b_height, text, text_size);
  }
  public void setHelp(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    help = new Button(x_cor, y_cor, b_length, b_height, text, text_size);
  }
  public void setTitle(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    title = new Button(x_cor, y_cor, b_length, b_height, text, text_size);
  }
  public void runScreen() {
    if (start.overButton()) {
      start.drawHoverButton();
    }
    else {
    start.drawButton();
    }
    if (help.overButton()) {
      help.drawHoverButton();
    }
    else {
      help.drawButton();
    }
  } 
}

public class Help extends Screen {
  public Help(String bg_pic, String fg_pic, int fg_length, int fg_height) {
    super(bg_pic, fg_pic, fg_length, fg_height);
  }
  public void runScreen() {
    println("Gay");
  }
}

public class boardScreen extends Screen {
    public boardScreen(String bg_pic, String fg_pic, int fg_length, int fg_height) {
      super(bg_pic, fg_pic, fg_length, fg_height);
    }
    public void screenDraw() {
      image(super.getBG(), 0, 0);
      image(super.getFG(), (width-super.getFG_l())/2, (height-super.getFG_h())/2, 
        super.getFG_l(), super.getFG_h());
    }
    public void runScreen() {
      println("Gay");
    }
}
  
//private Button start;
//private Button help;
//private Button title;
private Menu menu;

void setup() {
  size(800, 800);
  //start = new Button(185, 370, 180, 70, "START", 50);
  //help = new Button(450, 370, 180, 70, "HELP", 50);
  //title = new Button(135, 110, 550, 100, "CHECKERS", 100);
  menu = new Menu("wood.png", "checkers.jpg", 650, 650);
  menu.setStart(185, 370, 180, 70, "START", 50);
  menu.setHelp(450, 370, 180, 70, "HELP", 50);
  menu.setTitle(135, 110, 550, 100, "CHECKERS", 100);
  menu.screenDraw();
  menu.title.drawButton();
  menu.start.drawButton();
  menu.help.drawButton();
}

void draw() {
  menu.runScreen();
}