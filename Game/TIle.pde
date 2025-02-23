//container for an image w/ methods/properties related to tile n stuff
//map handles the drawing of tiles, so IDrawable not implemented



public class Tile implements Cloneable {  
  PImage img;
  boolean collidable, opaque;
  int id;
  
  public Tile(String img, boolean collidable, boolean opaque){
    this(loadImage(img), collidable, opaque,1);
    
  }
  public Tile(PImage img, boolean collidable, boolean opaque, int id){
    this.collidable = collidable;
    this.opaque = opaque;
    this.img = img;
    this.id = id;
    img.resize(32,32);
  }

  public void DisplayAt(int x, int y, int buffer, int heightDiff){
      if(img == null){
        rect(x,y,buffer,buffer);
        return;
      }
      image(img, x, y);
      textSize(20);
      text(id,x,y);
      
      fill(0,0,0,1-heightDiff/2);
      rect(x,y, buffer,buffer);
      
  }

  public boolean GetOpaque(){ 
    return opaque;
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
