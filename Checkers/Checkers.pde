private Menu menu;
private Help help_screen;
private boardScreen board_screen; 
private ArrayList<Piece> red_pieces;
private ArrayList<Piece> black_pieces;

void setup() {
  //Menu screen is created, all buttons are setup and drawn on Menu screen
  size(800, 800);
  frameRate(200);
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