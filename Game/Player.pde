



public class Player implements IInputListener {
  
  boolean up,down,left,right;
  
  public Player(){
    
  }
  
  void OnKeyPressed(char input){
    switch(Character.toLowerCase(input)){
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
    switch(Character.toLowerCase(input)){
      case 'w':
        up = false;
        break;
      case 's':
        down = false;
        break;
      case 'a':
        left = false;
        break;
      case 'd':
        right = false;
        break;
    }
  }
  
  void GetMovementVector(){
       
  }
}
