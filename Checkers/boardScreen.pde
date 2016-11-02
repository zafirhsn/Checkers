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
    red_pieces = new ArrayList<Piece>();
    black_pieces = new ArrayList<Piece>();
    locations = new ArrayList<Integer>();
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
    check if someone won
      - if someone won, display winner screen, and exit to main menu or play again
    otherwise, see whose turn it is
      - disable the other player's peices
    player hovers over and clicks their piece
      - piece becomes bigger
      - player moves their piece (need to update x and y so piece can move beyond size)
      - program checks if move is valid (king / diagonal)
      - program snaps piece onto closest checker / puts it back to where it was
      - if player kills a piece, remove piece
      - end of board becomes king
      */
    
    if (red_turn) {
      for (int i = 0; i < red_pieces.size(); i++) {
        if ((red_pieces.get(i).overPiece()) && mousePressed && get(mouseX,mouseY) == #FF3232 ) {
            image(getBG(), 0, 0);
            image(getFG(), (width-getFG_l())/2, (height-getFG_h())/2,
            getFG_l(), getFG_h());
            for (int k = 0; k < black_pieces.size(); k++) {
              black_pieces.get(k).pieceDraw();
            }
            for (int j = 0; j < red_pieces.size(); j++) {
              if (j == i) {
                red_pieces.get(i).setX(mouseX);
                red_pieces.get(i).setY(mouseY);
                red_pieces.get(i).pieceDraw(mouseX, mouseY);
              }
              else {
                red_pieces.get(j).pieceDraw();
              }
            }
        }
      }
    }
  }
}