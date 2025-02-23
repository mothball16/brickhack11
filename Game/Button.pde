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
  
  public void OnMousePressed(){
<<<<<<< HEAD
    //if(this.onMousePressed)
=======
    if(CheckOverlap(mouseX,mouseY)){
      isPressed = true;
      //if(onMousePressed != null) onMousePressed.run(); 
    }
>>>>>>> e60e75b0841d0dd6cfac77369d19655a59700c52
  }
  
  public void OnMouseReleased(){
    if(isPressed){
      isPressed = false;
    //  if(onMouseReleased != null) onMouseReleased.run(); 
    }
  }
  
  
  
}
