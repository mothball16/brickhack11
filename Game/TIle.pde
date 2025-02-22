//container for an image w/ methods/properties related to tile n stuff
//map handles the drawing of tiles, so IDrawable not implemented
abstract class Tile {  
  PImage img;
  boolean collidable;
  
  Tile(String img){
    this.img = loadImage(img);
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
  
}
