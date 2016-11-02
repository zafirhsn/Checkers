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