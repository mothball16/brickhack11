class DrawManager {
  boolean pauseRequested;
  HashMap<String,Button> buttons;
  ArrayList<IMouseListener> listeners;
  GameState prevState;
  public DrawManager(ArrayList<IMouseListener> listeners, GameState currentState){
    this.listeners = listeners;
    buttons = new HashMap<>();
    EnterState(currentState);
  }
  
  public void HandleDrawables(ArrayList<IDrawable> drawables){
     for(IDrawable drawable : drawables){
      drawable.Display();
    } 
  }
  
  public void DrawToScreen(ArrayList<IDrawable> drawables, GameState state){
    switch(state){
      case MainMenu:
        background(50);
        HandleDrawables(drawables);
        break;
      
      case Playing:
        background(100);
        pushMatrix();
        translate(-Camera.GetX() + width/2 - 10, -Camera.GetY() + height/2 - 10);
        HandleDrawables(drawables);
        popMatrix();
        break;
        
      case Paused:
        background(50);
        HandleDrawables(drawables);
        
        textAlign(CENTER,CENTER);
        textSize(50);
        text("PAUSED",width/2,height/2);

        break;
      
      
    }
    for(Button button : buttons.values()){
      button.Display();
    }
    
  }
  
  private void EnterState(GameState state){
     buttons.clear();
     switch(state){
        case MainMenu:
          buttons.put("play", new Button(listeners, "playbutton.png",20,20,160,40,1));
          break;
        case Playing:
          buttons.put("exit", new Button(listeners, "pause_default.png",width-60,20,40,40,1));
          break;
        
        case Paused:
          buttons.put("exit", new Button(listeners, "pause_hovering.png",width-60,20,40,40,1));
          break;
        
        case GameOver:
          break;
      } 
  }
  
  
  //called before display to do logic and determien state transitions
  public GameState Update(GameState state) {
    
    
    GameState nextState = state;
    switch (state) {
      case MainMenu:
       if(buttons.get("play").IsPressed()){
         nextState = GameState.Playing;
        }
        
        break;
      case Playing:
        Camera.Update(player.GetX(), player.GetY());
        player.Update();
        //fill, textalign, textsize, text
       if(buttons.get("exit").IsPressed()){
         nextState = GameState.Paused;
       }
        
        break;
      case Paused:
        //fill, textalign, textsize, text
        if(buttons.get("exit").IsPressed()){
         nextState = GameState.Playing;
        }
        
        break;
      case GameOver:
        break;
     
    }
    
    if(prevState != nextState){
      EnterState(nextState);
    }
    
    prevState = state;
    return nextState;
  } 
}
