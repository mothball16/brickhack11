//container for an image w/ methods/properties related to tile n stuff
//map handles the drawing of tiles, so IDrawable not implemented



abstract class Tile implements Cloneable {  
  PImage img;
  boolean collidable;
  
  Tile(String img, boolean collidable){
    this.img = loadImage(img);
    this.collidable = collidable;
  }
  
  public void DisplayAt(int x, int y){
      image(img, x, y);
  }
  
  public boolean GetCollidable(){ 
    return collidable;
  }
  
  public abstract void OnEnter();
  
  public abstract void OnLeave();
  
  public abstract void WhileEntered();
  
  @Override
  public Tile clone()
  throws CloneNotSupportedException {
      return (Tile) super.clone();
  } 
}
