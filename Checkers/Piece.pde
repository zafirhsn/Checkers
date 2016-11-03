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
  
  //Draw the red or black peice
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
  
  //Draw the red or black piece where the mouse is 
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
  
  //Check to see if the mouse is over a piece
  public boolean overPiece() {
    return ((mouseX >= x_cor - (pic_width / 2)) && (mouseX <= x_cor + (pic_width / 2)) &&
            (mouseY >= y_cor - (pic_height / 2)) && (mouseY <= y_cor + (pic_height / 2)));
  }
  
  /*
  public void hoverPiece() {
    
  }
  */
  
    
}