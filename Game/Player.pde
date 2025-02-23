



public class Player extends GameElement implements IInputListener {
  float x, y;
  boolean up,down,left,right;
  int speed;
  public Player(Coordinates coords){
    super(3);
    x = coords.getRow();
    y = coords.getCol();
    speed = 5;
  }
  
  public int GetX(){
    return (int)x; 
  }

  public int GetY(){
    return (int)y; 
  }
  
  public void Update(){
    Move();
  }
  
  @Override
  public void Display(){
    rect(x,y,20,20);
  }
  
  public void OnKeyAction(char input, boolean pressed){
    switch(input){
      case 'w':
        up = pressed;
        break;
      case 's':
        down = pressed;
        break;
      case 'a':
        left = pressed;
        break;
      case 'd':
        right = pressed;
        break;
    }
  }
  
  
  private void Move(){
       float nx = (left ? -1 : 0) + (right ? 1 : 0);
       float ny = (up ? -1 : 0) + (down ? 1 : 0);
       System.out.println("X: " + x + ", Y: " + y);
       float mult = (float) Math.sqrt(ny*ny + nx*nx);
       if(mult == 0) return;
       
       nx /= mult;
       ny /= mult;
       
       print(x,y);
       x += nx * speed;
       y += ny * speed;
       
  }
}
