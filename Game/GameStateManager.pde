class DrawManager {
  boolean pauseRequested;
  HashMap<String,Button> buttons;
  ArrayList<IMouseListener> listeners;
  GameState prevState;
  GuardManager guardManager = new GuardManager();
  
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
        drawCameraOverlay(true);
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
        player.Update(map);
        guardManager.moveAllGuards(new Coordinates((int)player.GetX(), (int)player.GetY()));
        
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
  
  public void drawCameraOverlay(Boolean gameRunning) {
    stroke(255);
    strokeWeight(width/(width/3));
  
    //External corners
    int ratioedWidthGap = width/(width/15);
    int ratioedHeightGap = height/(height/15);
    //top left
    line(ratioedWidthGap, ratioedHeightGap, ratioedWidthGap+(height/6), ratioedHeightGap);
    line(ratioedWidthGap, ratioedHeightGap, ratioedWidthGap, ratioedHeightGap+(height/6));
    //top right
    line(width - ratioedWidthGap, ratioedHeightGap, (width - ratioedWidthGap)-(height/6), ratioedHeightGap);
    line(width - ratioedWidthGap, ratioedHeightGap, width - ratioedWidthGap, ratioedHeightGap+(height/6));
    //bottom left
    line(ratioedWidthGap, height - ratioedHeightGap, ratioedWidthGap+(height/6), height - ratioedHeightGap);
    line(ratioedWidthGap, height - ratioedHeightGap, ratioedWidthGap, (height - ratioedHeightGap)-(height/6));
    //bottom right
    line(width - ratioedWidthGap, height - ratioedHeightGap, (width - ratioedWidthGap)-(height/6), height - ratioedHeightGap);
    line(width - ratioedWidthGap, height - ratioedHeightGap, width - ratioedWidthGap, (height - ratioedHeightGap)-(height/6));
  
    //Rec graphic and text

    if (gameRunning) {
      fill(255, 0, 0);
      circle(55, 55, 40);
      fill(255, 255, 255);
      PFont arial = createFont("arial.ttf", 45);
      textFont(arial);
      text("REC", 85, 71);
    } else {
      fill(0, 0, 0);
      circle(55, 55, 40);
      fill(255, 255, 255);
      PFont arial = createFont("arial.ttf", 45);
      textFont(arial);
      text("STOP", 85, 71);
    }
    
    //Internal corners
    strokeWeight(1);
    ratioedWidthGap = width/(width/250) + width/8;
    ratioedHeightGap = height/(height/170) + height/10;
    //top left
    line(ratioedWidthGap, ratioedHeightGap, ratioedWidthGap+(height/20), ratioedHeightGap);
    line(ratioedWidthGap, ratioedHeightGap, ratioedWidthGap, ratioedHeightGap+(height/20));
    //top right
    line(width - ratioedWidthGap, ratioedHeightGap, (width - ratioedWidthGap)-(height/20), ratioedHeightGap);
    line(width - ratioedWidthGap, ratioedHeightGap, width - ratioedWidthGap, ratioedHeightGap+(height/20));
    //bottom left
    line(ratioedWidthGap, height - ratioedHeightGap, ratioedWidthGap+(height/20), height - ratioedHeightGap);
    line(ratioedWidthGap, height - ratioedHeightGap, ratioedWidthGap, (height - ratioedHeightGap)-(height/20));
    //bottom right
    line(width - ratioedWidthGap, height - ratioedHeightGap, (width - ratioedWidthGap)-(height/20), height - ratioedHeightGap);
    line(width - ratioedWidthGap, height - ratioedHeightGap, width - ratioedWidthGap, (height - ratioedHeightGap)-(height/20));
    
    //Battery
    ratioedWidthGap = width - (width/(width/15)+63);
    ratioedHeightGap = height/(height/15)+20;
    //Battery outline
    fill(0, 0, 0);
    strokeWeight(4);
    rect(ratioedWidthGap, ratioedHeightGap, 43, 20, 6);
    //Battery positive terminal representation
    fill(255, 255, 255);
    strokeWeight(2);
    rect(ratioedWidthGap+48, ratioedHeightGap+4, 3, 12, 6);
    //Battery inside/fill indicator
    beginShape();
    vertex(ratioedWidthGap+5, ratioedHeightGap+15);
    vertex(ratioedWidthGap+5, ratioedHeightGap+5);
    vertex(ratioedWidthGap+20, ratioedHeightGap+5);
    vertex(ratioedWidthGap+28, ratioedHeightGap+15);
    vertex(ratioedWidthGap+5, ratioedHeightGap+15);
    vertex(ratioedWidthGap+5, ratioedHeightGap+5);
    endShape();
  }
  
}
