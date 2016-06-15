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
  public abstract void screenRun();
  public abstract void screenDraw();
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
  public void setBG(PImage bg) {
    this.bg = bg;
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
  public void screenDraw() {
    image(getBG(), 0, 0);
    tint(255, 150);
    image(getFG(), (width-getFG_l())/2, 
      (height-getFG_h())/2, getFG_l(), getFG_h());
    title.drawButton();
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
  public void screenRun() {
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
  private Button back;
  
  public Help(String bg_pic, String fg_pic, int fg_length, int fg_height) {
    super(bg_pic, fg_pic, fg_length, fg_height);
  }
  public void setBack(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    back = new Button(x_cor, y_cor, b_length, b_height, text, text_size);
  }
  public void screenDraw() {
    image(getBG(), 0, 0);
    fill(255);
    rect (50, 80, 700, 700, 6, 6, 6, 6);
    back.drawButton();
    drawRules();
  }
    
  public void screenRun() {  
    if (back.overButton()) {
      back.drawHoverButton();
    }
    else {
      back.drawButton();
    }
  }
  void drawRules() {
    fill(0);
    
    //Used y to enable me to shift all text down/up at once instead of readjusting invidually
    int y = 100;
    
    textSize(40);
    text("RULES", 335, 50);
    
    textSize(12);
    //Rule 1
    text("1. Checkers is played by two players. Each player begins the game with 12 colored discs. (Typically, one set of)", 80, y);
    text("pieces is black and the other red.", 80, y+15);
    
    //Rule 2
    text("2. The board consists of 64 squares, alternating between 32 dark and 32 light squares. It is positioned so that ", 80, y+40);
    text("each player has a dark square on the right side corner closest to him or her.", 80, y+55);
    
    //Rule 3
    text("3. Each player places his or her pieces on the 12 light squares closest to him or her.", 80, y+80);
    
    //Rule 4
    text("4. Black moves first. Players then alternate moves.", 80, y+105);
    
    //Rule 5
    text("5. Moves are allowed only on the light squares, so pieces always move diagonally. Single pieces are always limited ", 80, y+130);
    text("to forward moves (toward the opponent).", 80, y+145);
    
    //Rule 6
    text("6. A piece making a non-capturing move (not involving a jump) may move only one square.", 80, y+170);
    
    //Rule 7
    text("7. A piece making a capturing move (a jump) leaps over one of the opponent's pieces, landing in a straight ", 80, y+195);
    text("diagonal line on the other side. Only one piece may be captured in a single jump; however, multiple jumps", 80, y+210); 
    text("are allowed on a single turn.", 80, y+225);
    
    //Rule 8 
    text("8. When a piece is captured, it is removed from the board.", 80, y+250);
   
    //Rule 9
    text("9. If a player is able to make a capture, there is no option -- the jump must be made. If more than", 80, y+275);
    text("one capture is available, the player is free to choose whichever he or she prefers.", 80, y+290);
   
    //Rule 10
    text("10. When a piece reaches the furthest row from the player who controls that piece, it is crowned and becomes ", 80, y+315);
    text("a king. One of the pieces which had been captured is placed on top of the king so that it is twice as high as a", 80, y+330);
    text("single piece.", 80, y+345);
   
    //Rule 11
    text("11. Kings are limited to moving diagonally, but may move both forward and backward. (Remember that single,", 80, y+370);
    text("pieces i.e. non-kings, are always limited to forward moves.)", 80, y+385);
   
    //Rule 12
    text("12. Kings may combine jumps in several directions -- forward and backward -- on the same turn. Single pieces ", 80, y+410); 
    text("may shift direction diagonally during a multiple capture turn, but must always jump forward.", 80, y+425);
   
    //Rule 13
    text("13. A player wins the game when the opponent cannot make a move. In most cases, this is because all of the", 80, y+450);
    text("opponent's pieces have been captured, but it could also be because all of his pieces are blocked in.", 80, y+465);
   
    text("All rules were taken from http://boardgames.about.com/cs/checkersdraughts/ht/play_checkers.htm", 80, 650);
    text("Some minor rule changes for convenience", 80, 665);
  }
}

public class boardScreen extends Screen {
  private Button exit_game;
  
  public boardScreen(String bg_pic, String fg_pic, int fg_length, int fg_height) {
    super(bg_pic, fg_pic, fg_length, fg_height);
  }
  public void setExit(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    exit_game = new Button(x_cor, y_cor, b_length, b_height, text, text_size);
  }
  public void screenDraw() {
    image(getBG(), 0, 0);
    image(getFG(), (width-getFG_l())/2, (height-getFG_h())/2,
      getFG_l(), getFG_h());
    exit_game.drawButton();
  }
  public void screenRun() {
    if (exit_game.overButton()) {
      exit_game.drawHoverButton();
    }
    else {
      exit_game.drawButton();
    }
  }
}

public class Piece {
  private int location;
  private PImage pic;
  private int x_cor;
  private int y_cor;
  private int pic_width;
  private int pic_height;

  public Piece(String pic_name, int x_cor, int y_cor) {
    pic = loadImage(pic_name);
    this.x_cor = x_cor;
    this.y_cor = y_cor;
    pic_width = 70;
    pic_height = 70;
  }
  
  public void pieceDraw() {
    image(pic, x_cor, y_cor, pic_width, pic_height);
  }
  
  /*
  public void hoverPiece() {
    
  }
  */
    
}
  
private Menu menu;
private Help help_screen;
private boardScreen board_screen; 
private Piece r1, r2, r3, r4, r5, r6, r7;

void setup() {
  //Menu screen is created, all buttons are setup and drawn on Menu screen
  size(800, 800);
  menu = new Menu("wood.png", "checkers.jpg", 650, 650);
  menu.setStart(185, 370, 180, 70, "START", 50);
  menu.setHelp(450, 370, 180, 70, "HELP", 50);
  menu.setTitle(135, 110, 550, 100, "CHECKERS", 100);
  menu.setState(true);
  menu.screenDraw();
  menu.title.drawButton();
  menu.start.drawButton();
  menu.help.drawButton();
  
  //Help screen is instantiated, not drawn
  help_screen = new Help("wood.png", "checkers.jpg", 650, 650);
  help_screen.setBack(15, 15, 100, 50, "BACK", 30);
  help_screen.setState(false);
  
  //Board screen is instantiated, not drawn
  board_screen = new boardScreen("wood.png", "checkers.jpg", 650, 650);
  board_screen.setExit(15, 15, 100, 50, "EXIT", 30);
  board_screen.setState(false);
  
  r1 = new Piece("redchecker.png", 570, 650);
  r2 = new Piece("redchecker.png", 410, 650);
  r3 = new Piece("redchecker.png", 250, 650);
  r4 = new Piece("redchecker.png", 85, 650);
  r5 = new Piece("redchecker.png", 655, 575);
  r6 = new Piece("redchecker.png", 490, 575);
  r7 = new Piece("redchecker.png", 330, 575);
  
}

private boolean s = false;
void draw() {
  if (menu.getState() == true) {
    menu.screenRun();
    if (menu.help.clickButton()) {
      help_screen.screenDraw();
      help_screen.screenDraw();
      help_screen.screenDraw();
      help_screen.screenDraw();
      help_screen.screenDraw();
      help_screen.screenDraw();
      menu.setState(false);
      help_screen.setState(true);
      board_screen.setState(false);
    }
    else if (menu.start.clickButton()) {
      board_screen.screenDraw();
      board_screen.screenDraw();
      board_screen.screenDraw();
      board_screen.screenDraw();
      board_screen.screenDraw();
      board_screen.screenDraw();
      menu.setState(false);
      board_screen.setState(true);
      help_screen.setState(false);
    }
  }
  if (help_screen.getState() == true) {
    help_screen.screenRun();
    if (help_screen.back.clickButton()) {
      menu.screenDraw();
      menu.screenDraw();
      menu.screenDraw();
      menu.screenDraw();
      menu.screenDraw();
      menu.screenDraw();
      help_screen.setState(false);
      menu.setState(true);
      board_screen.setState(false);
    }
  }
  if (board_screen.getState() == true) {
    board_screen.screenRun();
    r1.pieceDraw();
    r2.pieceDraw();
    r3.pieceDraw();
    r4.pieceDraw();
    r5.pieceDraw();
    r6.pieceDraw();
    r6.pieceDraw();
    r7.pieceDraw();
  }
  /*
  if (s == false) {
    if (board_screen.getState() == true) {
        loadPixels();
        int a = 0;
        for (int i = 60075; i < 580000; i++) {
          if (a == 650) {
            i += 150;
            a = 0;
          }
          if (pixels[i] > color(150)) {
            pixels[i] = color(255);
          }
          else {
            pixels[i] = color(0);
          }
          a++;
          //delay(100);
        }
        s = true;
        updatePixels();
    }
      int a = 60075; 
      int z = 60075;
      for (int i=0;i<650;i++) {
        for (int h=0;h<650;h++){ 
          if (pixels[z] > color(150)) {
            pixels[z] = color(255);
            }
          else {
            pixels[z] = color(0);
          }
          z++;
        }
        a += 800;
        z = a;
      }
     updatePixels(); 
    
  }
  
    if (mousePressed && (mouseButton == LEFT)) {
      loadPixels();
      delay(1000);
      println(mouseX);
      print(mouseY);
      println();
      pixels[mouseY*width+mouseX] = #000000;
  }
  */
}