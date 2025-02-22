//container for an image w/ methods/properties related to tile n stuff
//map handles the drawing of tiles, so IDrawable not implemented



public class Tile implements Cloneable {  
  PImage img;
  boolean collidable;
  
  public Tile(boolean collidable){
    this.collidable = collidable;
  }
  
  public Tile(String img, boolean collidable){
    this.img = loadImage(img);
    this.collidable = collidable;
  }
  
  public void DisplayAt(int x, int y, int buffer){
      if(img == null){
        rect(x,y,buffer,buffer);
        return;
      }
      image(img, x, y);
  }
  
  public boolean GetCollidable(){ 
    return collidable;
  }
  
  public void OnEnter() {}
  
  public void OnLeave() {}
  
  public void WhileEntered() {}
  
  @Override
  public Tile clone()
  throws CloneNotSupportedException {
      return (Tile) super.clone();
  } 
}
