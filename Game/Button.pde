class Button implements IDrawable, IMouseListener {
  PImage img;
  int x, y, priority;
  Runnable onMousePressed, onMouseReleased;
  public Button(String img, int x, int y, int w, int h, int priority, Runnable onMousePressed, Runnable onMouseReleased){
    this.img = loadImage(img);
    this.img.resize(w, h);
    this.priority = priority; 
    this.x = x;
    this.y = y;
    this.onMousePressed = onMousePressed;
    this.onMouseReleased = onMouseReleased;
  }
  
  public void Display(){
    image(img, x, y);
  }
  
  public int GetPriority(){
    return priority;
  }
  
  
  public void OnMousePressed(){
    //if(this.onMousePressed)
  }
  
  public void OnMouseReleased(){
    
  }
  
  
  
}
