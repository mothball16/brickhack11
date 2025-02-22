abstract class Button implements IDrawable, IMouseListener {
  PImage img;
  int x, y, priority;
  public Button(String img, int x, int y, int w, int h, int priority){
    this.img = loadImage(img);
    this.img.resize(w, h);
    this.priority = priority; 
    this.x = x;
    this.y = y;
  }
  
  public void Display(){
    image(img, x, y);
  }
  
  public int GetPriority(){
    return priority;
  }
  
  
  
  
}
