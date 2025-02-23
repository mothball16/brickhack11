class GameStateManager implements IInputListener, IMouseListener {
  boolean pauseRequested;
  void display(GameState state) {
    timer--;
    if (timer == 0) {
      state = GameState.GameOver;
    }
    switch (state) {
    case MainMenu:
      //fill, textalign, textsize, text
      
      break;
    case Playing:
      //fill, textalign, textsize, text
      if(pauseRequested){
        state = GameState.Paused;
      }  
        
      break;
    case Paused:
      //fill, textalign, textsize, text
      break;
    case GameOver:
      //fill, textalign, textsize, text
      break;
    }
  }
  
  public void OnKeyPressed(char input){
    switch(Character.toLowerCase(input)){
      case 'p':
        pauseRequested = true;
        break;
    }
  }
  
  public void OnKeyReleased(char input){
    switch(Character.toLowerCase(input)){
      case 'p':
        pauseRequested = false;
        break;
    }
  }
  public void OnMousePressed(){
    
  }
  
  public void OnMouseReleased(){
    
  }
}
