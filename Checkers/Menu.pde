public class Menu extends Screen {
  private Button start;
  private Button help;
  private Button title;
  
  public Menu(String bg_pic, String fg_pic, int fg_length, int fg_height) {
    super(bg_pic, fg_pic, fg_length, fg_height);
  }
  
  //Draw the menu screen (background, chess board, title button)
  public void screenDraw() {
    image(getBG(), 0, 0);
    tint(255, 150);
    image(getFG(), (width-getFG_l())/2, 
      (height-getFG_h())/2, getFG_l(), getFG_h());
    title.drawButton();
  }
  
  //Initialize the start button
  public void setStart(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    start = new Button(x_cor, y_cor, b_length, b_height, text, text_size);
  }
  
  //Initialize the help button 
  public void setHelp(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    help = new Button(x_cor, y_cor, b_length, b_height, text, text_size);
  }
  
  //Initialize the title (the title is just a button that isn't checked to see
  //if it's clicked)
  public void setTitle(int x_cor, int y_cor, int b_length, int b_height, String text, int text_size) {
    title = new Button(x_cor, y_cor, b_length, b_height, text, text_size);
  }
  
  //Check to see which buttons are clicked or hovered over
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