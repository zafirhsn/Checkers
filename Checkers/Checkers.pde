//This comment is used for testing
private PImage bg;
private PImage fg;
private PImage backarrow;

private PImage b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12;
private PImage r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;

private PFont font;

private int startboxX = 185;
private int startboxY = 370;
private int helpboxX = 450;
private int helpboxY = 370;

private boolean menuScreen = true;
private boolean boardScreen = false;
private boolean helpScreen = false;


void setup() {
  size(800, 800);
  
  //Load background images onto window (wood, checkerboard)
  createBackground();

  //Creates title
  fill(255);
  createTitle();

  //Creates start and help buttons
  fill(255);
  createStart();
  createHelp();
}

//=============================================
//These functions create everything needed in the Menu screen
void createBackground() {
  bg = loadImage("wood.png");
  fg = loadImage("checkers.jpg");
  image(bg, 0, 0);
  tint(255, 150);
  image(fg, (width-650)/2, (height-650)/2, 650, 650);
}

void createTitle() {
   rect((width-530)/2, (height-580)/2, 550, 100, 6, 6, 6, 6);
   fill(0);
   textSize(100);
   textAlign(CENTER, CENTER);
   text("CHECKERS", (width+10)/2, (height-500)/2);
}

void createStart() {
  rect(startboxX, startboxY, 170, 70, 6, 6, 6, 6);
  fill(0);
  textSize(50);
  textAlign(RIGHT, CENTER);
  text("START", (width-100)/2, height/2);
}

void createHelp() {
  rect(helpboxX, helpboxY, 170, 70, 6, 6, 6, 6);
  fill(0);
  textAlign(LEFT, CENTER);
  text("HELP", (width+150)/2, height/2);
}
//====================================================


//=======BACK ARROW=========
void createBack() {
  ellipse(30, 30, 50, 50);
  backarrow = loadImage("backarrow.png");
  image(backarrow, 5, 5, 50, 50);
}
//==========================


void hoverMenuScreen() {
  if (overStart()) {
    fill(0,200,0,50);
    createStart(); 
  }
  else {
    fill(255);
    createStart();
  }
  if (overHelp()) {
    fill(200,0,0,50);
    createHelp();
  }
  else {
    fill(255);
    createHelp();
  }
}

void hoverBack() {
  if (overBack()) {
     fill(180,0,0); 
     createBack();
  }
 else {
    fill(255);
    createBack();
 }
} 

void draw() {
  //Start and help buttons are redrawn a different shade when mouse hovers over
  if (menuScreen) {
    hoverMenuScreen();
    clickStart();
    clickHelp();
  }
 if (helpScreen || boardScreen) {
    hoverBack();
    clickBack();
 }
 
 if (boardScreen) {
    setupPieces();
 }
}


//============================================================
//These functions check to see if the mouse if hovering over any buttons
boolean overStart() {
  if ((mouseX >= startboxX && mouseX <= (startboxX + 170)) && (mouseY >= startboxY && mouseY <= (startboxY + 70))) {
    return true;
  }
  return false;
}

boolean overHelp() {
  if ((mouseX >= helpboxX && mouseX <= (helpboxX + 170)) && (mouseY >= helpboxY && mouseY <= (helpboxY + 70))) {
    return true;
  }
  return false;
}

boolean overBack() {
  if ((mouseX >= 5 && mouseX <= 55) && (mouseY >= 5 && mouseY <= 55)) {
    return true;
  }
  return false;
}
//================================================================


//================================================================
//These functions check to see if the mouse clicked a button
void clickStart() {
  if ((mousePressed && (mouseButton == LEFT)) && overStart()) {
    menuScreen = false;
    boardScreen = true;
    helpScreen = false;
    image(bg, 0, 0);
    image(bg, 0, 0);
    image(bg, 0, 0);
    image(fg, (width-650)/2, (height-650)/2, 650, 650);
    image(fg, (width-650)/2, (height-650)/2, 650, 650);
  }
}

void clickHelp() {
  if ((mousePressed && (mouseButton == LEFT)) && overHelp()) {
    menuScreen = false;
    boardScreen = false;
    helpScreen = true;
    image(bg, 0, 0);
    createBack();
    fill(255);
    rect (50, 50, 700, 700, 6, 6, 6, 6);
    Rules();   
  }
}

void clickBack() {
  if ((mousePressed && (mouseButton == LEFT)) && overBack()) {
    if (helpScreen == true) { 
      menuScreen = true;
      boardScreen = false;
      helpScreen = false;
      image(bg, 0, 0);
      image(bg, 0, 0);
      image(bg, 0, 0);
      setup();
    }
    if (boardScreen == true) {
      menuScreen = true;
      boardScreen = false;
      helpScreen = false;
      image(bg, 0, 0);
      image(bg, 0, 0);
      image(bg, 0, 0);
      setup();
    }
  }
}
//============================================================
     
    
void Rules() {
  fill(0);
  
  //Used y to enable me to shift all text down/up at once instead of readjusting invidually
  int y = 70;
  
  textSize(30);
  text("RULES", 350, 20);
  
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

void GamePlay() {
  
}


void setupPieces() {
    b1 = b2 = b3 = b4 = b5 = b6 = b7= b8 = b9 = b10 = b11 = b12 = loadImage("blackchecker.png");
    r1 = r2 = r3 = r4 = r5 = r6 = r7 = r8 = r9 = r10 = r11 = r12 = loadImage("redchecker.png");
    
    //==========================
    image(b1, 165, 80, 70, 70);
    image(b2, 325, 80, 70, 70);
    image(b3, 485, 80, 70, 70);
    image(b4, 645, 80, 70, 70);
    
    
    image(b5, 85, 160, 70, 70);
    image(b6, 245, 160, 70, 70);
    image(b7, 405, 160, 70, 70);
    image(b8, 565, 160, 70, 70);
    
    image(b9, 165, 240, 70, 70);
    image(b10, 325, 240, 70, 70);
    image(b11, 485, 240, 70, 70);
    image(b12, 650, 240, 70, 70);
    //===========================
    image(r1, 85, 485, 70, 70);
    image(r2, 245, 485, 70, 70);
    image(r3, 405, 485, 70, 70);
    image(r4, 565, 485, 70, 70);
    
    image(r5, 165, 570, 70, 70);
    image(r6, 325, 570, 70, 70);
    image(r7, 485, 570, 70, 70);
    image(r8, 645, 570, 70, 70);
    
    image(r9, 85, 650, 70, 70);
    image(r10, 245, 650, 70, 70);
    image(r11, 405, 650, 70, 70);
    image(r12, 565, 650, 70, 70);
    //===========================
    
    
    
    
    
    
    
/*
    loadPixels();
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
   */
}