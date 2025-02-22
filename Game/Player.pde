public class Player implements IInputListener {
  
  boolean up,down,left,right;
  
  public Player(){
    
  }
  
  void OnKeyPressed(char input){
    switch(input){
      case 'w':
        up = true;
        break;
      case 's':
        down = true;
        break;
      case 'a':
        left = true;
        break;
      case 'd':
        right = true;
        break;
      
    }
  }
  
  void OnKeyReleased(char input){
    print(input);
  }
  
  void GetMovementVector(){
    
  }
}
