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
  private ArrayList<Piece> black_pieces;
  private ArrayList<Piece> red_pieces;
  private boolean red_turn;
  private boolean black_turn;
  private ArrayList<Integer> locations;
  
  public boardScreen(String bg_pic, String fg_pic, int fg_length, int fg_height) {
    super(bg_pic, fg_pic, fg_length, fg_height);
    red_turn = false;
    black_turn = false;
  }
  public void setExit(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    exit_game = new Button(x_cor, y_cor, b_length, b_height, text, text_size);
  }
  
  final public boolean getRed_turn() {
    return red_turn;
  }
  
  final public boolean getBlack_turn() {
    return black_turn;
  }
  
  public void setRed_turn(boolean x) {
    red_turn = x;
  }
  
  public void setBlack_turn(boolean x) {
    black_turn = x;
  }
  
  public void setPieces() {
    locations = new ArrayList<Integer>();
    black_pieces = new ArrayList<Piece>();
    int x = 197;
    int y = 113;
    for (int i = 0; i < 12; i++) {
      if (i == 4) {
        x = 113;
        y = 195;
      }
      if (i == 8) {
        x = 197;
        y = 277;
      }
      Piece black = new Piece("BLACK",x,y,65,65);
      locations.add(x);
      locations.add(y);
      black_pieces.add(black);
      x += 163;
    }
    
    x = 113;
    y = 358;
    for (int i = 0; i < 8; i++) {
      if (i == 4) {
        x = 197;
        y = 438;
      }
      locations.add(x);
      locations.add(y);
    }
    
    
 //All red pieces are instantiated using a for loop that increments x and y cors
     red_pieces = new ArrayList<Piece>();
     x = 115;
     y = 684;
       for (int i = 0; i < 12; i++) {
        if (i == 4) {
          x = 197;
          y = 600;
        }
        if (i == 8) {
          x = 113;
          y = 520;
        }
        Piece red = new Piece("RED",x,y,65,65);
        locations.add(x);
        locations.add(y);
        red_pieces.add(red);
        x += 163;
       }
  }
  public void screenDraw() {
    image(getBG(), 0, 0);
    image(getFG(), (width-getFG_l())/2, (height-getFG_h())/2,
      getFG_l(), getFG_h());
    exit_game.drawButton();
    for (int i = 0; i < black_pieces.size(); i++) {
      (black_pieces.get(i)).pieceDraw();
    }
    for (int i = 0; i < red_pieces.size(); i++) {
      (red_pieces.get(i)).pieceDraw();
    }
    
  }
  public void screenRun() {
    if (exit_game.overButton()) {
      exit_game.drawHoverButton();
    }
    else {
      exit_game.drawButton();
    }
    /*
    check if someone one
      - if someone won, display winner screen, and exit to main menu or play again
    otherwise, see whose turn it is
      - disable the other player's peices
    player hovers over and clicks their piece
      - piece becomes bigger
      - player moves their piece
      - program checks if move is valid (king / diagonal)
      - program snaps piece onto closest checker / puts it back to where it was
      - if player kills a piece, remove piece
      - end of board becomes king
      */
    
    if (red_turn) {
      for (int i = 0; i < red_pieces.size(); i++) {
        if ((red_pieces.get(i).overPiece()) &&  mousePressed && get(mouseX,mouseY) == #FF3232 ) {
            println("Clicked piece");
            /*
            image(getBG(), 0, 0);
            image(getFG(), (width-getFG_l())/2, (height-getFG_h())/2,
            getFG_l(), getFG_h());
            for (int k = 0; k < black_pieces.size(); k++) {
              black_pieces.get(k).pieceDraw();
            }
            for (int j = 0; j < red_pieces.size(); j++) {
              if (j == i) {
                red_pieces.get(i).pieceDraw(mouseX, mouseY);
              }
              else {
                red_pieces.get(j).pieceDraw();
              }
            }
        }
        */
      }
    }
  }
}
}

public class Piece {
  //private int location;
  //private PImage pic;
  private String p_color;
  private int x_cor;
  private int y_cor;
  private int pic_width;
  private int pic_height;
  private boolean king; 

  public Piece(String p_color, int x_cor, int y_cor, int pic_width, int pic_height) {
    //pic = loadImage(pic_name);
    this.x_cor = x_cor;
    this.y_cor = y_cor;
    this.pic_width = 70;
    this.pic_height = 70;
    this.p_color = p_color;
    king = false;
  }
  
  final public boolean isKing() {
    return king; 
  }
  
  final public int getX() {
    return x_cor;
  }
  
  final public int getY() {
    return y_cor;
  }
  
  public void setKing(boolean x) {
    king = x;
  }
  
  public void setX(int x) {
    x_cor = x;
  }
  
  public void setY(int y) {
    y_cor = y;
  }
  
  public void pieceDraw() {
    if (p_color.toLowerCase().equals("red")) {
      fill(255,50,50);
    }
    else {
      fill(50,50,50);
    }
    ellipse(x_cor, y_cor, pic_width, pic_height); 
    //image(pic, x_cor, y_cor, pic_width, pic_height);
  }
  
  public void pieceDraw(int mouseX, int mouseY) {
     if (p_color.toLowerCase().equals("red")) {
      fill(255,50,50);
    }
    else {
      fill(50,50,50);
    }
    ellipse(mouseX, mouseY, pic_width, pic_height); 
    //image(pic, x_cor, y_cor, pic_width, pic_height);
  }
  
  public boolean overPiece() {
    return ((mouseX >= x_cor - (pic_width / 2)) && (mouseX <= x_cor - (pic_width / 2)) &&
        (mouseY >= y_cor - (pic_height / 2)) && (mouseY <= y_cor - (pic_width / 2)));   
  }
  
  /*
  public void hoverPiece() {
    
  }
  */
  
    
}
  
private Menu menu;
private Help help_screen;
private boardScreen board_screen; 
private ArrayList<Piece> red_pieces;
private ArrayList<Piece> black_pieces;

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
  board_screen.setPieces();
  board_screen.setState(false);
}

/*
void returnClicks() {
  if (mousePressed) {
    delay(100);
    println(mouseX, mouseY);
    set(mouseX, mouseY, 0);
  }
}
*/

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
    board_screen.setRed_turn(true);
    board_screen.screenRun();
    /*
    for (int i = 0; i < black_pieces.size(); i++) {
      (black_pieces.get(i)).pieceDraw();
    }
    for (int i = 0; i < red_pieces.size(); i++) {
      (red_pieces.get(i)).pieceDraw();
    }
    */
    //returnClicks();
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
  */
}