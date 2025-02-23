public class Button implements IDrawable, IMouseListener {
  PImage img;
  int x, y, w, h, priority;
  boolean isPressed;
  public Button(ArrayList<IMouseListener> listeners, String img, int x, int y, int w, int h, int priority){
    
    this.priority = priority; 
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    SetImage(img);
    listeners.add(this);
  }
  
  public void Display(){
    image(img, x, y);
  }
  
  public int GetPriority(){
    return priority;
  }
  
  public boolean IsPressed(){
    return isPressed; 
  }
  
  private boolean CheckOverlap(int mx, int my){
    return (mx > x && mx < x + w && my > y && my < y + h);
  }
  public void SetImage(String img){
    this.img = loadImage((img != null) ? img : "green.png");
    this.img.resize(w, h);
  }
  
  public void OnMouseAction(boolean pressed){
    if(pressed){
      if(CheckOverlap(mouseX,mouseY)){
        isPressed = true;
        //if(onMousePressed != null) onMousePressed.run(); 
      }  
    } else {
      if(isPressed){
        isPressed = false;
      //  if(onMouseReleased != null) onMouseReleased.run(); 
      }      
      
    }
    

  }
 
  
  
}
